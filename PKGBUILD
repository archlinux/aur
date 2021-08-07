pkgname=mingw-w64-pdal
pkgver=2.3.0
pkgrel=1
pkgdesc="A C++ library for translating and manipulating point cloud data (mingw-w64)"
arch=('any')
url="http://www.pdal.io"
license=('BSD')
depends=('mingw-w64-gdal' 'mingw-w64-libgeotiff' 'mingw-w64-laszip' 'mingw-w64-jsoncpp' 'mingw-w64-hexer-hobu' 'mingw-w64-postgresql-libs' 'mingw-w64-sqlite')
makedepends=('mingw-w64-cmake')
options=('!buildflags' 'staticlibs' '!strip')
source=("https://github.com/PDAL/PDAL/releases/download/${pkgver}/PDAL-${pkgver}-src.tar.gz")
sha512sums=('9de87de7370175e76b95d3ec08667eb28b90a63eed8133f144427ff931e575d1f37aa13496f12054577539ee552458475dd054bcbdedfabe52eb0e32c4483d05')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "PDAL-$pkgver-src/"
  sed -i "s|get_git_head_revision|#|g" CMakeLists.txt
  curl -L https://github.com/PDAL/PDAL/pull/3507.patch | patch -p1
  curl -L https://github.com/PDAL/PDAL/pull/3508.patch | patch -p1
  curl -L https://github.com/PDAL/PDAL/pull/3509.patch | patch -p1
  curl -L https://github.com/PDAL/PDAL/pull/3511.patch | patch -p1
  curl -L https://github.com/PDAL/PDAL/pull/3512.patch | patch -p1
  curl -L https://github.com/PDAL/PDAL/pull/3513.patch | patch -p1
  curl -L https://github.com/PDAL/PDAL/pull/3514.patch | patch -p1
  curl -L https://github.com/PDAL/PDAL/pull/3515.patch | patch -p1
  curl -L https://github.com/PDAL/PDAL/pull/3516.patch | patch -p1
}

build() {
  cd "PDAL-$pkgver-src/"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -DWITH_TESTS=OFF \
      -DBUILD_PLUGIN_PGPOINTCLOUD=ON \
      -DWITH_LAZPERF=ON \
      -DWITH_LASZIP=ON \
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
