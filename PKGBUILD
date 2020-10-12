# Maintainer:  <reg-archlinux AT klein DOT tuxli DOT ch> 

_pkgname=dungeonrush
pkgname=${_pkgname}-git
pkgver=r101.136d3cb
pkgrel=1
pkgdesc="A opensource game inspired by Snake with RPG elements, written in pure C with SDL"
arch=('x86_64' 'aarch64')
url="https://github.com/Rapiz1/DungeonRush.git"
license=('MIT')
depends=('sdl2' 'sdl2_mixer' 'sdl2_ttf' 'sdl2_net' 'sdl2_image')
makedepends=('sed' 'git' 'cmake' 'sdl2' 'sdl2_mixer' 'sdl2_ttf' 'sdl2_net' 'sdl2_image')
source=("${pkgname%-*}::git+https://github.com/Rapiz1/DungeonRush.git")
sha1sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
 	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	sed -i "s#res/#/opt/${_pkgname}/res/#g" "${srcdir}/${_pkgname}/src/res.c"
}

build() {
	cd "${srcdir}/${_pkgname}"
  cmake .
  make
}

package() {
	install -D -m644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  mkdir -p "${pkgdir}/opt/${_pkgname}"
  mkdir -p "${pkgdir}/usr/bin/"
	ln -s "/opt/${_pkgname}/dungeon_rush" "${pkgdir}/usr/bin/${_pkgname}"
	cp -r "${srcdir}/${_pkgname}/bin/res" "${pkgdir}/opt/${_pkgname}/"
	cp -r "${srcdir}/${_pkgname}/bin/dungeon_rush" "${pkgdir}/opt/${_pkgname}/"
}
