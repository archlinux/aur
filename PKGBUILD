# Maintainer: Andrew Sun <adsun701@gmail.com>

pkgname=mingw-w64-proj
pkgver=6.0.0
pkgrel=1
arch=('any')
pkgdesc="Cartographic Projections library. (mingw-w64)"
depends=('mingw-w64-crt' 'mingw-w64-sqlite')
makedepends=('mingw-w64-configure' 'mingw-w64-wine')
options=('!strip' '!buildflags' 'staticlibs')
license=('MIT')
url="http://trac.osgeo.org/proj/"
source=("http://download.osgeo.org/proj/proj-${pkgver}.tar.gz")
sha256sums=('4510a2c1c8f9056374708a867c51b1192e8d6f9a5198dd320bf6a168e44a3657')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  for _arch in ${_architectures}; do
    mkdir -p ${srcdir}/build-${_arch} && pushd ${srcdir}/build-${_arch}
    cp -rf "${srcdir}"/proj-${pkgver}/. ${srcdir}/build-${_arch}
    ${_arch}-configure \
      .
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    rm -rf "${pkgdir}"/usr/${_arch}/share
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
