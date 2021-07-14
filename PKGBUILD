# Maintainer: Triss Healy (trissylegs) <th at trissyle dot gs>

pkgname=libshumate-git
pkgver=0.0
pkgrel=1
pkgdesc="GTK4 widget to display maps (git version)"
arch=(x86_64)
url="https://wiki.gnome.org/Projects/libshumate"
license=(LGPL)
depends=(gtk4 libsoup sqlite)
makedepends=(git gobject-introspection gtk-doc gi-docgen meson vala)
provides=("libshumate" "libshumate-${pkgver}.so")

source=("git+https://gitlab.gnome.org/GNOME/${pkgname/-git/}.git")
sha256sums=('SKIP')

pkgver() {    
  # Read version number from meson file.
  grep -oP "(?<=version: ')\d+\.\d+" ${pkgname/-git/}/meson.build
}

prepare() {
  cd ${pkgname/-git/}
}

build() {
  arch-meson ${pkgname/-git/} build -D gtk_doc=true
  ninja -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
