# Maintainer: Aaron Bishop < erroneous at gmail >

pkgname=mariadb-connector-odbc
conflicts=('mariadb-connector-odbc-bin')
pkgver=3.1.11
_c_pkgver=3.1.11
pkgrel=1
pkgdesc="A standardized, LGPL licensed ODBC database driver for MariaDB"
arch=('x86_64' 'armv7h')
url="https://mariadb.com/kb/en/mariadb/mariadb-connector-odbc/"
license=('LGPL')
depends=('unixodbc>=2.3' 'openssl' 'zlib')
makedepends=('git' 'cmake')
source=("https://downloads.mariadb.org/interstitial/connector-odbc-${pkgver}/${pkgname}-${pkgver}-ga-src.tar.gz"
        "https://downloads.mariadb.org/interstitial/connector-c-${_c_pkgver}/mariadb-connector-c-${_c_pkgver}-src.tar.gz")
sha256sums=('d81a35cd9c9d2e1e732b7bd9ee704eb83775ed74bcc38d6cd5d367a3fc525a34'
            '3e6f6c399493fe90efdc21a3fe70c30434b7480e8195642a959f1dd7a0fa5b0f')

install=mariadb-connector-odbc.install

prepare() {
    cd $pkgname-$pkgver-ga-src
    [ -d libmariadb ] || ln -s ../mariadb-connector-c-${_c_pkgver}-src libmariadb
    cd ..
    rm -Rf build
    mkdir build
}

build() {
    cd build
    cmake \
        -DCMAKE_BUILD_TYPE=RELEASE \
        -DWITH_EXTERNAL_ZLIB=ON \
        -DWITH_OPENSSL=ON \
        -DWITH_SSL=OPENSSL \
        -DINSTALL_LIB_SUFFIX=lib \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DMARIADB_UNIX_ADDR=/run/mysqld/mysqld.sock \
        ../$pkgname-$pkgver-ga-src
    make
}

package() {
    cd build
    DESTDIR="$pkgdir" cmake -DCOMPONENT=ODBCLibs -P cmake_install.cmake
}
