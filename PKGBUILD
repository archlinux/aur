# Maintainer: Aaron Bishop < erroneous at gmail >

pkgname=mariadb-connector-odbc
conflicts=('mariadb-connector-odbc-bin')
pkgver=3.2.9

pkgrel=1
pkgdesc="A standardized, LGPL licensed ODBC database driver for MariaDB"
arch=('x86_64' 'armv7h')
url="https://mariadb.com/kb/en/mariadb/mariadb-connector-odbc/"
license=('LGPL-2.1-only')
depends=(
    'unixodbc>=2.3'
    'openssl'
    'zlib'
    'mariadb-libs'
    'glibc'
    'libgcc_s.so'
    'libstdc++.so'
)
makedepends=('git' 'cmake')
source=("https://dlm.mariadb.com/4785756/Connectors/odbc/connector-odbc-${pkgver}/mariadb-connector-odbc-${pkgver}-src.tar.gz")
sha256sums=('5062f491f7189ba32352a9834777886dfbc64a107bb0e2e50921dd6ae2bd18ad')
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
    export CXXFLAGS="${CXXFLAGS} -include cstdint"
    cmake \
        -DCMAKE_BUILD_TYPE=RELEASE \
        -DMARIADB_LINK_DYNAMIC=ON \
        -DUSE_SYSTEM_INSTALLED_LIB=ON \
        -DINSTALL_LIB_SUFFIX=lib \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_POLICY_VERSION_MINIMUM=3.12 \
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
