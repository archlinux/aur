# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname='arrow'
pkgver=0.8.0
pkgrel=2
pkgdesc="A columnar in-memory analytics layer for big data."
arch=('i686' 'x86_64')
url="https://arrow.apache.org"
license=('Apache')
depends=('flatbuffers' 'rapidjson' 'boost-libs')
checkdepends=()
optdepends=()
makedepends=('cmake' 'boost' 'brotli' 'lz4-static' 'zlib-static' 'zstd-static' 'snappy-static')
source=("https://github.com/apache/arrow/archive/apache-arrow-$pkgver.tar.gz"
  "brotli-static.patch")
sha256sums=('c61a60c298c30546fc0b418a35be66ef330fb81b06c49928acca7f1a34671d54'
            '1d245694b82d0fc9aed566c4873acba7f2dcb3d359bd924d848613eea77a771e')

prepare() {
  cd "$srcdir/$pkgname-apache-$pkgname-$pkgver"
  patch -p1 < ../brotli-static.patch
}

build(){
  cd "$srcdir"
  mkdir -p build
  cd "$srcdir/build"
  ARROW_BUILD_TOOLCHAIN=/usr cmake \
    ../$pkgname-apache-$pkgname-$pkgver/cpp -DARROW_PYTHON=ON \
                                      -DCMAKE_BUILD_TYPE=Release \
                                      -DARROW_BUILD_TESTS=ON \
                                      -DARROW_ALTIVEC=OFF \
                                      -DCMAKE_INSTALL_PREFIX="/usr" \
                                      -DCMAKE_INSTALL_LIBDIR="lib" \
                                      -DARROW_USE_SSE=ON
  make
}

package(){
  cd "$srcdir/build"
  make DESTDIR="${pkgdir}" install
}

check(){
  cd "$srcdir/build"
  make test
}
# vim:ts=2:sw=2:et:
