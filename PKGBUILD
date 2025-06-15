# Maintainer: kotontrion <kotontrion@tutanota.de>

pkgname=libastal-bluetooth-git
_pkgname=bluetooth
pkgver=r785.4e455bb
pkgrel=1
provides=(astal-bluetooth libastal-bluetooth libastal-bluetooth.so=0-64)
pkgdesc="library to control bluez over dbus "
arch=(x86_64)
license=(LGPL-2.1-only)
url="https://github.com/Aylur/astal"
depends=(
  glib2
  glibc
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
            '7037b665a3997ef774edda01356014e5517b1f7c901938bb9692e67d3fbba915')

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

