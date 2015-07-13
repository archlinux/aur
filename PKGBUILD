# Contributor: bubla <matej.tyc@gmail.com>
pkgname=mingw-w64-libtiff
pkgver=4.0.4
pkgrel=1
pkgdesc="Library for manipulation of TIFF images (mingw-w64)"
arch=(any)
url="http://www.remotesensing.org/libtiff"
license=("custom")
depends=(mingw-w64-libjpeg-turbo mingw-w64-zlib)
makedepends=(mingw-w64-configure)
options=(staticlibs !buildflags !strip)
source=("http://download.osgeo.org/libtiff/tiff-${pkgver}.tar.gz")
sha1sums=('185f844babe4ee902b5e4775d9f65915fcbabd11')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/tiff-${pkgver}"
  for _arch in ${_architectures}; do 
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/tiff-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    find "$pkgdir/usr/${_arch}" -name '*.exe' -exec rm {} \;
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
    rm -r "$pkgdir/usr/${_arch}/share"
  done
}
