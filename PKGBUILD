# Maintainer: Fabian Bornschein <fabiscafe-at-mailbox-dot-org>
# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

pkgbase=libspelling
pkgname=(
  libspelling
  libspelling-docs
)
pkgver=0.2.1
pkgrel=1
pkgdesc="Spellcheck library for GTK 4"
url="https://gitlab.gnome.org/chergert/libspelling"
arch=(x86_64)
license=(LGPL-2.1-or-later)
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
_commit=0e9b8b2187ecda4dc1ce48a9bcc9a9976490fda2  # tags/0.2.1^0
source=("git+https://gitlab.gnome.org/chergert/libspelling.git#commit=$_commit")
b2sums=('dc5652e327307165231869321010c9d98e0b4521c4ee090aa326ed2c25d17070a8217cc4bd049a4d89c76de73ed0457b8fc8b8533bfb209b7b2f6d2a0eb2895c')

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
