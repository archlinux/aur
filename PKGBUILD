# Maintainer: Martchus <martchus@gmx.net>
# Contributor: ant32 <antreimer@gmail.com>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

# All patches are managed at https://github.com/Martchus/mariadb-connector-c

pkgname=mingw-w64-mariadb-connector-c
pkgver=3.2.6
pkgrel=1
pkgdesc='MariaDB Connector/C is used to connect applications developed in C/C++ to MariaDB and MySQL databases (mingw-w64)'
arch=('any')
url='https://mariadb.com/kb/en/mariadb/about-mariadb-connector-c'
license=('LGPL')
replaces=('mingw-w64-libmariadbclient')
conflicts=('mingw-w64-libmariadbclient')
provides=("mingw-w64-libmariadbclient=$pkgver")
depends=('mingw-w64-crt' 'mingw-w64-openssl' 'mingw-w64-zlib' 'mingw-w64-curl')
makedepends=('mingw-w64-cmake')
options=('!strip' '!buildflags' 'staticlibs')
source=(
  "https://github.com/mariadb-corporation/mariadb-connector-c/archive/refs/tags/v$pkgver.tar.gz"
  '0001-Fix-mingw-w64-build.patch'
  '0002-Enable-pkg-config-for-mingw-w64-build.patch'
)
sha256sums=('d9aee070e1d954074a70eff1cfd2d6c6bc5d190dc00075975a55d4f3e1ac20c5'
            '88912c97b33ab86835f10f37ce7a67e11d489dedfd65d0696aba85680d0d3805'
            'c405499b0812a2792a2c6a419b2061c8e280bda74049dba9a018576ed1a332e6')

_architectures='i686-w64-mingw32 x86_64-w64-mingw32'

prepare() {
  cd "$srcdir/mariadb-connector-c-${pkgver}"
  for patch in "$srcdir/"*.patch; do
    patch -p1 -i "$patch"
  done
}

build() {
  unset LDFLAGS
  cd "$srcdir/mariadb-connector-c-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      -DCMAKE_BUILD_TYPE=RELEASE \
      -DWITH_EXTERNAL_ZLIB=ON \
      -DWITH_SSL=OPENSSL \
      -DWITH_MYSQLCOMPAT=ON \
      -DWITH_UNIT_TESTS=OFF \
      ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/mariadb-connector-c-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    ln -s mariadb "$pkgdir"/usr/${_arch}/include/mysql
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/lib/plugin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
