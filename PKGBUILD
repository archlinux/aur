# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname='arrow'
pkgver=0.11.1
pkgrel=1
pkgdesc="A columnar in-memory analytics layer for big data."
arch=('x86_64')
url="https://arrow.apache.org"
license=('Apache')
depends=('boost-libs' 'rapidjson')
checkdepends=('gflags')
optdepends=()
provides=('parquet-cpp')
conflicts=('parquet-cpp')
makedepends=('apache-orc' 'cmake' 'boost' 'brotli' 'double-conversion' 'flatbuffers-static' 'google-glog-static' 'lz4-static' 'protobuf-static' 'zlib-static' 'zstd-static' 'snappy-static')
source=("https://github.com/apache/arrow/archive/apache-arrow-$pkgver.tar.gz"
"2928468ef665e106339fcc1161a9c1e1ebcfc2a3.patch"
"f4f62699e5d5b821e83dc2f902d486cf5c2b2755.patch"
"fix-linking.patch")
sha256sums=('3219c4e87e7cf979017f0cc5bc5dd6a3611d0fc750e821911fab998599dc125b'
            'd5170d6d7ad24cf850baa2c60e26a43e089c18046b13c01e071745a23c239d36'
            '4a839e1229e1c4369948ebb02e78a15bf77dcf1bd03ace3aa3002ba35c5cb659'
            'ce8aab9d77bc2d8fe1e4fad0221fd19abe190e8139fbd73b939f7404ed6f1b43')

prepare(){
  cd "${srcdir}/$pkgname-apache-$pkgname-$pkgver"
  patch -p1 < ../fix-linking.patch
  patch -p1 < ../f4f62699e5d5b821e83dc2f902d486cf5c2b2755.patch
  patch -p1 < ../2928468ef665e106339fcc1161a9c1e1ebcfc2a3.patch
}

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
                                      -DARROW_USE_SSE=ON
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
