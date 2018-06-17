# Maintainer: Andrew Sun <adsun701@gmail.com>

pkgname=mingw-w64-sassc
pkgver=3.5.0
pkgrel=1
pkgdesc="C implementation of Sass CSS preprocessor (mingw-w64)"
arch=('any')
url="http://libsass.org/"
license=('MIT')
makedepends=('mingw-w64-configure')
depends=('mingw-w64-crt' 'mingw-w64-libsass')
options=('!strip' '!buildflags' 'staticlibs')
md5sums=('f5c6aeb4e98c96d093f20295fc490f2c')
source=("sassc-${pkgver}.tar.gz"::"https://github.com/sass/sassc/archive/${pkgver}.tar.gz")

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
