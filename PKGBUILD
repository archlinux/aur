# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgname=mingw-w64-glib-networking
pkgver=2.62.1
pkgrel=1
pkgdesc="Network-related GIO modules for glib (mingw-w64)"
arch=('any')
url="https://git.gnome.org/browse/glib-networking"
license=('LGPL2.1')
depends=(mingw-w64-glib2 mingw-w64-gnutls)
makedepends=(mingw-w64-meson)
source=("https://download.gnome.org/sources/glib-networking/${pkgver%.*}/glib-networking-${pkgver}.tar.xz")
options=(!strip !buildflags !libtool staticlibs)
sha256sums=('3c55ae6771ad7a79fa606a834f4686ed555c2774ed6e9ece6f3c0f6a3dab7110')

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
