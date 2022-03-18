# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=lv2lint
pkgname="${_pkgname}-git"
pkgver=0.14.0.r4.g7fd756b
pkgrel=1
pkgdesc="Check whether a given LV2 plugin is up to the specification"
arch=('i686' 'x86_64')
url="https://github.com/OpenMusicKontrollers/lv2lint"
license=('Artistic2.0')
depends=('curl' 'libelf' 'lilv')
makedepends=('git' 'meson')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/OpenMusicKontrollers/${_pkgname}.git")
md5sums=('SKIP')


pkgver() {
  cd "${srcdir}/${_pkgname}"

  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${srcdir}/${_pkgname}"

  meson --prefix /usr -Donline-tests=enabled -Delf-tests=enabled build
  ninja -v -C build reconfigure
  ninja -v -C build
}

package() {
  cd "${srcdir}/${_pkgname}"

  DESTDIR="$pkgdir" ninja -C build install
}

# vim:set ts=2 sw=2 et:
