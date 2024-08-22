# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Micael Soder <zoulnix@gmail.com>

pkgname=bombermaaan
pkgver=2.2.8.2275
pkgrel=1
pkgdesc='A classic Bomberman-like game with multiplayer support'
arch=('i686' 'x86_64')
url='https://github.com/bjaraujo/Bombermaaan'
license=('GPL3' 'custom:Proprietary')
depends=('sdl2' 'sdl2_mixer')
makedepends=('cmake')
install=$pkgname.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bjaraujo/Bombermaaan/archive/refs/tags/v${pkgver}.tar.gz"
        'Bombermaan_levels_pack.zip')
sha256sums=('34a867305d8db32797d0d103d915103be1fabd78305b1bad4b359de9976c35c0'
            '7a73655f609096271434d20e8a9c33b9af71c547a4a1fc312fbd85866f6c8519')

_srcdir="Bombermaaan-${pkgver}"

build() {
	cmake -S "${_srcdir}/trunk" -B build -DCMAKE_BUILD_TYPE=None -DCMAKE_INSTALL_PREFIX="/usr/share/games/${pkgname}" \
		-DNETWORK_MODE=OFF
	cmake --build build
}

package() {
	DESTDIR="${pkgdir}" cmake --install build

	# level pack by feillyne: http://www.moddb.com/games/bombermaaan/addons/level-pack-151-levels
	install -m644 'Levels'/* "${pkgdir}/usr/share/games/${pkgname}/levels"

	cd "${_srcdir}"

	# doc
	install -Dm644 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname}"

	# .desktop entry
	install -Dm644 "installers/${pkgname}.svg" -t "${pkgdir}/usr/share/pixmaps"
	install -Dm644 "installers/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"

	install -dm755 "${pkgdir}/usr/bin"
	ln -sf "/usr/share/games/${pkgname}/Bombermaaan" "${pkgdir}/usr/bin/${pkgname}"
}
