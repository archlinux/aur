# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgname=mingw-w64-wavpack
pkgver=5.6.0
pkgrel=1
pkgdesc="Audio compression format with lossless, lossy and hybrid compression modes (mingw-w64)"
arch=('any')
url="http://www.wavpack.com/"
license=('BSD')
makedepends=('mingw-w64-configure')
depends=('mingw-w64-crt')
options=('!strip' '!buildflags' 'staticlibs')
source=(http://www.wavpack.com/wavpack-${pkgver}.tar.xz)
sha512sums=('7421eff1f6e18f2e698b367ca48f6773456d0fcb53241be70149a87eff2cdf14dd8a82845a016f59ed32c7df494d018e6e23495709d3a56500b0660f177d5c0f')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/wavpack-$pkgver/"
  LDFLAGS="-lssp"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure --disable-apps ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/wavpack-$pkgver/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    rm -rf "$pkgdir"/usr/${_arch}/share/man
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

# vim: ts=2 sw=2 et:
