# Maintainer: Aaron Bishop < erroneous at gmail >

pkgname=mariadb-connector-odbc
conflicts=('mariadb-connector-odbc-bin')
pkgver=2.0.14
pkgrel=1
pkgdesc="MariaDB Connector/ODBC is a standardized, LGPL licensed database driver using the industry standard ODBC API"
arch=('x86_64' 'i686')
url="https://mariadb.com/kb/en/mariadb/mariadb-connector-odbc/"
license=('LGPL')
depends=('unixodbc' 'openssl')
makedepends=('mariadb-connector-c')
options=('staticlibs')

source=("https://downloads.mariadb.org/interstitial/connector-odbc-${pkgver}/source/${pkgname}-${pkgver}-ga-src.tar.gz")

sha1sums=('781ea13a1579fbe67c394253b11611b9d0d8091e')

install=mariadb-connector-odbc.install

prepare() {
    _src="$srcdir/$pkgname-$pkgver-ga-src"
    rm -Rf build
    mkdir build
    cd build
    cmake ../$pkgname-$pkgver-ga-src \
      -DCMAKE_BUILD_TYPE=RELEASE \
      -DWITH_EXTERNAL_ZLIB=ON \
      -DWITH_SQLITE=OFF \
      -DWITH_OPENSSL=ON \
      -DWITH_MYSQLCOMPAT=ON \
      -DCMAKE_INSTALL_PREFIX=/usr
}

build() {
    cd build
    make
}

package() {
    cd build
    make DESTDIR="${pkgdir}" install
    mv "${pkgdir}/usr/lib64" "${pkgdir}/usr/lib"
}
