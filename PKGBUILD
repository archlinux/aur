# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgname=mingw-w64-libwebp
pkgver=1.3.2
pkgrel=1
pkgdesc="WebP library and conversion tools (mingw-w64)"
arch=(any)
url="https://developers.google.com/speed/webp/"
license=("BSD")
makedepends=(mingw-w64-configure git)
depends=(mingw-w64-libjpeg-turbo mingw-w64-libpng mingw-w64-libtiff mingw-w64-giflib)
options=(staticlibs !strip !buildflags)
source=(https://storage.googleapis.com/downloads.webmproject.org/releases/webp/libwebp-$pkgver.tar.gz{,.asc})
sha256sums=('2a499607df669e40258e53d0ade8035ba4ec0175244869d1025d460562aa09b4'
  'SKIP')

validpgpkeys=('6B0E6B70976DE303EDF2F601F9C3D6BDB8232B5D') # WebP release signing key

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "$srcdir/libwebp-$pkgver"
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd "$srcdir/libwebp-$pkgver"
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
    cd "$srcdir/libwebp-$pkgver/build-${_arch}"
    make DESTDIR="$pkgdir" install
    find "$pkgdir/usr/${_arch}" -name '*.exe' -exec ${_arch}-strip  {} \;
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
  done
}

# vim: ts=2 sw=2 et:
