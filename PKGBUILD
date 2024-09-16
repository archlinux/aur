# Maintainer: Aaron Bishop < erroneous at gmail >

pkgname=mariadb-connector-odbc
conflicts=('mariadb-connector-odbc-bin')
pkgver=3.2.3

pkgrel=2
pkgdesc="A standardized, LGPL licensed ODBC database driver for MariaDB"
arch=('x86_64' 'armv7h')
url="https://mariadb.com/kb/en/mariadb/mariadb-connector-odbc/"
license=('LGPL')
depends=('unixodbc>=2.3' 'openssl' 'zlib' 'mariadb-libs')
makedepends=('git' 'cmake')
source=("https://downloads.mariadb.com/Connectors/odbc/connector-odbc-${pkgver}/mariadb-connector-odbc-${pkgver}-src.tar.gz"
        "odbc-438.patch")
sha256sums=('a2925063f0eefa5258cafe1a8bbec1582a0ea5ca43e7a78496b150fa1c021b62'
            '43638a910f081b63b6f2773d5ce296f26e1e1daafaf0bcee28aeb25be24cf4c1')
install=mariadb-connector-odbc.install

prepare() {
    cd $pkgname-$pkgver-src
    # Arch is still installing libs to /usr/include/mysql while mariadb is expecting them at /usr/include/mariadb
    sed -i -e 's#/usr/include/mariadb#/usr/include/mysql#g' CMakeLists.txt
    patch -p1 < ../odbc-438.patch
    cd ..
    rm -Rf build
    mkdir build
}

build() {
    cd build
    cmake \
        -DCMAKE_BUILD_TYPE=RELEASE \
        -DMARIADB_LINK_DYNAMIC=ON \
        -DUSE_SYSTEM_INSTALLED_LIB=ON \
        -DINSTALL_LIB_SUFFIX=lib \
        -DCMAKE_INSTALL_PREFIX=/usr \
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
