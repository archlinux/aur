# Maintainer: Fabian Bornschein <fabiscafe-at-mailbox-dot-org>
# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

pkgname=libpeas138
pkgver=1.38.0.alpha
pkgrel=4
pkgdesc="GObject Plugin System"
url="https://wiki.gnome.org/Projects/Libpeas"
arch=(x86_64)
license=(LGPL-2.1-or-later)
depends=(
  glib2
  glibc
  gtk3
  hicolor-icon-theme
)
makedepends=(
  gi-docgen
  git
  glade
  glib2-devel
  gobject-introspection
  lua51
  lua51-lgi
  luajit
  meson
  vala
  python
  python-gobject
  python-setuptools
)
optdepends=(
  'lua51-lgi: Lua loader'
  'python-gobject: Python loader'
)
conflicts=(libpeas)
provides=(
  libpeas{,-gtk}-1.0.so
  "libpeas=$pkgver"
)

checkdepends=(xorg-server-xvfb)
source=("git+https://gitlab.gnome.org/GNOME/libpeas.git#branch=1.38")
b2sums=('SKIP')

prepare() {
  cd libpeas
}

build() {
  local meson_options=(
    -D gtk_doc=true
    -D vapi=true
  )

  arch-meson libpeas build "${meson_options[@]}"
  meson compile -C build
}

check() {
  xvfb-run -s '-nolisten local' \
    meson test -C build --print-errorlogs
}

package() {

  meson install -C build --destdir "$pkgdir"

  cd "$pkgdir"

  rm -rf usr/bin/peas-demo
  rm -rf usr/lib/peas-demo
  rm -rf usr/share/doc
}

# vim:set sw=2 sts=-1 et:
