# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_name=libpeas
pkgbase=$_name-lua51
pkgname=($_name-lua51 $_name-lua51-docs)
pkgver=1.36.0
pkgrel=1
pkgdesc='A GObject plugin library (with Lua 5.1 support)'
arch=(x86_64)
# Repo: https://gitlab.gnome.org/GNOME/libpeas
url='https://wiki.gnome.org/Projects/Libpeas'
provides=($_name)
conflicts=($_name)
license=(LGPL2.1)
depends=(gtk3 hicolor-icon-theme gobject-introspection)
makedepends=(gi-docgen gjs glade gobject-introspection gtk-doc intltool lua51-lgi meson python-gobject vala)
optdepends=(
    'lua51-lgi: Lua 5.1 loader'
    'python-gobject: Python loader'
)
source=("https://download.gnome.org/sources/$_name/${pkgver:0:4}/$_name-$pkgver.tar.xz")
sha256sums=('297cb9c2cccd8e8617623d1a3e8415b4530b8e5a893e3527bbfd1edd13237b4c')

build() {
  cd $_name-$pkgver
  rm -rf build
  arch-meson . build -D vapi=true -D gtk_doc=true -D lua51=true
  ninja -C build
}

check() {
  cd $_name-$pkgver
  meson test -C build
}

package_libpeas-lua51 () {
  cd $_name-$pkgver
  DESTDIR="$pkgdir" meson install -C build
  mkdir -p "$srcdir"/doc
  mv "$pkgdir"/usr/share/doc "$srcdir"/doc
}

package_libpeas-lua51-docs() {
  pkgdesc+=" (documentation)"
  depends=()

  mv "$srcdir"/doc/* "$pkgdir"/usr/share
}

# vim:set ts=2 sw=2 et:
