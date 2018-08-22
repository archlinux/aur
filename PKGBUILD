# Maintainer: Aaron Bishop < erroneous at gmail >

pkgname=mariadb-connector-odbc
conflicts=('mariadb-connector-odbc-bin')
pkgver=3.0.6
pkgrel=1
pkgdesc="MariaDB Connector/ODBC is a standardized, LGPL licensed database driver using the industry standard ODBC API"
arch=('x86_64' 'i686')
url="https://mariadb.com/kb/en/mariadb/mariadb-connector-odbc/"
license=('LGPL')
depends=('unixodbc>=2.3' 'openssl')
makedepends=('git' 'cmake')
options=('staticlibs')
source=("https://downloads.mariadb.org/interstitial/connector-odbc-${pkgver}/${pkgname}-${pkgver}-ga-src.tar.gz"
        "https://downloads.mariadb.org/interstitial/connector-c-${pkgver}/mariadb-connector-c-${pkgver}-src.tar.gz")

sha256sums=('1b45b801774ea356f56ca7eb5dc5d58df8c0e61893c9f9901c4d716e34d5d71d'
            '2b2d18dc969dc385f7f740e4db112300e11bc626c9ba9aa05c284704095b9e48')

install=mariadb-connector-odbc.install

prepare() {
    cd $pkgname-$pkgver-ga-src
    [ -d libmariadb ] || ln -s ../mariadb-connector-c-$pkgver-src libmariadb
    cd ..
    rm -Rf build
    mkdir build
    cd build
    cmake ../$pkgname-$pkgver-ga-src \
        -G"Unix Makefiles" \
        -DWITH_OPENSSL=ON \
        -DCMAKE_BUILD_TYPE=release \
        -DCMAKE_INSTALL_PREFIX=/usr
}

build() {
    cd build
    make
}

package() {
    cd build
    DESTDIR="$pkgdir" cmake -DCOMPONENT=ODBCLibs -P cmake_install.cmake
    DESTDIR="$pkgdir" cmake -DCOMPONENT=Documentation -P cmake_install.cmake
    cd "$pkgdir"
    mv usr/share/doc/{mariadb_connector_odbc,$pkgname}
    [ -d usr/lib64 ] && mv usr/lib64 usr/lib
    mkdir -p usr/share/licenses/$pkgname
    mv usr/share/doc/$pkgname/COPYING usr/share/licenses/$pkgname/COPYING
}
