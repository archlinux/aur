# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgname=mingw-w64-glib-networking
pkgver=2.60.2
pkgrel=1
pkgdesc="Network-related GIO modules for glib (mingw-w64)"
arch=('any')
url="https://git.gnome.org/browse/glib-networking"
license=('LGPL2.1')
depends=(mingw-w64-glib2 mingw-w64-gnutls)
makedepends=(mingw-w64-meson)
source=("https://download.gnome.org/sources/glib-networking/${pkgver%.*}/glib-networking-${pkgver}.tar.xz")
options=(!strip !buildflags !libtool staticlibs)
sha256sums=('c022f3d10f55a5b7c31676fb001b4cb6401db8ab9f6e8418c69de00d0f268732')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  for _arch in ${_architectures}; do
    mkdir -p "${srcdir}/glib-networking-${pkgver}/build-${_arch}"
    cd "${srcdir}/glib-networking-${pkgver}/build-${_arch}"
    ${_arch}-meson \
      -D libproxy=disabled \
      -D gnome_proxy=disabled \
      -D static_modules=true ..
    ninja
  done
}

package() {
  for _arch in ${_architectures}; do
    DESTDIR="${pkgdir}" ninja -C "${srcdir}/glib-networking-${pkgver}/build-${_arch}" install

    # see https://github.com/mesonbuild/meson/issues/4138 
    ${_arch}-gcc-ranlib ${pkgdir}/usr/${_arch}/lib/gio/modules/*.a
  done
}

# vim: ts=2 sw=2 et:
