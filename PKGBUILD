# Maintainer: Karl-Felix Glatzer <karl.glatzer@gmx.de>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=mingw-w64-cmocka
pkgver=1.1.8
pkgrel=1
pkgdesc='Elegant unit testing framework for C with support for mock objects (mingw-w64)'
url='https://cmocka.org/'
arch=('any')
license=('Apache')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-gcc' 'mingw-w64-cmake' 'mingw-w64-wine')
options=(!strip !buildflags staticlibs !debug)
source=(https://cmocka.org/files/1.1/cmocka-${pkgver}.tar.xz{,.asc}
        'cmake.patch')
sha512sums=('59c3d8732c5558abf4dd9aedac2d5e41cf7693c26a88932449c3dec7be7903c479515f15b4ab8876e4b03f3b4b68460ef34bc6ce079677262638c15e29da37ef'
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
  # some tests require XDG_RUNTIME_DIR to be set
  if [ -z "$XDG_RUNTIME_DIR" ]
  then
    export XDG_RUNTIME_DIR="/run/user/$(id -u)"
  fi

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


