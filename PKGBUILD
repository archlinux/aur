# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgname=mingw-w64-libwebp
pkgver=1.1.0
pkgrel=1
pkgdesc="WebP library and conversion tools (mingw-w64)"
arch=(any)
url="https://developers.google.com/speed/webp/"
license=("BSD")
makedepends=(mingw-w64-configure git)
depends=(mingw-w64-libjpeg-turbo mingw-w64-libpng mingw-w64-libtiff mingw-w64-giflib)
options=(staticlibs !strip !buildflags)
_commit=d7844e9762b61c9638c263657bd49e1690184832  # tags/v1.1.0-rc2^0
source=("git+https://chromium.googlesource.com/webm/libwebp#commit=$_commit")
sha256sums=('SKIP')
validpgpkeys=('6B0E6B70976DE303EDF2F601F9C3D6BDB8232B5D')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgver() {
  cd "$srcdir/libwebp"
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd "$srcdir/libwebp"
  NOCONFIGURE=1 ./autogen.sh
}

build() {
	cd "$srcdir/libwebp"
  for _arch in ${_architectures}; do
    unset LDFLAGS
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure \
      --enable-swap-16bit-csp \
      --enable-experimental \
      --enable-libwebp{mux,demux,decoder,extras}
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/libwebp/build-${_arch}"
    make DESTDIR="$pkgdir" install
    find "$pkgdir/usr/${_arch}" -name '*.exe' -exec ${_arch}-strip  {} \;
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
  done
}

# vim: ts=2 sw=2 et:
