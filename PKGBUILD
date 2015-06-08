
pkgname=mingw-w64-libgeotiff
pkgver=1.4.1
pkgrel=1
pkgdesc="A TIFF based interchange format for georeferenced raster imagery (mingw-w64)"
arch=('any')
url="http://www.remotesensing.org/geotiff"
license=('custom')
depends=('mingw-w64-libtiff' 'mingw-w64-proj' 'mingw-w64-libjpeg-turbo')
makedepends=('mingw-w64-configure')
options=('!buildflags' 'staticlibs' '!strip')
source=("http://download.osgeo.org/geotiff/libgeotiff/libgeotiff-$pkgver.tar.gz" libgeotiff_buildsys.patch)
sha256sums=('acfc76ee19b3d41bb9c7e8b780ca55d413893a96c09f3b27bdb9b2573b41fd23' SKIP)

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd ${srcdir}/libgeotiff-$pkgver
  patch -p1 -i ../libgeotiff_buildsys.patch
  sed -i "s|la_LDFLAGS = -version-info|la_LDFLAGS = -no-undefined -version-info|g" Makefile.in
#   autoreconf -if
}

build() {
  cd ${srcdir}/libgeotiff-$pkgver
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure --with-proj --with-jpeg --with-zip
#     ${_arch}-cmake -DCMAKE_BUILD_TYPE=Release \
#       -DGEOTIFF_CSV_DATA_DIR=$PWD/../csv \
#       -DGEOTIFF_DATA_SUBDIR=share \
#       -DGEOTIFF_BIN_SUBDIR=bin \
#       ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/libgeotiff-$pkgver/build-${_arch}"
    make DESTDIR="$pkgdir" install
    rm -r "$pkgdir"/usr/${_arch}/share
    rm "$pkgdir"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "${pkgdir}/usr/${_arch}/bin/"*.dll
    ${_arch}-strip -g "${pkgdir}/usr/${_arch}/lib/"*.a
  done
}
