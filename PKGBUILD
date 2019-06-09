pkgname=mingw-w64-speexdsp
pkgver=1.2.0
pkgrel=1
pkgdesc="DSP library derived from Speex (mingw-w64)"
arch=(any)
url="http://www.speexdsp.org"
license=("BSD")
makedepends=('mingw-w64-configure')
depends=('mingw-w64-crt')
options=('staticlibs' '!strip' '!buildflags')
source=("http://downloads.xiph.org/releases/speex/speexdsp-$pkgver.tar.gz")
sha256sums=('682042fc6f9bee6294ec453f470dadc26c6ff29b9c9e9ad2ffc1f4312fd64771')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}"/speexdsp-${pkgver}
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/speexdsp-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    rm -r "$pkgdir"/usr/${_arch}/share
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
