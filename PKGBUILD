# Maintainer: kotontrion <kotontrion@tutanota.de>

pkgname=libastal-tray-git
_pkgname=tray
pkgver=r785.4e455bb
pkgrel=1
provides=(astal-tray libastal-tray libastal-tray.so=0-64)
pkgdesc="Library and cli tool for managing the systemtray."
arch=(x86_64)
license=(LGPL-2.1-only)
url="https://github.com/Aylur/astal"
depends=(
  glib2
  glibc
  json-glib
  gtk3
  gdk-pixbuf2
  appmenu-glib-translator-git
)
makedepends=(
  meson
  git
  gobject-introspection
  vala
)
groups=("libastal")
source=("git+${url}.git" "skip_valadoc.patch")
sha256sums=('SKIP'
            '93eac08c6d669d87dffbbd907c0df7af43e5b20edc5537db679c9ed023d03fc8')

pkgver() {
  cd astal
  #git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd astal 
    patch -Np1 -i ../skip_valadoc.patch
}


build() {
  cd astal/lib/$_pkgname
  arch-meson build
  meson compile -C build
}

package() {
  cd astal/lib/$_pkgname
  meson install -C build --destdir "$pkgdir"
}

