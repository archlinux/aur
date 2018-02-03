# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgname=mingw-w64-glib-networking
pkgver=2.54.1
pkgrel=1
pkgdesc="Network-related GIO modules for glib (mingw-w64)"
arch=('any')
url="http://www.gtk.org/"
license=('LGPL')
depends=(mingw-w64-glib2 mingw-w64-gnutls)
makedepends=(mingw-w64-configure)
source=("https://download.gnome.org/sources/glib-networking/${pkgver%.*}/glib-networking-${pkgver}.tar.xz")
options=(!strip !buildflags !libtool staticlibs)
sha256sums=('eaa787b653015a0de31c928e9a17eb57b4ce23c8cf6f277afaec0d685335012f')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  for _arch in ${_architectures}; do
    mkdir -p "${srcdir}/glib-networking-${pkgver}/build-${_arch}"
    cd "${srcdir}/glib-networking-${pkgver}/build-${_arch}"
    ${_arch}-configure --without-ca-certificates --enable-more-warnings
    make
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/glib-networking-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip -g "${pkgdir}/usr/${_arch}/lib/gio/modules/"*.a
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/lib/gio/modules/*.dll
  done
}

# vim: ts=2 sw=2 et:
