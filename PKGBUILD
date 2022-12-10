# Maintainer: xia0er <xia0er@gmail.org>
# Contributor: Bruno Pagani <archange@archlinux.org>
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=arrow-sans-avx
_pkgname=arrow
pkgver=10.0.1
pkgrel=2
pkgdesc="Columnar in-memory analytics layer for big data (for CPUs without AVX/2 support)"
arch=(x86_64)
url="https://arrow.apache.org"
license=(Apache)
depends=(apache-orc boost-libs brotli bzip2 double-conversion c-ares gflags
         grpc google-glog jemalloc libutf8proc lz4 openssl protobuf rapidjson re2
         snappy thrift uriparser xsimd zlib zstd)
provides=(parquet-cpp arrow)
conflicts=(parquet-cpp arrow)
makedepends=(boost cmake flatbuffers gmock python-numpy git clang)
source=(https://archive.apache.org/dist/${_pkgname}/${_pkgname}-${pkgver}/apache-${_pkgname}-${pkgver}.tar.gz
        git+https://github.com/apache/parquet-testing.git
        git+https://github.com/apache/arrow-testing.git)
b2sums=('3ee82372635d90b05c1e7c9d846c52a923ba181e177959aa6be2603ab06e93415cf8e21cf194816e1c1eed83eb5a926e1414fb8930e525c208e46a6687601939'
        'SKIP'
        'SKIP')

build(){
  CC=clang \
  CXX=clang++ \
  ARROW_BUILD_TOOLCHAIN=/usr \
  ORC_HOME=/usr \
  DOUBLE_CONVERSION_HOME=/usr \
  cmake \
    -B build -S apache-${_pkgname}-${pkgver}/cpp \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    -DCMAKE_BUILD_TYPE=Release \
    -DARROW_BUILD_STATIC=OFF \
    -DARROW_DEPENDENCY_SOURCE=SYSTEM \
    -DARROW_BUILD_TESTS=ON \
    -DARROW_COMPUTE=ON \
    -DARROW_SUBSTRAIT=ON \
    -DARROW_FLIGHT=ON \
    -DARROW_FLIGHT_SQL=ON \
    -DARROW_GANDIVA=OFF \
    -DARROW_HDFS=ON \
    -DARROW_IPC=ON \
    -DARROW_JEMALLOC=ON \
    -DARROW_ORC=ON \
    -DARROW_PARQUET=ON \
    -DARROW_PLASMA=ON \
    -DARROW_PYTHON=ON \
    -DARROW_TENSORFLOW=ON \
    -DARROW_SIMD_LEVEL=NONE \
    -DARROW_USE_GLOG=ON \
    -DARROW_WITH_BROTLI=ON \
    -DARROW_WITH_BZ2=ON \
    -DARROW_WITH_LZ4=ON \
    -DARROW_WITH_SNAPPY=ON \
    -DARROW_WITH_ZLIB=ON \
    -DARROW_WITH_ZSTD=ON \
    -DPARQUET_REQUIRE_ENCRYPTION=ON
  make -C build
}

check(){
  # skip failing test with assertion on float values that are actually equal
  ARGS="-E parquet-internals-test" \
  PARQUET_TEST_DATA="${srcdir}"/parquet-testing/data \
  ARROW_TEST_DATA="${srcdir}"/arrow-testing/data \
  make -C build test
}

package(){
  make -C build DESTDIR="${pkgdir}" install
  find "${pkgdir}"/usr/lib/ -name '*testing*' -delete
}
