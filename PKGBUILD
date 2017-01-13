# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgname=mingw-w64-libsrtp
pkgver=1.5.4
pkgrel=1
pkgdesc="Library for SRTP (Secure Realtime Transport Protocol) (mingw-w64)"
arch=('any')
url="https://github.com/cisco/libsrtp"
license=('BSD')
makedepends=('mingw-w64-configure')
depends=('mingw-w64-crt')
options=('!strip' '!buildflags' 'staticlibs')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
  "0001-Don-t-create-a-symlink-if-there-is-no-SHAREDLIBVERSI.patch")
sha256sums=('56a7b521c25134f48faff26b0b1e3d4378a14986a2d3d7bc6fefb48987304ff0'
  '27c399254f21e3155b1e4e4fb3772e4a6bce85b40eddefafeffaa37c9d2ef222')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/libsrtp-${pkgver}"
  patch -p1 -i ${srcdir}/0001-Don-t-create-a-symlink-if-there-is-no-SHAREDLIBVERSI.patch
}

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
