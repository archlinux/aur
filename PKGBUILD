# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname='arrow'
pkgver=0.9.0
pkgrel=2
pkgdesc="A columnar in-memory analytics layer for big data."
arch=('x86_64')
url="https://arrow.apache.org"
license=('Apache')
depends=('rapidjson' 'boost-libs')
checkdepends=('gflags')
optdepends=()
makedepends=('cmake' 'boost' 'brotli' 'flatbuffers-static' 'lz4-static' 'zlib-static' 'zstd-static' 'snappy-static')
source=("https://github.com/apache/arrow/archive/apache-arrow-$pkgver.tar.gz")
sha256sums=('65f89a3910b6df02ac71e4d4283db9b02c5b3f1e627346c7b6a5982ae994af91')

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
                                      -DARROW_PLASMA=ON \
                                      -DARROW_ORC=ON \
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
