
pkgname=mingw-w64-zeromq
pkgver=4.3.0
pkgrel=1
pkgdesc="Fast messaging system built on sockets, C and C++ bindings. aka 0MQ, ZMQ. (mingw-w64)"
arch=('any')
url="http://www.zeromq.org"
license=("LGPL")
depends=('mingw-w64-crt')
makedepends=('mingw-w64-configure')
options=('staticlibs' '!strip' '!buildflags')
source=("https://github.com/zeromq/libzmq/releases/download/v${pkgver}/zeromq-${pkgver}.tar.gz")
sha256sums=('8e9c3af6dc5a8540b356697081303be392ade3f014615028b3c896d0148397fd')
cd 
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd "${srcdir}/zeromq-${pkgver}"
  #sed -i "s/libzmq_werror=\"yes\"/libzmq_werror=\"no\"/g" configure
}

build() {
  cd "${srcdir}/zeromq-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure --disable-static
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/zeromq-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    rm "$pkgdir"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
