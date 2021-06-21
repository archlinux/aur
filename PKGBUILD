# Maintainer:  <reg-archlinux AT klein DOT tuxli DOT ch> 

_pkgname=koifarm
pkgname=${_pkgname}-git
pkgver=r1043.4bba78a
pkgrel=1
pkgdesc="Koi Farm, the koi breeding game"
arch=('x86_64')
conflicts=(${_pkgname})
url="https://jobtalle.itch.io/koifarm"
license=('Apache')
makedepends=('git' 'electron' 'npm' 'nodejs') 
source=(
${pkgname%-*}::git+https://github.com/jobtalle/Koi.git
koifarm.desktop
koifarm.png
)
sha256sums=(
'SKIP'
'3afe3fb935cadce132df159d6e43f17447f41e305973a94f91ac8e027d98d063'
'c7bb9e77f83ac92f77611d4fc3310ab1a00e4bd2bb2e652881babe9977570ba2'
)

prepare() {
	cd "${_pkgname}"
	git submodule update --init --recursive
}

pkgver() {
	cd "${_pkgname}"
 	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${_pkgname}"
	npm i
  npm run build-linux-64
}

package() {
  mkdir -p ${pkgdir}/usr/share/games/${_pkgname}/save
  chmod 777 ${pkgdir}/usr/share/games/${_pkgname}/save
  mkdir -p ${pkgdir}/usr/bin/
  mkdir -p ${pkgdir}/usr/share/icons/hicolor/64x64/apps/
  install -Dm644 "${startdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  cp "${startdir}/${_pkgname}.png" ${pkgdir}/usr/share/icons/hicolor/64x64/apps/${_pkgname}.png
  cp -ar ${srcdir}/${_pkgname}/KoiFarm-linux-x64/* ${pkgdir}/usr/share/games/${_pkgname}/
  echo -e "#!/bin/sh\ncd /usr/share/games/${_pkgname}\n./KoiFarm" > ${pkgdir}/usr/bin/${_pkgname}
  chmod +x ${pkgdir}/usr/bin/${_pkgname}
	install -Dm644 ${srcdir}/${_pkgname}/LICENSE.md "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

