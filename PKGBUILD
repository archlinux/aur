# Maintainer: Duncan Deveaux <duncan.at.hikounomizu.dot.org>

pkgname=hikounomizu
pkgver=1.1
pkgrel=2
pkgdesc="Platform-based, anime-styled fighting game"
arch=('x86_64')
url="https://hikounomizu.org"
license=('custom')
depends=('sdl2' 'sdl2_image' 'libgl' 'freetype2' 'openal' 'libvorbis' 'enet' 'pugixml')
makedepends=('cmake>=3.25' 'gendesk')
source=("https://gitlab.com/api/v4/projects/9166374/packages/generic/hikounomizu/1.1/hikounomizu-1.1-src-withdata.tar.bz2")
md5sums=('3ff578225dd9783c5d4c84fbbe8f0979')


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
	install -Dm644 "${pkgname}-${pkgver}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "${pkgname}-${pkgver}/CHANGES.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGES.md"

	# Install Desktop & Icon files
	install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -Dm644 "${pkgname}-${pkgver}/data/gfx/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

	# Install data & binary
	make -C build DESTDIR="${pkgdir}" install
}

