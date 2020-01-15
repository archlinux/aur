# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgname=mingw-w64-libsrtp
pkgver=2.3.0
pkgrel=1
pkgdesc="Library for SRTP (Secure Realtime Transport Protocol) (mingw-w64)"
arch=('any')
url="https://github.com/cisco/libsrtp"
license=('BSD')
makedepends=('mingw-w64-configure')
depends=('mingw-w64-crt')
options=('!strip' '!buildflags' 'staticlibs')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('94093a5d04c5f4743e8d81182b76938374df6d393b45322f24960d250b0110e8')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  export ac_cv_lib_pcap_pcap_create=no
  cd "${srcdir}/libsrtp-$pkgver/"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure ..
    make all shared_library
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/libsrtp-$pkgver/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

# vim: ts=2 sw=2 et:
