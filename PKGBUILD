# Maintainer: Martchus <martchus@gmx.net>
# Contributor: ant32 <antreimer@gmail.com>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

# All patches are managed at https://github.com/Martchus/mariadb-connector-c

pkgname=mingw-w64-mariadb-connector-c
pkgver=3.1.9
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
  "http://archive.mariadb.org/connector-c-$pkgver/mariadb-connector-c-$pkgver-src.tar.gz"
  '0001-Fix-mingw-w64-build.patch'
  '0002-Enable-pkg-config-for-mingw-w64-build.patch'
)
sha256sums=('108d99bf2add434dcb3bd9526ba1d89a2b9a943b62dcd9d0a41fcbef8ffbf2c7'
            'd97e7c6ca57ee9b81d67a37e63733d1a4f77067fcf3facd2cd36c9fb08627d53'
            '7ccbafee1f63c510234038ed21448a40b9cf6c2361359502a8ce67122883e2e7')

_architectures='i686-w64-mingw32 x86_64-w64-mingw32'

prepare() {
  cd "$srcdir/mariadb-connector-c-$pkgver-src/"
  for patch in "$srcdir/"*.patch; do
    patch -p1 -i "$patch"
  done
}

build() {
  unset LDFLAGS
  cd "$srcdir/mariadb-connector-c-$pkgver-src/"
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
    cd "${srcdir}/mariadb-connector-c-$pkgver-src/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    ln -s mariadb "$pkgdir"/usr/${_arch}/include/mysql
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/lib/plugin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
