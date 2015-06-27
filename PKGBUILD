# Maintainer: Mikołaj Milej <mikolajmm@gmail.com>

_libName=libwebsockets
_suffix="chrome43-firefox-36"
pkgname=mingw-w64-${_libName}
pkgver=1.4
pkgrel=1
pkgdesc="Lightweight pure C library built to use minimal CPU and memory resources, and provide fast throughput in both directions. (mingw-w64)"
arch=(any)
url="http://libwebsockets.org/"
license=("LGPL2 + static linking exception")
makedepends=('mingw-w64-cmake' 'mingw-w64-gcc' 'mingw-w64-zlib')
depends=('mingw-w64-crt' 'mingw-w64-openssl')
options=('staticlibs' '!strip' '!buildflags')
source=("http://git.libwebsockets.org/cgi-bin/cgit/libwebsockets/snapshot/libwebsockets-${pkgver}-${_suffix}.tar.gz")
sha256sums=('e11492477e582ef0b1a6ea2f18d81a9619b449170a3a5c43f32a9468461a9798')

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
      ../../libwebsockets-${pkgver}-${_suffix}
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
