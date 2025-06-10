# Maintainer: username227 <gfrank227 [at] gmail [dot] com>
# Contributor: Fabian Bornschein <fabiscafe-at-mailbox-dot-org>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

pkgbase=libpeas136
pkgname=(
  libpeas136
  libpeas136-demos
  libpeas136-docs
)
pkgver=1.36.0
pkgrel=1
pkgdesc="GObject Plugin System version 1.36.0 with working pythonloader when used together with with python-gobject350"
url="https://wiki.gnome.org/Projects/Libpeas"
arch=(x86_64)
license=(LGPL-2.1-or-later)
depends=(
  glib2
  glibc
  gtk3
  hicolor-icon-theme
  libgirepository
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
  python
  python-gobject
  python-setuptools
  vala
)
checkdepends=(xorg-server-xvfb)
source=("git+https://gitlab.gnome.org/GNOME/libpeas.git#tag=libpeas-$pkgver")
b2sums=('8845366ccd5c0244a6ed1b28d5b44590496d260db0da47bc0ac87b2063c1063ee92541bc7f4eb056bb2c52d1299febedf517e90b9dc8765a0f3f9f954430e691')
conflicts=("libpeas")

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

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

package_libpeas136() {
  depends=(
    'lua51-lgi'
    'python-gobject'
  )
  provides=(libpeas)

  meson install -C build --destdir "$pkgdir"

  cd "$pkgdir"

  _pick demo usr/bin/peas-demo
  _pick demo usr/lib/peas-demo

  _pick docs usr/share/doc
}

package_libpeas136-demos() {
  pkgdesc+=" (demo applications)"
  depends=(
    glib2
    glibc
    gtk3
    libgirepository
    libpeas
    python-gobject
  )
  mv demo/* "$pkgdir"
}

package_libpeas136-docs() {
  pkgdesc+=" (documentation)"
  depends=()
  mv docs/* "$pkgdir"
}

# vim:set sw=2 sts=-1 et:

