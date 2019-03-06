# Maintainer: 100best
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

_pkgname=libdazzle
pkgname=libdazzle-unstable
pkgver=3.31.90
pkgrel=1
pkgdesc="A library to delight your users with fancy features"
url="https://gitlab.gnome.org/GNOME/libdazzle"
arch=(x86_64)
license=(LGPL)
depends=(gtk3)
makedepends=(git meson vala gobject-introspection gtk-doc)
checkdepends=(xorg-server-xvfb)
_commit=2c37ca5864418440bc8060fe3eadcc1a95a6d1b1  # tags/3.31.90^0
source=("git+https://gitlab.gnome.org/GNOME/libdazzle.git#commit=$_commit")
sha256sums=('SKIP')
conflicts=(libdazzle libdazzle-git)
provides=(libdazzle)

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

build() {
  arch-meson $_pkgname build -D enable_gtk_doc=true
  ninja -C build
}

check() {
  xvfb-run dbus-run-session meson test -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
