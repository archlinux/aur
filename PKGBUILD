# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname='arrow'
pkgver=0.12.0
pkgrel=1
pkgdesc="A columnar in-memory analytics layer for big data."
arch=('x86_64')
url="https://arrow.apache.org"
license=('Apache')
depends=('boost-libs' 'protobuf' 'rapidjson')
checkdepends=('gflags')
optdepends=()
provides=('parquet-cpp')
conflicts=('parquet-cpp')
makedepends=('cmake' 'boost' 'brotli' 'double-conversion' 'flatbuffers-static' 'gflags-static' 'google-glog-static' 'lz4-static' 'zlib-static' 'zstd-static' 'snappy-static')
source=("https://github.com/apache/arrow/archive/apache-arrow-$pkgver.tar.gz")
sha256sums=('e2eb87a68d200df5ff405fd7e0ab3d0549ccd5275f3a698439bb202918a000a8')

build(){
  cd "$srcdir"
  mkdir -p build
  cd "$srcdir/build"
  ARROW_BUILD_TOOLCHAIN=/usr ORC_HOME=/usr DOUBLE_CONVERSION_HOME=/usr cmake \
    ../$pkgname-apache-$pkgname-$pkgver/cpp -DARROW_PARQUET=ON \
                                      -DARROW_PYTHON=ON \
                                      -DCMAKE_BUILD_TYPE=Release \
                                      -DARROW_BUILD_TESTS=OFF \
                                      -DARROW_ALTIVEC=OFF \
                                      -DCMAKE_INSTALL_PREFIX="/usr" \
                                      -DCMAKE_INSTALL_LIBDIR="lib" \
                                      -DARROW_JEMALLOC=ON \
                                      -DARROW_ORC=OFF \
                                      -DARROW_PLASMA=ON \
                                      -DARROW_TENSORFLOW=ON \
                                      -DARROW_USE_SIMD=ON \
                                      -DARROW_FLIGHT=OFF \
                                      -DARROW_GANDIVA=OFF \
                                      -DARROW_PROTOBUF_USE_SHARED=ON
  make VERBOSE=1
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
