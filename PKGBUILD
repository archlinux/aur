# Maintainer: Karl-Felix Glatzer <karl.glatzer@gmx.de>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=mingw-w64-cmocka
pkgver=1.1.1
pkgrel=1
pkgdesc='Elegant unit testing framework for C with support for mock objects (mingw-w64)'
url='https://cmocka.org/'
arch=('any')
license=('Apache')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-gcc' 'mingw-w64-cmake' 'mingw-w64-wine')
options=(!strip !buildflags staticlibs)
source=(https://cmocka.org/files/1.1/cmocka-${pkgver}.tar.{xz,asc}
        exesuffix.patch
        crosscompilingemulator.patch)
sha512sums=('801c4a3e1bb9047241b1cb5a90c1cbdee1b0aff5e3d0a84ec8b2dbaee79274618c24fbe5e9fedbf0b3ee18c6c98b55d93e135d037ac33ab872edc7665af41577'
            'SKIP'
            'e68abf7947850d6ecc5b561f125fa39610e6b144568db92b0e5152a7481855e99674ce8d2dd320bd5fc572b397fbf1038f1325217051bf38dc3439d8e68a9b4e'
            '7f190c25cd69334eec0ebb8529574ab4582532ac22ad0fb0749f8f62042d43e6201be40176526dfe844522bb4b77552f16b4c0cd3c8bf9805330d6fbae07494c')
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


