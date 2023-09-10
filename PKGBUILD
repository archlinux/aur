# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

_pkgname=speexdsp
pkgname=mingw-w64-${_pkgname}
pkgver=1.2.1
pkgrel=1
pkgdesc="DSP library derived from Speex (mingw-w64)"
arch=(any)
url="https://gitlab.xiph.org/xiph/speexdsp"
license=("BSD")
makedepends=('mingw-w64-configure')
depends=('mingw-w64-crt')
options=('staticlibs' '!strip' '!buildflags')
source=("https://gitlab.xiph.org/xiph/speexdsp/-/archive/SpeexDSP-${pkgver}/speexdsp-SpeexDSP-${pkgver}.tar.gz")
sha256sums=('d17ca363654556a4ff1d02cc13d9eb1fc5a8642c90b40bd54ce266c3807b91a7')

_srcdir="${_pkgname}-SpeexDSP-${pkgver}"
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${_srcdir}"
  ./autogen.sh
}

build() {
  cd "${_srcdir}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure --disable-examples ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/${_srcdir}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    rm -r "$pkgdir"/usr/${_arch}/share
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
