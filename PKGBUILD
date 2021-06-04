# Maintainer:  <reg-archlinux AT klein DOT tuxli DOT ch> 

_pkgname=signus
pkgname=${_pkgname}-git
pkgver=r257.415610a
pkgrel=1
pkgdesc="Signus: The Artefact Wars assic turn-based strategy war game similar to the old Battle Isle series."
arch=('x86_64' 'aarch64')
url="https://github.com/signus-game/signus"
license=('GPL2')
depends=('sdl2' 'sdl2_mixer' 'sdl2_ttf' 'sdl2_image' 'libvorbis' 'libjpeg-turbo')
makedepends=('git')
source=(
  "${_pkgname%-*}::git+https://github.com/signus-game/signus.git"
  "${_pkgname}.desktop"
)
sha512sums=(
  'SKIP'
  '6a791044c16bd93f34e8fd77953f310ae645ee0daad5ec4f469247caf9b8665327c3b799b1ac63d8df357255ec85765f4e329c14266232a058f7445775622656'
)
conflicts=(${_pkgname})

pkgver() {
	cd "${_pkgname}"
 	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  mkdir -p ${srcdir}/${_pkgname}/build
  #build signus
	cd "${srcdir}/${_pkgname}/signus"
  ./bootstrap
  ./configure --prefix=/usr/
  make
  make install DESTDIR=${srcdir}/${_pkgname}/build/
  #build signus-data
	cd "${srcdir}/${_pkgname}/signus-data"
  ./bootstrap
  ./configure --prefix=/usr/
  make
  make install DESTDIR=${srcdir}/${_pkgname}/build/
}

package() {
  install -Dm644 "${startdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  cp -rp ${srcdir}/${_pkgname}/build/* ${pkgdir}/
}
