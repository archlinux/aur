# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgbase=gtksourceview5
pkgname=(gtksourceview5 gtksourceview5-docs)
pkgver=5.6.2
pkgrel=1
pkgdesc="A text widget adding syntax highlighting and more to GNOME"
url="https://wiki.gnome.org/Projects/GtkSourceView"
arch=(x86_64)
license=(LGPL)
depends=(gtk4 libxml2 pcre2)
makedepends=(gobject-introspection vala gi-docgen git meson)
checkdepends=(xorg-server-xvfb)
options=(debug)
_commit=b8df3c15f72f01c1a5b42ab865b076c3876c65bd  # tags/5.6.2^0
source=("git+https://gitlab.gnome.org/GNOME/gtksourceview.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd gtksourceview
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd gtksourceview
}

build() {
  arch-meson gtksourceview build -D gtk_doc=true
  meson compile -C build
}

check() {
  GTK_A11Y=none dbus-run-session xvfb-run -s '-nolisten local' \
    meson test -C build --print-errorlogs
}

package_gtksourceview5() {
  provides=(libgtksourceview-${pkgver%%.*}.so)

  meson install -C build --destdir "$pkgdir"

  mkdir -p doc/usr/share
  mv {"$pkgdir",doc}/usr/share/doc
}

package_gtksourceview5-docs() {
  pkgdesc+=" (documentation)"
  depends=()

  mv doc/* "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
