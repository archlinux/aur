# Maintainer: kotontrion <kotontrion@tutanota.de>

pkgname=libastal-mpris-git
_pkgname=mpris
pkgver=r785.4e455bb
pkgrel=1
provides=(astal-mpris libastal-mpris libastal-mpris.so=0-64)
pkgdesc="Library and cli tool for controlling media players"
arch=(x86_64)
license=(LGPL-2.1-only)
url="https://github.com/Aylur/astal"
depends=(
  glib2
  glibc
  json-glib
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
            'd140115561953b67894d27ce0b1581c7618109b8c9bebf6622aab547c6ed126a')

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

