pkgname=mingw-w64-pdal
pkgver=2.5.6
pkgrel=1
pkgdesc="A C++ library for translating and manipulating point cloud data (mingw-w64)"
arch=('any')
url="http://www.pdal.io"
license=('BSD')
depends=('mingw-w64-gdal' 'mingw-w64-libgeotiff' 'mingw-w64-jsoncpp' 'mingw-w64-hexer-hobu' 'mingw-w64-postgresql-libs' 'mingw-w64-sqlite')
makedepends=('mingw-w64-cmake')
options=('!buildflags' 'staticlibs' '!strip')
source=("https://github.com/PDAL/PDAL/releases/download/${pkgver}/PDAL-${pkgver}-src.tar.gz")
sha256sums=('c4f51e7bb9843ecc5d51c47aad87d8ddbd919111fb49222294c5835be7c1fa85')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "PDAL-$pkgver-src/"
}

build() {
  cd "PDAL-$pkgver-src/"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -DWITH_TESTS=OFF \
      -DBUILD_PLUGIN_PGPOINTCLOUD=ON \
      -DWITH_COMPLETION=ON ..
    make
    popd
  done 
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/PDAL-${pkgver}-src/build-${_arch}"
    make install DESTDIR="$pkgdir"
    rm "$pkgdir"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
