# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
pkgname=robot-ricochet
_pkgname=mirrored-lasers
pkgver=1.0.1
pkgrel=1
pkgdesc="You are a sneaky smuggler, who has had an unlucky encounter with the galactic police bots. Now you must evade capture by destroying the robots that have come aboard."
arch=('any')
url="https://codeberg.org/Samsai/mirrored-lasers"
license=('GPLv3')
makedepends=('rust')
depends=('sdl2' 'sdl2_gfx' 'sdl2_mixer' 'sdl2_image' 'sdl2_ttf')
provides=("${pkgname}" "${pkgname}-level-editor")
source=(
  "${pkgname}-${pkgver}.tar.gz::https://codeberg.org/Samsai/${pkgname}/archive/${pkgver}.tar.gz"
  "${pkgname}.desktop"
)
sha512sums=(
  '7daf91032a5a89dddd8703ddde09940ecf42f1e6054b89595328ac3d754037455564b80c6a4dcbb6abbe9b7a4ea2a44d51191d2edac75ddd1dc916b9d35ce135'
  'ebed3480deb63c54dbe38375efaf4b1c7e5a770b5cad914c9fb5e7583424d283c7734ce70b15301c1f91efd2ae73d2ad72440c5004d1d0e51b446440b2ca7bdc'
)
build() {
	cd "${srcdir}"/"${_pkgname}"
	cargo build --release
  cd level-editor
  cargo build --release  
}

package() {
	cd "${srcdir}"/"${_pkgname}"
	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/opt/${pkgname}/"
  cp -r data "${pkgdir}/opt/${pkgname}/"
	install -Dm755 "${startdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -Dm644 "icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm755 "target/release/${pkgname}" "${pkgdir}/opt/${pkgname}/${pkgname}"
	install -Dm755 "level-editor/target/release/level-editor" "${pkgdir}/usr/bin/${pkgname}-level-editor"
  echo -e "#!/bin/sh\ncd /opt/${pkgname}\n./${pkgname}" > "${pkgdir}/usr/bin/${pkgname}"
  chmod +x "${pkgdir}/usr/bin/${pkgname}"
}
