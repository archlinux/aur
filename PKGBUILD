# Maintainer: Andrew Sun <adsun701@gmail.com>

pkgname=mingw-w64-proj
pkgver=5.2.0
pkgrel=1
arch=('any')
pkgdesc="Cartographic Projections library. (mingw-w64)"
depends=('mingw-w64-crt')
makedepends=('mingw-w64-configure')
options=('!strip' '!buildflags' 'staticlibs')
license=('MIT')
url="http://trac.osgeo.org/proj/"
source=("http://download.osgeo.org/proj/proj-${pkgver}.tar.gz")
sha256sums=('ef919499ffbc62a4aae2659a55e2b25ff09cccbbe230656ba71c6224056c7e60')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}"/proj-${pkgver}
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure \
      ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/proj-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}/" install
    rm -rf "${pkgdir}"/usr/${_arch}/share
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
