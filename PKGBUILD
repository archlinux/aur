# Maintainer: Andrew Sun <adsun701@gmail.com>

pkgname=mingw-w64-sassc
pkgver=3.6.1
pkgrel=1
pkgdesc="C implementation of Sass CSS preprocessor (mingw-w64)"
arch=('any')
url="http://libsass.org/"
license=('MIT')
makedepends=('mingw-w64-configure')
depends=('mingw-w64-crt' 'mingw-w64-libsass')
options=('!strip' '!buildflags' 'staticlibs')
source=("sassc-${pkgver}.tar.gz"::"https://github.com/sass/sassc/archive/${pkgver}.tar.gz")
sha256sums=('8cee391c49a102b4464f86fc40c4ceac3a2ada52a89c4c933d8348e3e4542a60')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/sassc-${pkgver}/"
  autoreconf -fiv
}

build() {
  cd "${srcdir}/sassc-${pkgver}/"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/sassc-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.exe
  done
}
