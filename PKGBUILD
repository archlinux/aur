# Maintainer: Aaron Bishop < erroneous at gmail >

pkgname=mariadb-connector-odbc
conflicts=('mariadb-connector-odbc-bin')
pkgver=3.1.17
_c_pkgver=3.3.2

pkgrel=2
pkgdesc="A standardized, LGPL licensed ODBC database driver for MariaDB"
arch=('x86_64' 'armv7h')
url="https://mariadb.com/kb/en/mariadb/mariadb-connector-odbc/"
license=('LGPL')
depends=('unixodbc>=2.3' 'openssl' 'zlib' 'mariadb-libs')
makedepends=('git' 'cmake')
source=("https://downloads.mariadb.com/Connectors/odbc/connector-odbc-${pkgver}/mariadb-connector-odbc-${pkgver}-src.tar.gz")
sha256sums=('d2eb92f1dd3eecc6e721a8172b6455afef77505a344a3d5e260ee2f7a02a6efc')
install=mariadb-connector-odbc.install

prepare() {
    cd $pkgname-$pkgver-src
    # Arch is still installing libs to /usr/include/mysql while mariadb is expecting them at /usr/include/mariadb
    sed -i -e 's#/usr/include/mariadb#/usr/include/mysql#g' CMakeLists.txt
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
