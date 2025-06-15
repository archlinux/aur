# Maintainer: kotontrion <kotontrion@tutanota.de>
pkgname=("libastal-4-git")
pkgver=r785.4e455bb
pkgrel=1
pkgdesc="Building blocks for building desktop shells using gtk4."
arch=("x86_64")
license=(LGPL-2.1-only)
url="https://github.com/Aylur/astal"
makedepends=(
  "git"
  "gobject-introspection" "meson" "vala")
depends=("glib2" "glibc" "gtk4" "gtk4-layer-shell" "gdk-pixbuf2" "wayland" "libastal-io")
provides=(libastal-4 libastal-4.so=4-64)
groups=("libastal")
source=("git+${url}.git" "skip_valadoc.patch")
sha256sums=('SKIP'
            '4b27b26e4a522017142f7d21f692592b69072a4e1e1a9e2c2e9aa4188a867a75')

pkgver(){
  cd astal
  # git describe --long --tags --abbrev=7 | sed "s/^v//;s/\([^-]*-g\)/r\1/;s/-/./g"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd astal 
    patch -Np1 -i ../skip_valadoc.patch
}

build() {
  cd astal/lib/astal/gtk4
  arch-meson build
  meson compile -C build
}

package() {
  cd astal/lib/astal/gtk4
  meson install -C build --destdir "$pkgdir"
}

