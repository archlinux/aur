# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgname=mingw-w64-glib-networking
pkgver=2.56.1
pkgrel=1
pkgdesc="Network-related GIO modules for glib (mingw-w64)"
arch=('any')
url="https://git.gnome.org/browse/glib-networking"
license=('LGPL2.1')
depends=(mingw-w64-glib2 mingw-w64-gnutls)
makedepends=(mingw-w64-meson)
source=("https://download.gnome.org/sources/glib-networking/${pkgver%.*}/glib-networking-${pkgver}.tar.xz"
  "0003-Use-the-GnuTLS-system-trust-by-default.patch"
  "0004-meson-Only-run-gio-querymodules-if-it-s-found.patch")
options=(!strip !buildflags !libtool staticlibs)
sha256sums=('df47b0e0a037d2dcf6b1846cbdf68dd4b3cc055e026bb40c4a55f19f29f635c8'
  'd54661751cd929be4894b6b671512b6d852378d52c0503ffb981949466b55dc8'
  'bc033e3c3ca803ab51e02290e551b161446e20d19fb8357701d9c82c4b5d175a')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "$srcdir/glib-networking-$pkgver"
  patch -Np1 -i ../"0003-Use-the-GnuTLS-system-trust-by-default.patch"
  patch -Np1 -i ../"0004-meson-Only-run-gio-querymodules-if-it-s-found.patch"
}


build() {
  for _arch in ${_architectures}; do
    mkdir -p "${srcdir}/glib-networking-${pkgver}/build-${_arch}"
    cd "${srcdir}/glib-networking-${pkgver}/build-${_arch}"
    ${_arch}-meson \
      -D libproxy_support=false \
      -D gnome_proxy_support=false \
      -D pkcs11_support=false \
      -D static_modules=true ..
    ninja
  done
}

package() {
  for _arch in ${_architectures}; do
    DESTDIR="${pkgdir}" ninja -C "${srcdir}/glib-networking-${pkgver}/build-${_arch}" install
  done
}

# vim: ts=2 sw=2 et:
