# Maintainer: Aaron Bishop < erroneous at gmail >

pkgname=mariadb-connector-odbc
conflicts=('mariadb-connector-odbc-bin')
pkgver=3.0.8
pkgrel=1
pkgdesc="A standardized, LGPL licensed ODBC database driver for MariaDB"
arch=('x86_64' 'i686')
url="https://mariadb.com/kb/en/mariadb/mariadb-connector-odbc/"
license=('LGPL')
depends=('unixodbc>=2.3' 'openssl' 'zlib')
makedepends=('git' 'cmake')
options=('staticlibs')
source=("https://downloads.mariadb.org/interstitial/connector-odbc-${pkgver}/${pkgname}-${pkgver}-ga-src.tar.gz"
        "https://downloads.mariadb.org/interstitial/connector-c-${pkgver}/mariadb-connector-c-${pkgver}-src.tar.gz")

sha256sums=('a7f3b735b94d69bdbb7a2debcd92a1d002fdf7e96781ce137e48bb40b4033c6a'
            '2ca368fd79e87e80497a5c9fd18922d8316af8584d87cecb35bd5897cb1efd05')

install=mariadb-connector-odbc.install

prepare() {
    cd $pkgname-$pkgver-ga-src
    [ -d libmariadb ] || ln -s ../mariadb-connector-c-$pkgver-src libmariadb
    cd ..
    rm -Rf build
    mkdir build
}

build() {
    cd build
    cmake \
        -DCMAKE_BUILD_TYPE=RELEASE \
        -DWITH_EXTERNAL_ZLIB=ON \
        -DWITH_SQLITE=OFF \
        -DWITH_OPENSSL=ON \
        -DWITH_MYSQLCOMPAT=ON \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DMARIADB_UNIX_ADDR=/run/mysqld/mysqld.sock \
        ../$pkgname-$pkgver-ga-src
    make
}

package() {
    cd build
    DESTDIR="$pkgdir" cmake -DCOMPONENT=ODBCLibs -P cmake_install.cmake
    cd "$pkgdir"
    [ -d usr/lib64 ] && mv usr/lib64 usr/lib
}
