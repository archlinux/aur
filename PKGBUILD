# Maintainer: Karl-Felix Glatzer <karl.glatzer@gmx.de>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=mingw-w64-cmocka
pkgver=1.1.2
pkgrel=1
pkgdesc='Elegant unit testing framework for C with support for mock objects (mingw-w64)'
url='https://cmocka.org/'
arch=('any')
license=('Apache')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-gcc' 'mingw-w64-cmake' 'mingw-w64-wine')
options=(!strip !buildflags staticlibs)
source=(https://cmocka.org/files/1.1/cmocka-${pkgver}.tar.xz{,.asc}
        exesuffix.patch
        crosscompilingemulator.patch)
sha512sums=('84435c97a4002c111672f8e18a9270a61de18343de19587ba59436617e57997050a63aac2242a79ec892474e824ca382f78af3e74dc1919cc50e04fd88d5e8f4'
            'SKIP'
            '3fad0674a428311fbb3a3d0809ec385ac788d3ce539f41da671b6db8b7db188866248cf6a57c8d4ab441d930171dd5cb4790d36cde4917da62b3ed0816067a69'
            '152d4bef0cc0ae08ec0c3163a5ec12742e237c4d3aa50c2bdcabfa37cea2d689a858bc38558b97679622d7b9e4a87773d6362db01fd15e6f9873ab5cf8686162')
validpgpkeys=('8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D') # Andreas Schneider <asn@cryptomilk.org>
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/cmocka-${pkgver}"
  patch -Np1 -i "${srcdir}"/exesuffix.patch

  patch -Np1 -i "${srcdir}"/crosscompilingemulator.patch
}

build() {
  for _arch in ${_architectures}; do
    mkdir -p "${srcdir}"/build-${_arch} && cd "${srcdir}"/build-${_arch}
    ${_arch}-cmake ../cmocka-${pkgver} \
      -DCMAKE_CROSSCOMPILING=TRUE \
      -DUNIT_TESTING=ON
    make
  done
}

check() {
  for _arch in ${_architectures}; do
    cd "${srcdir}"/build-${_arch}
    cp src/cmocka.dll example/
    cp src/cmocka.dll example/chef_wrap/
    WINEDEBUG=-all make test
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}"/build-${_arch}
    make install DESTDIR="${pkgdir}"

    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
    rm -r "${pkgdir}"/usr/${_arch}/CMake/
  done
}

# vim: ts=2 sw=2 et:


