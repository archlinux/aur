# Maintainer: Fabian Bornschein <fabiscafe-at-mailbox-dot-org>
# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgbase=gtksourceview5
pkgname=(
  gtksourceview5
  gtksourceview5-docs
)
pkgver=5.10.0
pkgrel=1
pkgdesc="A text widget adding syntax highlighting and more to GNOME"
url="https://wiki.gnome.org/Projects/GtkSourceView"
arch=(x86_64)
license=(LGPL)
depends=(
  cairo
  fontconfig
  fribidi
  gdk-pixbuf2
  glib2
  gtk4
  hicolor-icon-theme
  libxml2
  pango
  pcre2
)
makedepends=(
  gi-docgen
  git
  gobject-introspection
  meson
  vala
)
checkdepends=(xorg-server-xvfb)
_commit=fd0b63d6926a3b2cdfbc4fafc1d16bcab5eced3b  # tags/5.10.0^0
source=("git+https://gitlab.gnome.org/GNOME/gtksourceview.git#commit=$_commit")
b2sums=('SKIP')

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
