# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname='arrow'
_pkgname='arrow-apache-arrow'
pkgver=1.0.0
pkgrel=1
pkgdesc="A columnar in-memory analytics layer for big data."
arch=('x86_64')
url="https://arrow.apache.org"
license=('Apache')
depends=('boost-libs' 'brotli' 'double-conversion' 'c-ares-cmake' 'gflags' 'grpc>=1.27.0' 'google-glog' 'lz4' 'protobuf' 'rapidjson' 'snappy' 'thrift' 'uriparser' 'zstd')
checkdepends=('git')
optdepends=()
provides=('parquet-cpp')
conflicts=('parquet-cpp')
makedepends=('apache-orc' 'boost' 'cmake' 'flatbuffers' 'python-numpy')
source=("https://github.com/apache/arrow/archive/apache-arrow-$pkgver.tar.gz"
  "cmake.patch")
sha256sums=('08fbd4c633c08939850d619ca0224c75d7a0526467c721c0838b8aa7efccb270'
            '8dcc91a9187faa885771e1cef207136d90b3b5ad645ab39d7016a0e50f9c90dd')

prepare(){
  cd "$srcdir"
  patch -p0 < cmake.patch
}

build(){
  cd "$srcdir"
  mkdir -p build
  cd "$srcdir/build"
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
                                      -DGTest_SOURCE=BUNDLED \
                                      -DgRPC_ROOT="/usr"
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
