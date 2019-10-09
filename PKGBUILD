# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_basename=libpeas
_repo='https://gitlab.gnome.org/GNOME/libpeas'
pkgname="${_basename}-lua51"
pkgver=1.24.0
pkgrel=1
pkgdesc='A GObject plugin library (with Lua 5.1 support)'
arch=('x86_64')
url='https://wiki.gnome.org/Projects/Libpeas'
provides=('libpeas')
conflicts=('libpeas')
license=('LGPL2.1')
depends=(gtk3 hicolor-icon-theme gobject-introspection)
makedepends=(gjs glade gobject-introspection gtk-doc intltool lua51-lgi meson python-gobject vala)
optdepends=(
    'lua51-lgi: Lua 5.1 loader'
    'python-gobject: Python loader'
)
source=(https://download.gnome.org/sources/$_basename/${pkgver:0:4}/$_basename-${pkgver}.tar.xz)
sha256sums=('0b9a00138c129a663de3eef5569b00ace03ce31d345f7af783768e9f35c8e6f9')


prepare() {
  cd "${srcdir}/${_basename}-${pkgver}"

  # Ugly workaround to fix lua51 and circumvent broken lua-lgi dependency detection
  local lua_lgi_ver=$(lua5.1 -e 'print(require("lgi")._VERSION)')
  sed -i \
    -e "s|'lua5\.1'|'lua51'|" \
    -e "s|^lua51_lgi_dep = .*$|lua51_lgi_dep = declare_dependency(version: '${lua_lgi_ver}')|" \
    meson.build
}

build() {
  cd "${srcdir}/${_basename}-${pkgver}"

  rm -rf build
  arch-meson . build -D vapi=true -D gtk_doc=true -D lua51=true
  ninja -C build
}

package() {
  cd "${srcdir}/${_basename}-${pkgver}"

  DESTDIR="$pkgdir" meson install -C build
}

# vim:set ts=2 sw=2 et:
