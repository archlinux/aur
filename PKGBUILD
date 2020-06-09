# Maintainer: Andrew Sun <adsun701 at gmail dot com>

pkgname=mingw-w64-json-c
pkgver=0.14
pkgrel=1
pkgdesc="A JSON implementation in C (mingw-w64)"
arch=('any')
url="https://github.com/json-c/json-c/wiki"
license=('MIT')
makedepends=('mingw-w64-cmake')
depends=('mingw-w64-crt')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://github.com/json-c/json-c/archive/json-c-${pkgver//_/-}.tar.gz"
        "001-install-private-header.patch"
        "002-library-version.patch"
        "fix-snprintf.patch")
sha256sums=('0b723c251a9684801b8ae6e4ac43c2cf1ad86c9f03b1198e7dc6abdba894af80'
            '197e33a56fc3d655e058d6936e92698c8aa65b7297cb218345b8ad51350c4ecf'
            '01070781c13c7c5732d5d6779443381079be22d7d5612d0be1936e9cb9c95b7e'
            '53f83cfe1d1ea06a7ae3028edc3c9d8b05c7b5581b9031586ecbf9db745d63a2')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/json-c-json-c-${pkgver}"
  patch -Np1 -i "${srcdir}/001-install-private-header.patch"
  patch -Np1 -i "${srcdir}/002-library-version.patch"
  patch -Np1 -i "${srcdir}/fix-snprintf.patch"
}

build() {
  cd "${srcdir}/json-c-json-c-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/json-c-json-c-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
