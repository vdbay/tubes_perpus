CREATE TABLE buku(
    buku_id VARCHAR2(10) PRIMARY KEY NOT NULL,
    judul_buku VARCHAR2(50) NOT NULL,        
    penulis_buku VARCHAR2(50) NOT NULL,
    tipe_buku VARCHAR2(25) NOT NULL,
    stok_buku NUMBER(3) NOT NULL
);

CREATE TABLE penerbit(
    penerbit_id VARCHAR2(10) PRIMARY KEY NOT NULL,
    nama_penerbit VARCHAR2(50) NOT NULL,
    alamat_penerbit VARCHAR2(50)
);

CREATE TABLE peminjaman(
    pinjam_id VARCHAR2(10) PRIMARY KEY NOT NULL,
    tanggal_pinjam DATE NOT NULL,
    tanggal_kembali DATE NOT NULL
);

-- CREATE TABLE customer(

-- );

CREATE TABLE dosen(
    nidn NUMBER(10) PRIMARY KEY NOT NULL,
    nama_dosen VARCHAR2(50) NOT NULL,
    gender_dosen VARCHAR2(6) NOT NULL,
    alamat_dosen VARCHAR2(50) NOT NULL
);

CREATE TABLE mahasiswa(
    nim NUMBER(9) PRIMARY KEY NOT NULL,
    nama_mahasiswa VARCHAR2(50) NOT NULL,
    gender_mahasiswa VARCHAR2(6) NOT NULL,
    alamat_mahasiswa VARCHAR2(50) NOT NULL
);

CREATE TABLE status(
    aktif_sampai DATE PRIMARY KEY NOT NULL,
    is_sanksi BOOLEAN(1) NOT NULL -- sanksi aktif/nonaktif
);

CREATE TABLE sanksi(
    sanksi_id VARCHAR2(10) PRIMARY KEY NOT NULL,
    jenis_sanksi BOOLEAN(1)
);

CREATE TABLE denda( -- total denda = jumlah_hari * denda_default
    denda_id VARCHAR2(10) PRIMARY KEY NOT NULL,
    jumlah_hari NUMBER(3) NOT NULL
);

CREATE TABLE ganti_buku(
    ganti_id VARCHAR2(10) PRIMARY KEY NOT NULL,
    id_buku VARCHAR2(10) NOT NULL,
    id_sanksi VARCHAR2(10) NOT NULL
);

ALTER TABLE ganti_buku
    ADD CONSTRAINT ganti_buku_buku_fk FOREIGN KEY (id_buku)
        REFERENCES buku(buku_id)
