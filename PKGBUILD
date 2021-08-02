# Maintainer: Andrew Sun <adsun701 at gmail dot com>

pkgname=mingw-w64-libsass
pkgver=3.6.5
pkgrel=1
pkgdesc="C implementation of Sass CSS preprocessor (library) (mingw-w64)"
arch=('any')
url="https://sass-lang.com/libsass"
license=('MIT')
makedepends=('mingw-w64-configure')
depends=('mingw-w64-crt')
options=('!strip' '!buildflags' 'staticlibs')
source=("libsass-${pkgver}.tar.gz"::"https://github.com/sass/libsass/archive/${pkgver}.tar.gz")
sha256sums=('89d8f2c46ae2b1b826b58ce7dde966a176bac41975b82e84ad46b01a55080582')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/libsass-${pkgver}"
  autoreconf -fiv
}

build() {
  cd "${srcdir}/libsass-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    LIBS+=" -lssp" ${_arch}-configure ..
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
