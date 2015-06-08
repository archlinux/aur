
pkgname=mingw-w64-zeromq
pkgver=4.0.5
pkgrel=1
pkgdesc="Fast messaging system built on sockets, C and C++ bindings. aka 0MQ, ZMQ. (mingw-w64)"
arch=('any')
url="http://www.zeromq.org"
license=("LGPL")
depends=('mingw-w64-crt')
makedepends=('mingw-w64-configure')
options=('staticlibs' '!strip' '!buildflags')
source=("http://download.zeromq.org/zeromq-$pkgver.tar.gz")
md5sums=('73c39f5eb01b9d7eaf74a5d899f1d03d')

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
    rm -r "$pkgdir"/usr/${_arch}/share
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
