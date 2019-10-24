# Maintainer: Andrew Sun <adsun701 at gmail dot com>

pkgname=mingw-w64-geos
pkgver=3.8.0
pkgrel=1
pkgdesc="C++ port of the Java Topology Suite (mingw-w64)"
arch=('any')
url="https://trac.osgeo.org/geos/"
license=('LGPL')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('!emptydirs' '!buildflags' '!strip' 'staticlibs')
source=("https://download.osgeo.org/geos/geos-${pkgver}.tar.bz2")
sha256sums=('99114c3dc95df31757f44d2afde73e61b9f742f0b683fd1894cbbee05dda62d5')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/geos-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      -DDISABLE_GEOS_INLINE=ON \
      ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/geos-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    install -d "$pkgdir"/usr/bin
    ln -s /usr/${_arch}/bin/${_arch}-geos-config "$pkgdir"/usr/bin/${_arch}-geos-config
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
