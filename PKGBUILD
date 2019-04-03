# Maintainer: Karl-Felix Glatzer <karl.glatzer@gmx.de>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=mingw-w64-cmocka
pkgver=1.1.5
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
sha512sums=('cad7f04757183d004f6eaad39036fc0e24c5e0e987f80e85bc43bc66dba22389cb02b08e25531cc28a541d0a24a86b29be134a2d6fc339128e87d66952f502bd'
            'SKIP'
            'a9f959ca9f489c3ca57e7671e249064c28b45a00df95395ac46ba0cea5bfc8760253a708a470e04e6c1f9a6f5a882b75fbceef7933b8e200da3579b1580cd671')
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

    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
  done
}

# vim: ts=2 sw=2 et:


