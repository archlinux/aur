# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=libgdata
pkgver=0.17.12
pkgrel=1
pkgdesc="GLib-based library for accessing online service APIs using the GData protocol"
url="https://wiki.gnome.org/Projects/libgdata"
arch=(x86_64)
license=(GPL)
depends=(libsoup gcr gnome-online-accounts)
makedepends=(gobject-introspection vala uhttpmock git gtk-doc meson)
_commit=6fd85102e7dcf7414000264a263465ba5cb894e4  # tags/0.17.12^0
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
  arch-meson $pkgname build -D installed_tests=false -D man=true
  ninja -C build
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
