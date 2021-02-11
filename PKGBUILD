# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=libgdata
pkgver=0.18.0
pkgrel=1
pkgdesc="GLib-based library for accessing online service APIs using the GData protocol"
url="https://wiki.gnome.org/Projects/libgdata"
arch=(x86_64)
license=(GPL)
depends=(libsoup gcr gnome-online-accounts)
makedepends=(gobject-introspection vala uhttpmock git gtk-doc meson)
_commit=c6abf33ca4678c972d63392df034dbc8caf9e514  # tags/0.18.0^0
source=("git+https://gitlab.gnome.org/GNOME/libgdata.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed -e 's/-/+/g'
}

prepare() {
  cd $pkgname
}

build() {
  arch-meson $pkgname build -D man=true -D gtk_doc=true
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  depends+=(libsoup-2.4.so)
  provides+=(libgdata.so)

  DESTDIR="$pkgdir" meson install -C build
}

# vim:set sw=2 et:
