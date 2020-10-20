# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgname=mingw-w64-libnice
pkgver=0.1.17
pkgrel=1
pkgdesc="An implementation of the IETF's draft ICE (for p2p UDP data streams) (mingw-w64)"
arch=(any)
url="https://nice.freedesktop.org"
license=('LGPL')
makedepends=('mingw-w64-meson' 'git' 'mingw-w64-gstreamer')
depends=('mingw-w64-glib2' 'mingw-w64-gnutls')
options=('!strip' '!buildflags' 'staticlibs')

_commit=5fb2511725a690a68ed9ace030931b78bc6fe92c  # tags/0.1.17^0
source=("git+https://gitlab.freedesktop.org/libnice/libnice.git#commit=$_commit"
  "0001-rand-Use-crypto-libs-instead-of-CryptGenRandom.patch"
  "0001-stund-Use-lowercase-winsock2.h.patch"
  "0002-meson-Fix-typos-in-crypto-library-detection.patch"
  "0001-interfaces-Add-debug-logging-to-sockaddr_to_string.patch"
  "0002-interfaces-Port-to-GetBestInterfaceEx-for-UWP-compat.patch"
  "0003-interfaces-Remove-unused-win32-code.patch"
  "0004-interfaces-Fix-fetching-of-interfaces-on-Win32.patch")
sha256sums=('SKIP'
  '60cb90e75a33fb1a7b27c3d44427292f57fef5e323bbc34059c882f7ac915fd7'
  '678ae8681958699e0f75ef203b6feead7cf3fd2693f11f6f05f4ff1bdc9317b8'
  'c13cf63b6f53939349d7ef19713ce1b9b25a387a1bc185c596471017bcf3aa27'
  '71c1f26848645d635f08361859e0878fd818ed1730146f6f764dc1ecacd76beb'
  '57de9f9b97f05de2cc7c03fd76484b49f005285145252f7206ef4d5e56d21c3c'
  '398011d48d899713fc79b440ca8237488e3291939cb16885b618e5a8c8bcae1b'
  'f888e748c970311303fe6b4e0761223c5966bd2eb57be4476d19def21881bc43')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/libnice"
  patch -Np1 -i ../0001-stund-Use-lowercase-winsock2.h.patch
  patch -Np1 -i ../0001-rand-Use-crypto-libs-instead-of-CryptGenRandom.patch
  patch -Np1 -i ../0002-meson-Fix-typos-in-crypto-library-detection.patch
  patch -Np1 -i ../0001-interfaces-Add-debug-logging-to-sockaddr_to_string.patch
  patch -Np1 -i ../0002-interfaces-Port-to-GetBestInterfaceEx-for-UWP-compat.patch
  patch -Np1 -i ../0003-interfaces-Remove-unused-win32-code.patch
  patch -Np1 -i ../0004-interfaces-Fix-fetching-of-interfaces-on-Win32.patch
}

build() {
  cd "${srcdir}/libnice"
  for _arch in $_architectures; do
    mkdir -p "build-${_arch}" && pushd build-${_arch}
    ${_arch}-meson \
      -D tests=disabled \
      -D examples=disabled \
      -D gupnp=disabled \
      -D gstreamer=enabled \
      -D crypto-library=gnutls \
      -D introspection=disabled \
      -D gtk_doc=disabled
    ninja
    popd
  done
}

package() {
  cd "${srcdir}/libnice"
  for _arch in ${_architectures}; do
    DESTDIR="${pkgdir}" ninja -C "${srcdir}/libnice/build-${_arch}" install
  done
}

# vim: ts=2 sw=2 et:
