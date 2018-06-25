# Maintainer: Aaron Bishop < erroneous at gmail >

pkgname=mariadb-connector-odbc
conflicts=('mariadb-connector-odbc-bin')
pkgver=3.0.5
pkgrel=3
pkgdesc="MariaDB Connector/ODBC is a standardized, LGPL licensed database driver using the industry standard ODBC API"
arch=('x86_64' 'i686')
url="https://mariadb.com/kb/en/mariadb/mariadb-connector-odbc/"
license=('LGPL')
depends=('unixodbc>=2.3' 'openssl')
makedepends=('git' 'cmake')
options=('staticlibs')
source=("https://downloads.mariadb.org/interstitial/connector-odbc-${pkgver}/${pkgname}-${pkgver}-ga-src.tar.gz")

sha1sums=('c2b26efbc9332dec5322a5de70436e5516cda8fa')

install=mariadb-connector-odbc.install

prepare() {
    cd "$srcdir"
    rm -Rf build $pkgname-$pkgver-ga-src/CMakeCache.txt
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
    make maodbc
}

package() {
    # The cmake install is completely hosed right now so do it manually. It's only 3 files.
    cd "$pkgdir"
    mkdir -p usr/lib usr/share/licenses/$pkgname
    install "${srcdir}/build/libmaodbc.so" usr/lib/libmaodbc.so
    install "$srcdir/$pkgname-$pkgver-ga-src/COPYING" usr/share/licenses/$pkgname/COPYING
    install "$srcdir/$pkgname-$pkgver-ga-src/README" usr/share/licenses/$pkgname/README
}
