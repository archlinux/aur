# Maintainer: Mikołaj Milej <mikolajmm@gmail.com>

_libName=libwebsockets
pkgname=mingw-w64-${_libName}
pkgver=4.2.2
pkgrel=1
pkgdesc="Lightweight pure C library built to use minimal CPU and memory resources, and provide fast throughput in both directions. (mingw-w64)"
arch=(any)
url="http://libwebsockets.org/"
license=("LGPL2 + static linking exception")
makedepends=('mingw-w64-cmake' 'mingw-w64-gcc' 'mingw-w64-zlib')
depends=('mingw-w64-crt' 'mingw-w64-openssl')
options=('staticlibs' '!strip' '!buildflags')
source=(libwebsockets-${pkgver}.tar.gz::"https://github.com/warmcat/libwebsockets/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c2ae635485b8ef8d383dee0aee29ad6272d4462e527d29d9af014ab4a2465cbd')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  if [ -d "$srcdir/build" ]; then
    rmdir -p --ignore-fail-on-non-empty "$srcdir/build"
  fi
  mkdir -p "$srcdir/build"
}

build() {
  cd "$srcdir/build"

  unset LDFLAGS
  for _arch in ${_architectures}; do
    mkdir -p ${_arch} && pushd ${_arch}
    ${_arch}-cmake \
      -DCMAKE_BUILD_TYPE:String=Release \
      -DLWS_USE_EXTERNAL_ZLIB:BOOL=ON \
      -DLWS_WITHOUT_TESTAPPS:BOOL=ON \
      -DLWS_WITHOUT_TEST_SERVER:BOOL=ON \
      -DLWS_WITHOUT_TEST_SERVER_EXTPOLL:BOOL=ON \
      -DLWS_WITHOUT_TEST_PING:BOOL=ON \
      -DLWS_WITHOUT_TEST_CLIENT:BOOL=ON \
      -DLWS_WITHOUT_TEST_FRAGGLE:BOOL=ON \
      -DLWS_WITHOUT_DEBUG:BOOL=ON \
      -DLWS_WITH_HTTP2:BOOL=ON \
      -DLWS_WITH_LATENCY:BOOL=ON \
      ../../libwebsockets-${pkgver}
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/build/${_arch}"
    make DESTDIR="$pkgdir" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
