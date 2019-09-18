# Maintainer: Andrew Sun <adsun701 at gmail dot com>

pkgname=mingw-w64-proj
pkgver=6.2.0
pkgrel=1
arch=('any')
pkgdesc="Cartographic Projections library (mingw-w64)"
depends=('mingw-w64-crt' 'mingw-w64-sqlite')
makedepends=('mingw-w64-configure' 'mingw-w64-wine')
options=('!strip' '!buildflags' 'staticlibs')
license=('MIT')
url="https://proj.org/"
source=("https://download.osgeo.org/proj/proj-${pkgver}.tar.gz")
sha256sums=('b300c0f872f632ad7f8eb60725edbf14f0f8f52db740a3ab23e7b94f1cd22a50')

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
