# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgname=mingw-w64-libnghttp2
pkgver=1.55.1
pkgrel=1
pkgdesc='Framing layer of HTTP/2 is implemented as a reusable C library (mingw-w64)'
arch=(any)
url='https://nghttp2.org/'
license=(MIT)
depends=('mingw-w64-crt')
makedepends=('mingw-w64-configure')
options=(staticlibs !strip !buildflags)
source=(https://github.com/nghttp2/nghttp2/releases/download/v$pkgver/nghttp2-$pkgver.tar.xz)
sha256sums=('19490b7c8c2ded1cf7c3e3a54ef4304e3a7876ae2d950d60a81d0dc6053be419')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd nghttp2-$pkgver
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure \
      --enable-lib-only 
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/nghttp2-$pkgver/build-${_arch}"
    make DESTDIR="$pkgdir" install
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
  done
}

# vim: ts=2 sw=2 et:
