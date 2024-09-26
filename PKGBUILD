# Maintainer: hermes83

pkgname=gedit-externaltools-plugin
pkgver=48.0
pkgrel=1
pkgdesc="Externaltools plugin for the gedit Text Editor"
url="https://github.com/hermes83/gedit-externaltools-plugin"
arch=(x86_64)
license=(GPL-2.0-or-later)
depends=(
  dconf
  gedit
  glib2
  glibc
  gtk3
  libgedit-gtksourceview
  libgedit-tepl
  libpeas
  pango
  python
  python-cairo
  python-dbus
  python-gobject
)
makedepends=(
  appstream-glib
  git
  gobject-introspection
  gucharmap
  libgit2-glib
  meson
  vte3
  yelp-tools
)
optdepends=(
  'vte3: for embedded terminal'
)
source=("git+https://github.com/hermes83/gedit-externaltools-plugin.git#tag=${pkgver/[a-z]/.&}")
b2sums=('a9b0f4d167d8804533099cf8c6d222014b4585e029c67d9d7326495958b9408b26e4ff9f71e822c0d0251f28f447c7f6b5e3a3ca3eee57a5721a301c3b0213ce')

prepare() {
  cd $pkgname
}

build() {
  arch-meson $pkgname build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"

  # Plugins not handled by meson's python.bytecompile
  python -m compileall -d "/usr/lib/gedit" "$pkgdir/usr/lib/gedit"
  python -O -m compileall -d "/usr/lib/gedit" "$pkgdir/usr/lib/gedit"
}

# vim:set sw=2 sts=-1 et:
