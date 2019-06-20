# Maintainer: Andrew Sun <adsun701@gmail.com>

pkgname=mingw-w64-libsass
pkgver=3.6.1
pkgrel=1
pkgdesc="C implementation of Sass CSS preprocessor (library) (mingw-w64)"
arch=('any')
url="http://libsass.org/"
license=('MIT')
makedepends=('mingw-w64-configure')
depends=('mingw-w64-crt')
options=('!strip' '!buildflags' 'staticlibs')
source=("libsass-${pkgver}.tar.gz"::"https://github.com/sass/libsass/archive/${pkgver}.tar.gz")
sha256sums=('18d6e866ba2430cccae2551f384aca253a84592c692ce7146550f1d4f273b7d7')

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
