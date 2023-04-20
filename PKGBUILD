# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgname=mingw-w64-opus
pkgver=1.4
pkgrel=1
pkgdesc="Codec designed for interactive speech and audio transmission over the Internet (mingw-w64)"
arch=(any)
url="https://www.opus-codec.org"
license=("BSD")
makedepends=('mingw-w64-configure')
depends=('mingw-w64-crt')
options=('staticlibs' '!strip' '!buildflags')
source=("https://github.com/xiph/opus/releases/download/v${pkgver}/opus-${pkgver}.tar.gz")
sha256sums=('c9b32b4253be5ae63d1ff16eea06b94b5f0f2951b7a02aceef58e3a3ce49c51f')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/opus-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure \
      --enable-custom-modes \
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
