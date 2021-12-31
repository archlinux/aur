# Maintainer:  <reg-archlinux AT klein DOT tuxli DOT ch> 

pkgname=dungeonrush
_pkgname=DungeonRush
pkgver=1.1
_pkgprever=beta
pkgrel=4
pkgdesc="A opensource game inspired by Snake with RPG elements, written in pure C with SDL"
arch=('x86_64' 'aarch64')
url="https://github.com/Rapiz1/${_pkgname}"
license=('MIT')
depends=('sdl2' 'sdl2_mixer' 'sdl2_ttf' 'sdl2_net' 'sdl2_image')
makedepends=('cmake')
source=("${pkgname}-${pkgver}-${_pkgprever}.tar.gz::${url}/archive/refs/tags/v${pkgver}-${_pkgprever}.tar.gz")
sha256sums=('295b83cb023bf5d21318992daee125399892bdf16a87c835dfc90b841c929eda')
conflicts=("${pkgname}-git")

prepare() {
	sed -i "s#res/#/opt/${pkgname}/res/#g" "${srcdir}/${_pkgname}-${pkgver}-${_pkgprever}/src/res.c"
	sed -i "s#storage.dat#/opt/${pkgname}/save/storage.dat#g" "${srcdir}/${_pkgname}-${pkgver}-${_pkgprever}/src/storage.h"
}

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}-${_pkgprever}"
  cmake .
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}-${_pkgprever}"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  mkdir -p "${pkgdir}/opt/${pkgname}/save"
  chmod 777 "${pkgdir}/opt/${pkgname}/save"
  cp -r "bin/res" "${pkgdir}/opt/${pkgname}/"
  install -Dm755 "bin/dungeon_rush" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"
}
