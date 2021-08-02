# Maintainer:  <reg-archlinux AT klein DOT tuxli DOT ch> 

_pkgname=dungeonrush
pkgname=${_pkgname}-git
pkgver=r123.2b45a05
pkgrel=2
pkgdesc="A opensource game inspired by Snake with RPG elements, written in pure C with SDL"
arch=('x86_64' 'aarch64')
url="https://github.com/Rapiz1/DungeonRush.git"
license=('MIT')
depends=('sdl2' 'sdl2_mixer' 'sdl2_ttf' 'sdl2_net' 'sdl2_image')
makedepends=('git' 'cmake')
source=("${_pkgname}::git+${url}")
sha256sums=('SKIP')
conflicts=("${_pkgname}")

pkgver() {
	cd "${_pkgname}"
 	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	sed -i "s#res/#/opt/${_pkgname}/res/#g" "${srcdir}/${_pkgname}/src/res.c"
  sed -i "s#storage.dat#/opt/${_pkgname}/save/storage.dat#g" "${srcdir}/${_pkgname}/src/storage.h"
}

build() {
	cd "${srcdir}/${_pkgname}"
  cmake .
  make
}

package() {
	cd "${srcdir}/${_pkgname}"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  mkdir -p "${pkgdir}/opt/${_pkgname}/save"
  chmod 777 "${pkgdir}/opt/${_pkgname}/save"
	cp -r "bin/res" "${pkgdir}/opt/${_pkgname}/"
  install -Dm755 "bin/dungeon_rush" "${pkgdir}/usr/bin/${_pkgname}"
}
