# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=lv2lint
pkgname="$_pkgname-git"
pkgver=0.16.0.r1.g9e5f789
pkgrel=2
pkgdesc='Check whether a given LV2 plugin is up to the specification (git version)'
arch=(x86_64)
url="https://github.com/OpenMusicKontrollers/lv2lint"
license=(Artistic2.0)
depends=(glibc libelf)
makedepends=(curl git lilv meson)
checkdepends=(reuse)
provides=($_pkgname)
conflicts=($_pkgname)
source=("$_pkgname::git+https://github.com/OpenMusicKontrollers/$_pkgname.git"
        'lv2lint-BSD-3-Clause.txt'
        'lv2lint-MIT.txt')
md5sums=('SKIP'
         '71f739ef75581cae312e8c711bcdab16'
         '7dda4e90ded66ab88b86f76169f28663')


pkgver() {
  cd $_pkgname
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  # placate reuse linting
  cp lv2lint-BSD-3-Clause.txt $_pkgname/LICENSES/BSD-3-Clause.txt
  cp lv2lint-MIT.txt $_pkgname/LICENSES/MIT.txt
}

build() {
  cd $_pkgname
  arch-meson -Donline-tests=enabled -Delf-tests=enabled build
  meson compile -C build
}

check() {
  cd $_pkgname
  meson test -C build
}

package() {
  depends+=(libcurl.so liblilv-0.so)
  cd $_pkgname
  DESTDIR="$pkgdir" meson install -C build
}

# vim:set ts=2 sw=2 et:
