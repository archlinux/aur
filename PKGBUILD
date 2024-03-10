# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgname=mingw-w64-opus
pkgver=1.5.1
pkgrel=1
pkgdesc="Codec designed for interactive speech and audio transmission over the Internet (mingw-w64)"
arch=(any)
url="https://www.opus-codec.org"
license=("BSD-3-Clause")
makedepends=('mingw-w64-configure')
depends=('mingw-w64-crt')
options=('staticlibs' '!strip' '!buildflags')
source=("https://downloads.xiph.org/releases/opus/opus-$pkgver.tar.gz")
b2sums=('5ba1d6f28594f366b545507bafb22751e15a0e78e152e7cdef456dccb0bc9fc512faa18c90fb4ea5455a9535de89df987dea8a0fabce9a25c285d0c410d4b482')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/opus-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure \
      --enable-custom-modes \
      --enable-deep-plc \
      --enable-dred \
      --enable-osce \
      --disable-doc
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/opus-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    rm -r "$pkgdir/usr/${_arch}/share"
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

# vim: ts=2 sw=2 et:
