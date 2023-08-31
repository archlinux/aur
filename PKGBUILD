# Maintainer: Duncan Deveaux <duncan.at.hikounomizu.dot.org>

pkgname=hikounomizu
pkgver=1.0
pkgrel=1
pkgdesc="Platform-based, anime-styled fighting game"
arch=('x86_64')
url="https://hikounomizu.org"
license=('custom')
depends=('sdl2' 'sdl2_image' 'libgl' 'freetype2' 'openal' 'libvorbis' 'enet' 'pugixml')
makedepends=('cmake>=3.13' 'gendesk')
source=("https://download.tuxfamily.org/hnm/1.0/hikounomizu-1.0-src-withdata.tar.bz2")
md5sums=('7c1debbddefdceadff335dfcb19ea7ef')


prepare() {

	gendesk -n -f --pkgname "${pkgname}" --pkgdesc "${pkgdesc}" \
	    --name 'Hikou no mizu' --categories 'Game;ArcadeGame'
}

build() {

	cmake -B build -S "${pkgname}-${pkgver}" \
		-DCMAKE_BUILD_TYPE='None' \
		-DCMAKE_INSTALL_PREFIX='/usr' \
		-Wno-dev
	make -C build
}

package() {

	# Install License & README
	install -Dm644 "${pkgname}-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
	install -Dm644 "${pkgname}-${pkgver}/datasrc/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/DATA_COPYING"
	install -Dm644 "${pkgname}-${pkgver}/GPL" "${pkgdir}/usr/share/licenses/${pkgname}/GPL"
	install -Dm644 "${pkgname}-${pkgver}/datasrc/FAL" "${pkgdir}/usr/share/licenses/${pkgname}/FAL"
	install -Dm644 "${pkgname}-${pkgver}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "${pkgname}-${pkgver}/CHANGES.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGES.md"

	# Install Desktop & Icon files
	install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -Dm644 "${pkgname}-${pkgver}/data/gfx/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

	# Install data & binary
	make -C build DESTDIR="${pkgdir}" install
}

