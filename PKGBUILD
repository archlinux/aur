# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgname=mingw-w64-glib-networking
pkgver=2.56.0
pkgrel=2
pkgdesc="Network-related GIO modules for glib (mingw-w64)"
arch=('any')
url="https://git.gnome.org/browse/glib-networking"
license=('LGPL2.1')
depends=(mingw-w64-glib2 mingw-w64-gnutls)
makedepends=(mingw-w64-meson)
source=("https://download.gnome.org/sources/glib-networking/${pkgver%.*}/glib-networking-${pkgver}.tar.xz")
options=(!strip !buildflags !libtool staticlibs)
sha256sums=('47fd10bcae2e5039dc5f685e3ea384f48e64a6bee26d755718f534a978477c93')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/glib-networking-${pkgver}"
  sed -i '/libproxy_support/s/true/false/g' meson_options.txt 
  sed -i '/gnome_proxy_support/s/true/false/g' meson_options.txt 
  sed -i '/static_modules/s/false/true/g' meson_options.txt 
}

build() {
  for _arch in ${_architectures}; do
    mkdir -p "${srcdir}/glib-networking-${pkgver}/build-${_arch}"
    cd "${srcdir}/glib-networking-${pkgver}/build-${_arch}"
    ${_arch}-meson "${srcdir}/glib-networking-${pkgver}" "${srcdir}/glib-networking-${pkgver}/build-${_arch}"
    ninja -C "${srcdir}/glib-networking-${pkgver}/build-${_arch}" 
  done
}

package() {
  for _arch in ${_architectures}; do
    DESTDIR="${pkgdir}" ninja -C "${srcdir}/glib-networking-${pkgver}/build-${_arch}" install
  done
}

# vim: ts=2 sw=2 et:
