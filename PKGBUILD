# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname='arrow'
pkgver=0.15.1
pkgrel=1
pkgdesc="A columnar in-memory analytics layer for big data."
arch=('x86_64')
url="https://arrow.apache.org"
license=('Apache')
depends=('boost-libs' 'brotli' 'double-conversion' 'c-ares-cmake' 'gflags' 'grpc' 'google-glog' 'lz4' 'protobuf' 'rapidjson' 'snappy' 'thrift' 'uriparser' 'zstd')
checkdepends=('git')
optdepends=()
provides=('parquet-cpp')
conflicts=('parquet-cpp')
makedepends=('apache-orc' 'boost' 'cmake' 'flatbuffers' 'python-numpy')
source=("https://github.com/apache/arrow/archive/apache-arrow-$pkgver.tar.gz")
sha256sums=('ab1c0d371a10b615eccfcead71bb79832245d788f4834cc6b278c03c3872d593')


build(){
  cd "$srcdir"
  mkdir -p build
  cd "$srcdir/build"
  ARROW_BUILD_TOOLCHAIN=/usr ORC_HOME=/usr DOUBLE_CONVERSION_HOME=/usr cmake \
    ../$pkgname-apache-$pkgname-$pkgver/cpp -DARROW_DEPENDENCY_SOURCE=SYSTEM \
                                      -DARROW_PYTHON=ON \
                                      -DCMAKE_BUILD_TYPE=Release \
                                      -DARROW_BUILD_TESTS=ON \
                                      -DARROW_ALTIVEC=OFF \
                                      -DCMAKE_INSTALL_PREFIX="/usr" \
                                      -DCMAKE_INSTALL_LIBDIR="lib" \
                                      -DARROW_COMPUTE=ON \
                                      -DARROW_IPC=ON \
                                      -DARROW_JEMALLOC=ON \
                                      -DARROW_ORC=ON \
                                      -DARROW_PARQUET=ON \
                                      -DARROW_PLASMA=ON \
                                      -DARROW_TENSORFLOW=ON \
                                      -DARROW_USE_SIMD=ON \
                                      -DARROW_FLIGHT=ON \
                                      -DARROW_GANDIVA=OFF \
                                      -DARROW_PROTOBUF_USE_SHARED=ON \
                                      -DARROW_GFLAGS_USE_SHARED=ON \
                                      -DARROW_USE_GLOG=ON \
                                      -DGTest_SOURCE=BUNDLED
  make
}

package(){
  cd "$srcdir/build"
  make DESTDIR="${pkgdir}" install
  find "${pkgdir}/usr/lib/" -name "*testing*" -delete
}

check(){
   cd "$srcdir"
   rm -rf parquet-testing
   git clone https://github.com/apache/parquet-testing.git
   rm -rf arrow-testing
   git clone https://github.com/apache/arrow-testing.git
   cd build
   PARQUET_TEST_DATA="$srcdir/parquet-testing/data" ARROW_TEST_DATA="$srcdir/arrow-testing/data" make test
}
# vim:ts=2:sw=2:et:
