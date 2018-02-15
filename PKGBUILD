# Contributor: BluePeril <blueperil (at) blueperil _dot_ de>

pkgname=mariadb-connector-c
pkgver=3.0.3
pkgrel=1
pkgdesc="MariaDB Connector/C is used to connect applications developed in C/C++ to MariaDB and MySQL databases."
arch=('i686' 'x86_64')
url="https://mariadb.com/kb/en/mariadb/about-mariadb-connector-c/"
license=("LGPL")
depends=('openssl' 'zlib')
makedepends=('cmake')
source=("https://downloads.mariadb.org/interstitial/connector-c-${pkgver}/mariadb-connector-c-${pkgver}-src.tar.gz")
sha1sums=('62893066d6fcd2d63075ca04a2a389b3ea6009fc')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}-src"

    rm -rf build
    mkdir build
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}-src/build"

    cmake \
        -DCMAKE_BUILD_TYPE=RELEASE \
        -DWITH_EXTERNAL_ZLIB=ON \
        -DWITH_SQLITE=OFF \
        -DWITH_OPENSSL=ON \
        -DWITH_MYSQLCOMPAT=ON \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DMYSQL_UNIX_ADDR=/run/mysqld/mysqld.sock \
        ..
    make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}-src/build"

  make DESTDIR="${pkgdir}" install
  # for compatibility with mariadb-connector-c version 2 and other programs (e.g. teamspeak-server)
  ln -sf /usr/lib/mariadb/libmariadb.so.3 ${pkgdir}/usr/lib/mariadb/libmariadb.so.2
}

# vim:set ts=2 sw=2 et:
