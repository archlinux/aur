# Maintainer: Fabian Bornschein <fabiscafe-at-mailbox-dot-org>
# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

pkgbase=libspelling
pkgname=(
  libspelling
  libspelling-docs
)
pkgver=0.2.0
pkgrel=1
pkgdesc="Spellcheck library for GTK 4"
url="https://gitlab.gnome.org/chergert/libspelling"
arch=(x86_64)
license=(LGPL)
depends=(
  enchant
  gtk4
  gtksourceview5
  icu
  pango
)
makedepends=(
  gi-docgen
  git
  gobject-introspection
  meson
  vala
)
_commit=baefb81b3b236e3bd29c0aa23f79056b2636e311  # tags/0.2.0^0
source=("git+https://gitlab.gnome.org/chergert/libspelling.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

build() {
  arch-meson $pkgname build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package_libspelling() {
  provides=(libspelling-1.so)

  meson install -C build --destdir "$pkgdir"

  mkdir -p doc/usr/share
  mv {"$pkgdir",doc}/usr/share/doc
}

package_libspelling-docs() {
  pkgdesc+=" (documentation)"
  depends=()

  mv doc/* "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
