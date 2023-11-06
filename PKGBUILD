pkgname=mingw-w64-libspatialite
pkgver=5.1.0
pkgrel=1
pkgdesc="SQLite extension to support spatial data types and operations (mingw-w64)"
arch=('any')
url="https://www.gaia-gis.it/fossil/libspatialite"
license=('MPL' 'GPL' 'LGPL')
depends=('mingw-w64-geos' 'mingw-w64-libfreexl' 'mingw-w64-librttopo' 'mingw-w64-libxml2' 'mingw-w64-minizip' 'mingw-w64-proj' 'mingw-w64-sqlite')
makedepends=('mingw-w64-configure')
options=('!buildflags' 'staticlibs' '!strip')
source=(https://www.gaia-gis.it/gaia-sins/libspatialite-sources/libspatialite-$pkgver.tar.gz libspatialite_geos.patch libspatialite_mingw.patch)
sha256sums=('43be2dd349daffe016dd1400c5d11285828c22fea35ca5109f21f3ed50605080' SKIP SKIP)

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}"/libspatialite-$pkgver
  patch -p1 -i "${srcdir}"/libspatialite_geos.patch
  patch -p1 -i "${srcdir}"/libspatialite_mingw.patch
}

build() {
  cd "${srcdir}"/libspatialite-$pkgver
  autoreconf -ifv
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure --enable-geocallbacks ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/libspatialite-${pkgver}/build-${_arch}"
    make install DESTDIR="$pkgdir"
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

