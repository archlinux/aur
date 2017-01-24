# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgname=mingw-w64-wavpack
pkgver=5.1.0
pkgrel=1
pkgdesc="Audio compression format with lossless, lossy and hybrid compression modes (mingw-w64)"
arch=('any')
url="http://www.wavpack.com/"
license=('BSD')
makedepends=('mingw-w64-configure')
depends=('mingw-w64-crt')
options=('!strip' '!buildflags' 'staticlibs')
source=(http://www.wavpack.com/wavpack-${pkgver}.tar.bz2)
sha1sums=('ed96443e3fc915128e1002a0f9f2c7ae9bcdc09b')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/wavpack-$pkgver/"
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
