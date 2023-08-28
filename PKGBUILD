# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=lv2lint
pkgname="$_pkgname-git"
pkgver=0.16.2.r44.g5f72b03
pkgrel=1
pkgdesc='Check whether a given LV2 plugin is up to the specification (git version)'
arch=(x86_64)
url="https://git.open-music-kontrollers.ch/~hp/lv2lint"
license=(Artistic2.0)
depends=(glibc libelf)
makedepends=(curl git lilv lv2 meson)
checkdepends=(reuse)
provides=($_pkgname)
conflicts=($_pkgname)
source=("$_pkgname::git+https://git.open-music-kontrollers.ch/~hp/lv2lint")
md5sums=('SKIP')


pkgver() {
  cd $_pkgname
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed -e 's/^v//' -e 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  arch-meson -Donline-tests=enabled -Delf-tests=enabled $_pkgname-build $_pkgname
  meson compile -C $_pkgname-build
}

check() {
  meson test -C $_pkgname-build
}

package() {
  depends+=(libcurl.so liblilv-0.so)
  meson install -C $_pkgname-build --destdir "$pkgdir"
  install -vDm 644 $_pkgname/{ChangeLog,README.md,TODO} \
    -t "$pkgdir"/usr/share/doc/$pkgname
}

# vim:set ts=2 sw=2 et:
