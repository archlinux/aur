# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname='arrow'
pkgver=0.13.0
pkgrel=1
pkgdesc="A columnar in-memory analytics layer for big data."
arch=('x86_64')
url="https://arrow.apache.org"
license=('Apache')
depends=('boost-libs' 'brotli' 'double-conversion' 'gflags' 'grpc' 'google-glog' 'lz4' 'protobuf' 'rapidjson' 'zstd')
checkdepends=('gtest')
optdepends=()
provides=('parquet-cpp')
conflicts=('parquet-cpp')
makedepends=('apache-orc' 'boost' 'cmake' 'flatbuffers-static' 'python-numpy' 'thrift-static' 'snappy-static')
source=("https://github.com/apache/arrow/archive/apache-arrow-$pkgver.tar.gz")
sha256sums=('380fcc51f0bf98e13148300c87833e734cbcd7b74dddc4bce93829e7f7e4208b')

build(){
  cd "$srcdir"
  mkdir -p build
  cd "$srcdir/build"
  ARROW_BUILD_TOOLCHAIN=/usr ORC_HOME=/usr DOUBLE_CONVERSION_HOME=/usr cmake \
    ../$pkgname-apache-$pkgname-$pkgver/cpp -DARROW_DEPENDENCY_SOURCE=SYSTEM \
                                      -DARROW_PYTHON=ON \
                                      -DCMAKE_BUILD_TYPE=Release \
                                      -DARROW_BUILD_TESTS=OFF \
                                      -DARROW_ALTIVEC=OFF \
                                      -DCMAKE_INSTALL_PREFIX="/usr" \
                                      -DCMAKE_INSTALL_LIBDIR="lib" \
                                      -DARROW_JEMALLOC=ON \
                                      -DARROW_ORC=OFF \
                                      -DARROW_PARQUET=ON \
                                      -DARROW_ORC=ON \
                                      -DARROW_PLASMA=ON \
                                      -DARROW_TENSORFLOW=ON \
                                      -DARROW_USE_SIMD=ON \
                                      -DARROW_FLIGHT=ON \
                                      -DARROW_GANDIVA=OFF \
                                      -DARROW_PROTOBUF_USE_SHARED=ON \
                                      -DARROW_GFLAGS_USE_SHARED=ON \
                                      -DARROW_USE_GLOG=ON
  make
}

package(){
  cd "$srcdir/build"
  make DESTDIR="${pkgdir}" install
}

#check(){
#  cd "$srcdir/build"
#  make test
#}
# vim:ts=2:sw=2:et:
