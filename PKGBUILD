# Maintainer: nicholatian <me@nicholatian.com>

pkgname=mingw-w64-libevent
pkgver=2.1.12
pkgrel=3
pkgdesc="An event notification library (mingw-w64)"
arch=(any)
url="http://www.monkey.org/~provos/libevent"
license=("BSD")
makedepends=(mingw-w64-configure)
depends=(mingw-w64-crt mingw-w64-openssl)
options=(!libtool !strip !buildflags staticlibs)
source=("https://github.com/libevent/libevent/releases/download/release-$pkgver-stable/libevent-$pkgver-stable.tar.gz")
sha256sums=('92e6de1be9ec176428fd2367677e61ceffc2ee1cb119035037a27d346b0403bb')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd libevent-$pkgver
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "libevent-$pkgver/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    find "$pkgdir/usr/${_arch}" -name '*.exe' -o -name '*.bat' -o -name '*.def' -o -name '*.exp' -o -name '*.py' | xargs -rtl1 rm
    find "$pkgdir/usr/${_arch}" -name '*.dll' | xargs -rtl1 ${_arch}-strip --strip-unneeded
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs -rtl1 ${_arch}-strip -g
  done
}
