# Maintainer: Aaron Bishop < erroneous at gmail >

pkgname=mariadb-connector-odbc-git
conflicts=('mariadb-connector-odbc' 'mariadb-connector-odbc-bin')
provides=('mariadb-connector-odbc')
pkgver=3.2.8.r4.g5c60284c
pkgrel=1
pkgdesc="A standardized, LGPL licensed ODBC database driver for MariaDB (git version)"
arch=('x86_64' 'armv7h')
url="https://mariadb.com/kb/en/mariadb/mariadb-connector-odbc/"
license=('LGPL')
depends=('unixodbc>=2.3' 'openssl' 'zlib' 'mariadb-libs')
makedepends=('git' 'cmake')
source=("${pkgname}::git+https://github.com/mariadb-corporation/mariadb-connector-odbc.git")
sha256sums=('SKIP')
install=mariadb-connector-odbc-git.install

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd $pkgname
    git submodule init
    git submodule update
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
        -DWITH_UNIT_TESTS=OFF \
        ../$pkgname
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
