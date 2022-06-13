# Maintainer:  <reg-archlinux AT klein DOT tuxli DOT ch> 

_pkgname=wanderers
pkgname=${_pkgname}-git
pkgver=r97.054c1cd
pkgrel=2
pkgdesc="An open world adventure and dungeon crawling game"
arch=('x86_64')
url="https://github.com/a-nikolaev/wanderers"
license=('GPL3')
depends=('ocaml' 'ocaml-graphics' 'sdl2' 'sdl2_mixer' 'sdl2_ttf' 'sdl2_net' 'sdl2_image')
makedepends=('git')
source=(
"${pkgname%-*}::git+https://github.com/a-nikolaev/wanderers.git"
game.save
wanderers.desktop
wanderers.png
)
sha256sums=(
'SKIP'
'885e40f5eda48b5e038c21e95205f26a6926b1c57945a6372a3e3a921a955fd2'
'10cbbe46afda68f125da45a1e66440f24229fdad3600a3aed86150107ebc9dbe'
'3fa60dca3791f6bf62abe0904abf7bdb2b2b3ca3ca0162b9e254c8cbb1f7c502'
)

pkgver() {
	cd "${_pkgname}"
 	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_pkgname}"
  make 
}

package() {
  mkdir -p "${pkgdir}/usr/share/games/${_pkgname}"
  mkdir -p "${pkgdir}/usr/bin/"
  mkdir -p ${pkgdir}/usr/share/icons/hicolor/64x64/apps/
  install -Dm644 "${srcdir}/../${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  cp "${srcdir}/../${_pkgname}.png" ${pkgdir}/usr/share/icons/hicolor/64x64/apps/${_pkgname}.png
	cp -r "${srcdir}/${_pkgname}/${_pkgname}" "${pkgdir}/usr/share/games/${_pkgname}/"
	cp -r "${srcdir}/${_pkgname}/lib" "${pkgdir}/usr/share/games/${_pkgname}/"
	cp -r "${srcdir}/${_pkgname}/data" "${pkgdir}/usr/share/games/${_pkgname}/"
	cp -r "${srcdir}/../game.save" "${pkgdir}/usr/share/games/${_pkgname}/"
	chmod o+rw "${pkgdir}/usr/share/games/${_pkgname}/game.save"
  echo -e "#!/bin/sh\ncd /usr/share/games/${_pkgname}\n./${_pkgname} \$@" > ${pkgdir}/usr/bin/${_pkgname} 
  chmod +x ${pkgdir}/usr/bin/${_pkgname}
}
