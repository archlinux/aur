# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgname=mingw-w64-wavpack
pkgver=5.5.0
pkgrel=1
pkgdesc="Audio compression format with lossless, lossy and hybrid compression modes (mingw-w64)"
arch=('any')
url="http://www.wavpack.com/"
license=('BSD')
makedepends=('mingw-w64-configure')
depends=('mingw-w64-crt')
options=('!strip' '!buildflags' 'staticlibs')
source=(http://www.wavpack.com/wavpack-${pkgver}.tar.xz)
sha512sums=('9758e8079618e45e585330cd472f8ddae6e0ffd9a79032e7ec60251fff331390a619855dcdcf92942f5192d6ae12e05b6feca36394d30f0fe7e65222ee2696fc')

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
