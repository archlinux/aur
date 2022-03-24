# Maintainer: Zhangyuan Nie <yuan@znie.org>

pkgname=butter-git
pkgver=r71.44fec7f
pkgrel=1
pkgdesc="GTK application for Btrfs snapshot management"
arch=('x86_64')
url="https://github.com/zhangyuannie/butter"
license=('GPL3')
depends=('gtk4' 'libadwaita' 'polkit' 'btrfs-progs' 'python')
makedepends=('meson' 'rust' 'git')
conflicts=('butter')
provides=('butter')
source=("${pkgname}::git+https://github.com/zhangyuannie/butter.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  local l=$(grep -A 3 "\<project(" "meson.build" | grep "\<version\>" | sed "s|.*version: '\(.*\)'.*|\1|")
  local r=$(printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)")
  printf "%s.%s" "${l}" "${r}"
}

build() {
  cd "${pkgname}"
  arch-meson . build
  meson compile -C build
}

package() {
  cd "${pkgname}"
  DESTDIR="${pkgdir}" meson install -C build
}
