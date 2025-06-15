# Maintainer: kotontrion <kotontrion@tutanota.de>
pkgbase=libastal-git
pkgname=("libastal-git")
_pkgname=libastal
pkgver=r785.4e455bb
pkgrel=1
pkgdesc="Building blocks for building desktop shells."
arch=("x86_64")
license=(LGPL-2.1-only)
url="https://github.com/Aylur/astal"
makedepends=(
  "git"
  "wayland" "wayland-protocols"
  "gobject-introspection" "meson" "vala")
depends=("glib2" "glibc" "gtk3" "gtk-layer-shell" "gdk-pixbuf2" "wayland" "libastal-io")
provides=(libastal libastal.so=3-64)
groups=("libastal")
source=("git+${url}.git" "skip_valadoc.patch")
sha256sums=('SKIP'
            'ff21f00551107779bea48a7d545a7117d1db2ea533b82406d25bda76cbc37706')
_rockname=astal-dev-1.rockspec

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
  cd astal/lib/astal/gtk3
  arch-meson build
  meson compile -C build
}

package() {
  cd astal/lib/astal/gtk3
  meson install -C build --destdir "$pkgdir"
}

