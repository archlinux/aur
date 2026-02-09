# Maintainer: Karl-Felix Glatzer <karl.glatzer@gmx.de>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=mingw-w64-cmocka
pkgver=2.0.2
pkgrel=1
pkgdesc='Elegant unit testing framework for C with support for mock objects (mingw-w64)'
arch=('any')
url='https://cmocka.org/'
license=('Apache-2.0')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-gcc' 'mingw-w64-cmake' 'mingw-w64-wine')
options=(!strip !buildflags staticlibs !debug)
source=("https://cmocka.org/files/${pkgver%.*}/cmocka-${pkgver}.tar.xz"{,.asc}
        'cmake.patch')
sha512sums=('d02d65f0881f18f30b9e46c325acfa349261339daa2c1bf3a4e6360976f13b31588e997415197220f6def156f77d9864994d4e3cfd09c8f16a8594d0a4789a16'
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
    WINEPATH="/usr/${_arch}/bin" ${_arch}-cmake \
      -S cmocka-${pkgver} \
      -B "${srcdir}"/build-${_arch} \
      -DCMAKE_CROSSCOMPILING=TRUE \
      -DBUILD_STATIC_LIB=TRUE \
      -DWITH_STATIC_LIB=TRUE \
      -DBIN_INSTALL_DIR="/usr/${_arch}/bin" \
      -DTARGET_SYSTEM_EMULATOR=${_arch}-wine \
      -Wno-dev \
      -DUNIT_TESTING=ON
    cmake --build "${srcdir}"/build-${_arch}
  done
}

check() {
  # some tests require XDG_RUNTIME_DIR to be set
  if [ -z "$XDG_RUNTIME_DIR" ]
  then
    export XDG_RUNTIME_DIR="/run/user/$(id -u)"
  fi

  for _arch in ${_architectures}; do
    WINEDEBUG=-all ctest --test-dir "${srcdir}"/build-${_arch} --output-on-failure
  done
}

package() {
  for _arch in ${_architectures}; do
    DESTDIR="${pkgdir}" cmake --install "${srcdir}"/build-${_arch}

    mv "${pkgdir}"/usr/${_arch}/lib/libcmocka-static.a "${pkgdir}"/usr/${_arch}/lib/libcmocka.a

    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
  done
}

# vim: ts=2 sw=2 et:
