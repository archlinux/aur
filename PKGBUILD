pkgname=mingw-w64-libfreexl
pkgver=1.0.1
pkgrel=1
pkgdesc="Library to extract valid data from within an Excel (.xls) spreadsheet (mingw-w64)"
arch=('any')
url="https://www.gaia-gis.it/fossil/freexl/‎"
license=('MPL' 'GPL' 'LGPL')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-configure')
options=('!strip' '!buildflags' 'staticlibs')
source=(http://www.gaia-gis.it/gaia-sins/freexl-$pkgver.tar.gz)
sha256sums=('df0127e1e23e9ac9a189c27880fb71207837e8cba93d21084356491c9934b89b')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd ${srcdir}/freexl-$pkgver
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/freexl-$pkgver/build-${_arch}"
    make install DESTDIR="${pkgdir}"
    rm -rf "${pkgdir}/usr/${_arch}/share/man"
    chmod a-x "${pkgdir}/usr/${_arch}/lib/"*.dll.a
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
