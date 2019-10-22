# Maintainer: Andrew Sun <adsun701 at gmail dot com>

pkgname=mingw-w64-libsass
pkgver=3.6.2
pkgrel=1
pkgdesc="C implementation of Sass CSS preprocessor (library) (mingw-w64)"
arch=('any')
url="https://sass-lang.com/libsass"
license=('MIT')
makedepends=('mingw-w64-configure')
depends=('mingw-w64-crt')
options=('!strip' '!buildflags' 'staticlibs')
source=("libsass-${pkgver}.tar.gz"::"https://github.com/sass/libsass/archive/${pkgver}.tar.gz")
sha256sums=('0ecd2405f869901d70e7b1960259aac3f21a33c59a820a0a579a16f8f8dc43b9')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/libsass-${pkgver}"
  autoreconf -fiv
}

build() {
  cd "${srcdir}/libsass-${pkgver}"
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
