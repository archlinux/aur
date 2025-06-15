# Maintainer: kotontrion <kotontrion@tutanota.de>

pkgname=libastal-hyprland-git
_pkgname=hyprland
pkgver=r786.ca3190d
pkgrel=1
provides=(astal-hyprland libastal-hyprland libastal-hyprland.so=0-64)
pkgdesc="Library and cli tool for Hyprland IPC sockets"
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
            '7c025b5aaa41370c0dd7ba07a4175b2153f561588f76b98943e834913bd57fb0')

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

