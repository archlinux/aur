# Maintainer: Andrew Sun <adsun701@gmail.com>

pkgname=mingw-w64-libsass
pkgver=3.5.5
pkgrel=1
pkgdesc="C implementation of Sass CSS preprocessor (library) (mingw-w64)"
arch=('any')
url="http://libsass.org/"
license=('MIT')
makedepends=('mingw-w64-configure')
depends=('mingw-w64-crt')
options=('!strip' '!buildflags' 'staticlibs')
source=("libsass-${pkgver}.tar.gz"::"https://github.com/sass/libsass/archive/${pkgver}.tar.gz")
sha256sums=('487ca58f1dfdc4055079af04f0ad120747385d3b3926b1c8f46e4b00540fdb70')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/libsass-${pkgver}/"
  autoreconf -fiv
}

build() {
  cd "${srcdir}/libsass-${pkgver}/"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/libsass-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
