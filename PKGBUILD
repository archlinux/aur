# Maintainer: drakkan <nicola.murino@gmail.com>
pkgname=mingw-w64-glib-networking
pkgver=2.50.0
pkgrel=1
pkgdesc="Network-related GIO modules for glib (mingw-w64)"
arch=('any')
url="http://www.gtk.org/"
license=('LGPL')
depends=(mingw-w64-glib2 mingw-w64-gnutls)
makedepends=(mingw-w64-configure)
source=("https://download.gnome.org/sources/glib-networking/${pkgver%.*}/glib-networking-${pkgver}.tar.xz")
options=(!strip !buildflags !libtool staticlibs)
sha256sums=('3f1a442f3c2a734946983532ce59ed49120319fdb10c938447c373d5e5286bee')

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
