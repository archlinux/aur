# Maintainer: kotontrion <kotontrion@tutanota.de>

pkgname=libastal-battery-git
_pkgname=battery
pkgver=r785.4e455bb
pkgrel=1
provides=(astal-battery libastal-battery libastal-battery.so=0-64)
pkgdesc="DBus proxy library for upower daemon"
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
            'dd91c54c081c16e253b05fd293f283f0bf9707973688eb2acf9e3df7fc6c85a8')

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

