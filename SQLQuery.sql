-- KUSHA YOUTUBE KANALI
USE Northwind

-- SELECT
SELECT * FROM Musteriler

SELECT SirketAdi,MusteriAdi,MusteriUnvani,Adres 
FROM Musteriler

SELECT [MusteriID], [SirketAdi], [MusteriAdi], [MusteriUnvani], [Adres], [Sehir], [Bolge], [PostaKodu], [Ulke], [Telefon], [Faks]
FROM Musteriler

SELECT SevkUlkesi
FROM Satislar


-- WHERE AND OR IN LIKE --
SELECT SevkAdi,SevkAdresi,SevkSehri,SevkUlkesi FROM Satislar
WHERE SevkUlkesi='France' AND SevkSehri='Lille'


SELECT SevkAdi,SevkAdresi,SevkSehri,SevkUlkesi
FROM Satislar
WHERE SevkUlkesi = 'France' OR SevkUlkesi = 'Brazil'

SELECT * FROM Satislar
WHERE SevkSehri = 'Köln' OR SevkSehri = 'London'

SELECT SevkAdi,SevkAdresi,SevkSehri,SevkUlkesi 
FROM Satislar
WHERE SevkUlkesi IN('France','Brazil')

SELECT * FROM Satislar
WHERE NakliyeUcreti >= 50 AND NakliyeUcreti <= 100

SELECT * FROM Satislar
WHERE NakliyeUcreti BETWEEN 50 AND 100

SELECT SevkAdi FROM Satislar
WHERE SevkAdi LIKE 'a%'

SELECT SevkAdi FROM Satislar
WHERE SevkAdi LIKE '%a'

SELECT SevkAdi FROM Satislar
WHERE SevkAdi LIKE 'w%a'

SELECT * FROM Satislar
WHERE SevkAdi LIKE '__a%'

-- ORDER BY

SELECT * FROM Satislar
ORDER BY SevkUlkesi ASC

SELECT * FROM Satislar
ORDER BY SevkUlkesi DESC

SELECT * FROM Satislar
ORDER BY SevkUlkesi,NakliyeUcreti

SELECT * FROM Satislar
ORDER BY 
SevkUlkesi ASC,
NakliyeUcreti DESC


-- DISTINCT
SELECT DISTINCT SevkSehri FROM Satislar -- 70 row

SELECT DISTINCT SevkUlkesi FROM Satislar -- 21

SELECT DISTINCT MusteriID FROM Satislar -- 89

SELECT DISTINCT SevkUlkesi,SevkSehri FROM Satislar
ORDER BY SevkUlkesi,SevkSehri

SELECT SevkUlkesi, COUNT(DISTINCT SevkSehri) FROM Satislar
GROUP BY SevkUlkesi

--  COUNT SUM AVG MAX --

-- count
SELECT COUNT(*) FROM Satislar --> 830

SELECT COUNT(SevkBolgesi) FROM Satislar --> 323

SELECT COUNT(DISTINCT SevkSehri) FROM Satislar
SELECT DISTINCT SevkSehri FROM Satislar

SELECT COUNT(SevkPostaKodu) FROM Satislar --> 811

SELECT COUNT(SevkUlkesi) FROM Satislar
WHERE SevkUlkesi = 'Germany'

SELECT COUNT(SevkUlkesi) FROM Satislar
WHERE SevkUlkesi = 'USA'

SELECT COUNT(DISTINCT SevkSehri) FROM Satislar
WHERE SevkUlkesi = 'USA'

-- sum
SELECT SUM(NakliyeUcreti) AS TOPLAM_NAKLİYE FROM Satislar

SELECT SUM(NakliyeUcreti) AS Nakliye FROM Satislar
WHERE SevkUlkesi = 'Argentina'

-- max
SELECT MAX(NakliyeUcreti) FROM Satislar

SELECT MAX(NakliyeUcreti) FROM Satislar
WHERE SevkUlkesi = 'France'

-- avg
SELECT AVG(NakliyeUcreti) FROM Satislar

Select SUM(NakliyeUcreti) / count(NakliyeUcreti) FROM Satislar 


-- GROUP BY
SELECT SevkUlkesi From Satislar GROUP BY(SevkUlkesi)

SELECT SevkUlkesi, COUNT(SevkUlkesi) AS TEKRAR FROM Satislar GROUP BY(SevkUlkesi)

SELECT SevkSehri, MAX(NakliyeUcreti) FROM Satislar GROUP BY(SevkSehri)

SELECT SevkUlkesi,SevkSehri, SUM(NakliyeUcreti) AS Toplam_Nakliye FROM Satislar
GROUP BY SevkUlkesi,SevkSehri
ORDER BY SevkUlkesi,SevkSehri

SELECT SevkUlkesi,COUNT(*) AS SAY FROM Satislar
GROUP BY SevkUlkesi

SELECT SevkUlkesi, SevkSehri, SUM(NakliyeUcreti) AS SehirNakliyeToplam FROM Satislar
GROUP BY SevkUlkesi,SevkSehri
ORDER BY SevkUlkesi,SUM(NakliyeUcreti) DESC

SELECT SevkUlkesi,COUNT(DISTINCT SevkSehri) FROM Satislar
GROUP BY SevkUlkesi

SELECT SevkUlkesi,
AVG(NakliyeUcreti) as Ortalama_Nakliye,
COUNT(SevkUlkesi) as Satıs_Adeti,
SUM(NakliyeUcreti) as Satış_Toplam
FROM Satislar GROUP BY(SevkUlkesi)

select SevkUlkesi, count(distinct SevkSehri) from Satislar
group by SevkUlkesi


-- HAVING --

SELECT SevkUlkesi,COUNT(SevkUlkesi) AS TEKRAR,
SUM(NakliyeUcreti) AS TOPLAM_NAKLIYE, AVG(NakliyeUcreti) AS ORT_NAKLIYE
FROM Satislar
WHERE COUNT(SevkUlkesi) >= 20
GROUP BY SevkUlkesi
--↑↑ 
--An aggregate may not appear in the WHERE clause unless it is in a subquery contained in a 
--HAVING clause or a select list, and the column being aggregated is an outer reference.


SELECT SevkUlkesi, COUNT(SevkUlkesi) AS TEKRAR,
SUM(NakliyeUcreti) as TOPLAM_NAKLIYE, AVG(NakliyeUcreti) AS ORT_NAKLIYE
FROM Satislar
GROUP BY SevkUlkesi HAVING AVG(NakliyeUcreti) >= 40
ORDER BY AVG(NakliyeUcreti) ASC


SELECT SevkSehri, MAX(NakliyeUcreti) AS MAK_NAKLIYE,
COUNT(*) AS SATIS_ADET, MIN(NakliyeUcreti) AS MIN_NAKLIYE,
AVG(NakliyeUcreti) AS ORT_NAKLIYE, SUM(NakliyeUcreti) AS TOP_NAKLIYE
FROM Satislar
WHERE SevkUlkesi = 'USA'
GROUP BY SevkSehri HAVING MIN(NakliyeUcreti) >= 5


-- CREATE TABLE DROP TABLE --
--CREATE TABLE EXAMPLE_2(
--ID INT PRIMARY KEY,
--NAME_ NVARCHAR(50) NOT NULL,
--SURNAME VARCHAR(25) NOT NULL,
--BIRTHDATE DATE NOT NULL
--)

--DROP TABLE EXAMPLE_2


-- INSERT --
--INSERT INTO EXAMPLE_2
--(NAME_,SURNAME,BIRTHDATE)
--VALUES ('ÖZKAN', 'UGUR', '1999-04-25')

--INSERT INTO EXAMPLE_2
--VALUES('ALEYNA', 'KOC', '2000-03-12')

INSERT INTO 
EXAMPLE_2(NAME_,SURNAME,BIRTHDATE)
VALUES('Hasan','BARAN','11-02-2000')

-- UPDATE --
--UPDATE EXAMPLE_2
--SET NAME_ = 'ELİF', SURNAME = 'GÜNEŞ'
--WHERE NAME_ = 'ÖZKAN'


-- DELETE --
--DELETE FROM EXAMPLE_2
--WHERE BIRTHDATE BETWEEN '01-01-2000' AND '12-31-2001'

SELECT UR.UrunAdi,TE.SirketAdi AS TEDARIKCI_ADI FROM Urunler AS UR
INNER JOIN Tedarikciler TE ON UR.TedarikciID=TE.TedarikciID

SELECT * FROM Urunler
SELECT * FROM Tedarikciler