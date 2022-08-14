# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=mda-lv2
pkgname="$_pkgname-git"
pkgver=1.2.10.r244.da3df70
pkgrel=1
pkgdesc='A port of the MDA VST plugins to the LV2 format (git version)'
arch=(x86_64)
url='https://drobilla.net/software/mda-lv2/'
license=(GPL2)
groups=(lv2-plugins pro-audio)
depends=(gcc-libs glibc)
makedepends=(git lv2 meson python)
provides=($_pkgname "${_pkgname//-/.}")
conflicts=($_pkgname $_pkgname-svn "${_pkgname//-/.}")
source=("$_pkgname::git+https://gitlab.com/drobilla/mda-lv2.git")
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  local ver=$(grep -E "^\s+version: '[0-9]+\.[0-9]+\.[0-9]+'" meson.build | cut -d "'" -f 2)
  echo $ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  arch-meson -D tests=disabled $_pkgname $_pkgname-build
  meson compile -C $_pkgname-build
}

# tests require 'autoship', which is not packaged nor vendored in the project
#check() {
#  meson test -C $_pkgname-build
#}

package() {
  meson install -C $_pkgname-build --destdir "$pkgdir"
  install -vDm 644 $_pkgname/{NEWS,README.md} -t "$pkgdir"/usr/share/doc/$pkgname
}

# vim:set ts=2 sw=2 et:
