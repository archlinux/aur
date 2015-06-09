pkgname=mingw-w64-libwebp
pkgver=0.4.3
pkgrel=1
pkgdesc="WebP library (mingw-w64)"
arch=(any)
url="https://developers.google.com/speed/webp"
license=("BSD")
makedepends=(mingw-w64-configure)
depends=(mingw-w64-libjpeg-turbo mingw-w64-libpng mingw-w64-libtiff mingw-w64-freeglut mingw-w64-giflib)
options=(staticlibs !strip !buildflags)
source=("http://downloads.webmproject.org/releases/webp/libwebp-$pkgver.tar.gz")
sha256sums=('efbe0d58fda936f2ed99d0b837ed7087d064d6838931f282c4618d2a3f7390c4')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
	cd "$srcdir/libwebp-$pkgver"
  for _arch in ${_architectures}; do
    unset LDFLAGS
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure \
      --enable-swap-16bit-csp \
      --enable-experimental \
      --enable-libwebpmux \
      --enable-libwebpdemux \
      --enable-libwebpdecoder
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/libwebp-$pkgver/build-${_arch}"
    make DESTDIR="$pkgdir" install
    find "$pkgdir/usr/${_arch}" -name '*.exe' -o -name '*.bat' -o -name '*.def' -o -name '*.exp' | xargs -rtl1 rm
    find "$pkgdir/usr/${_arch}" -name '*.dll' | xargs -rtl1 ${_arch}-strip --strip-unneeded
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs -rtl1 ${_arch}-strip -g
    rm -r "$pkgdir/usr/${_arch}/share"
  done
}
