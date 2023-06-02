# Maintainer: Karl-Felix Glatzer <karl.glatzer@gmx.de>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=mingw-w64-cmocka
pkgver=1.1.7
pkgrel=1
pkgdesc='Elegant unit testing framework for C with support for mock objects (mingw-w64)'
url='https://cmocka.org/'
arch=('any')
license=('Apache')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-gcc' 'mingw-w64-cmake' 'mingw-w64-wine')
options=(!strip !buildflags staticlibs)
source=(https://cmocka.org/files/1.1/cmocka-${pkgver}.tar.xz{,.asc}
        'cmake.patch')
sha512sums=('fe451893474dce1270e12af707a9a8fe1f0217e1782b4e1a67d25dadf56ff4a5e7dbc9ba4431f774aedffa46a40a28a6a0488df24feefb2f93e90fd2369c2c88'
            'SKIP'
            'a7e862f1b68ee72a10c6820c3739e01eab0cef8d4014b605ea1c14d4869891b854197ba8ee823a12e886c232bf117d028904e737a0597eca48d1072330bfa00d')
validpgpkeys=('8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D') # Andreas Schneider <asn@cryptomilk.org>
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/cmocka-${pkgver}"

  patch -Np1 -i "${srcdir}"/cmake.patch
}

build() {
  for _arch in ${_architectures}; do
    mkdir -p "${srcdir}"/build-${_arch} && cd "${srcdir}"/build-${_arch}
    WINEPATH="/usr/${_arch}/bin" ${_arch}-cmake ../cmocka-${pkgver} \
      -DCMAKE_CROSSCOMPILING=TRUE \
      -DBUILD_STATIC_LIB=TRUE \
      -DWITH_STATIC_LIB=TRUE \
      -DBIN_INSTALL_DIR="/usr/${_arch}/bin" \
      -DTARGET_SYSTEM_EMULATOR=${_arch}-wine \
      -DUNIT_TESTING=ON
    make
  done
}

check() {
  for _arch in ${_architectures}; do
    cd "${srcdir}"/build-${_arch}
    WINEDEBUG=-all make test
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}"/build-${_arch}
    make install DESTDIR="${pkgdir}"

    mv "${pkgdir}"/usr/${_arch}/lib/libcmocka-static.a "${pkgdir}"/usr/${_arch}/lib/libcmocka.a

    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
  done
}

# vim: ts=2 sw=2 et:


