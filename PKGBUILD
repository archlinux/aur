# Maintainer: Aaron Bishop < erroneous at gmail >

pkgname=mariadb-connector-odbc
conflicts=('mariadb-connector-odbc-bin')
pkgver=3.1.17
_c_pkgver=3.3.2

pkgrel=1
pkgdesc="A standardized, LGPL licensed ODBC database driver for MariaDB"
arch=('x86_64' 'armv7h')
url="https://mariadb.com/kb/en/mariadb/mariadb-connector-odbc/"
license=('LGPL')
depends=('unixodbc>=2.3' 'openssl' 'zlib')
makedepends=('git' 'cmake')
source=("https://downloads.mariadb.com/Connectors/odbc/connector-odbc-${pkgver}/mariadb-connector-odbc-${pkgver}-src.tar.gz"
        "https://downloads.mariadb.com/Connectors/c/connector-c-${_c_pkgver}/mariadb-connector-c-${_c_pkgver}-src.tar.gz")
sha256sums=('d2eb92f1dd3eecc6e721a8172b6455afef77505a344a3d5e260ee2f7a02a6efc'
            '7e0722e07d30bb906fac9fe10fb582cde1e148e05a83d9ca7b6fcc884b68fbce')
install=mariadb-connector-odbc.install

prepare() {
    cd $pkgname-$pkgver-src
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
        ../$pkgname-$pkgver-src
    make
}

package() {
    cd build
    DESTDIR="$pkgdir" cmake -DCOMPONENT=ODBCLibs -P cmake_install.cmake
    if [ -f "$pkgdir/usr/lib/mariadb/libmaodbc.so" ]; then
        mv "$pkgdir/usr/lib/mariadb/libmaodbc.so" "$pkgdir/usr/lib/libmaodbc.so"
        rmdir "$pkgdir/usr/lib/mariadb"
    fi
}
