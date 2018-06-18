# Maintainer: Aaron Bishop < erroneous at gmail >

pkgname=mariadb-connector-odbc
conflicts=('mariadb-connector-odbc-bin')
pkgver=3.0.5
pkgrel=2
pkgdesc="MariaDB Connector/ODBC is a standardized, LGPL licensed database driver using the industry standard ODBC API"
arch=('x86_64' 'i686')
url="https://mariadb.com/kb/en/mariadb/mariadb-connector-odbc/"
license=('LGPL')
depends=('unixodbc>=2.3' 'openssl')
makedepends=()
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
    make
}

package() {
    cd build
    make DESTDIR="${pkgdir}" install
    mv "${pkgdir}/usr/lib64" "${pkgdir}/usr/lib"
}
