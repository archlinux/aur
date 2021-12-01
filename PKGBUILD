# Maintainer: Martchus <martchus@gmx.net>
# Contributor: ant32 <antreimer@gmail.com>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

# All patches are managed at https://github.com/Martchus/mariadb-connector-c

pkgname=mingw-w64-mariadb-connector-c
pkgver=3.2.5
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
sha256sums=('edf1e1035c020c23874561cab3f97fd1d8ed11221c47177a1bc178eb971fd351'
            'd02c889df8abc14cb84a50732e3a407deb842d189bbe20380dcd89d4d9367a38'
            '52ff1b3588b03d7db03ff9fed22560f413f0cb8c1f4daec871c2946151f8f7b8')

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
