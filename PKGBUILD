# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname='arrow'
_pkgname='arrow-apache-arrow'
pkgver=3.0.0
pkgrel=1
pkgdesc="A columnar in-memory analytics layer for big data."
arch=('x86_64')
url="https://arrow.apache.org"
license=('Apache')
depends=('boost-libs' 'brotli' 'double-conversion' 'c-ares' 'gflags' 'grpc>=1.27.0' 'google-glog' 'libutf8proc' 'lz4' 'protobuf' 'rapidjson' 'snappy' 'thrift' 'uriparser' 'zstd')
checkdepends=('git')
optdepends=()
provides=('parquet-cpp')
conflicts=('parquet-cpp')
makedepends=('apache-orc' 'boost' 'cmake' 'flatbuffers' 'gmock' 'python-numpy')
source=("https://github.com/apache/arrow/archive/apache-arrow-$pkgver.tar.gz")
sha256sums=('fc461c4f0a60e7470a7c58b28e9344aa8fb0be5cc982e9658970217e084c3a82')

build(){
  mkdir -p build
  cd build
  ARROW_BUILD_TOOLCHAIN=/usr ORC_HOME=/usr DOUBLE_CONVERSION_HOME=/usr cmake \
    ../$_pkgname-$pkgver/cpp -DARROW_DEPENDENCY_SOURCE=SYSTEM \
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
                                      -DARROW_SIMD_LEVEL=AVX2 \
                                      -DARROW_FLIGHT=ON \
                                      -DARROW_GANDIVA=OFF \
                                      -DARROW_PROTOBUF_USE_SHARED=ON \
                                      -DARROW_GFLAGS_USE_SHARED=ON \
                                      -DARROW_USE_GLOG=ON \
                                      -DARROW_WITH_ZSTD=ON \
                                      -DARROW_WITH_BROTLI=ON \
                                      -DARROW_WITH_RE2=OFF
  make
}

package(){
  cd build
  make DESTDIR="${pkgdir}" install
  find "${pkgdir}/usr/lib/" -name "*testing*" -delete
}

check(){
   cd "$srcdir"
   rm -rf parquet-testing
   git clone --depth 1 https://github.com/apache/parquet-testing.git
   rm -rf arrow-testing
   git clone --depth 1 https://github.com/apache/arrow-testing.git
   cd build
   PARQUET_TEST_DATA="$srcdir/parquet-testing/data" ARROW_TEST_DATA="$srcdir/arrow-testing/data" make test
}
# vim:ts=2:sw=2:et:
