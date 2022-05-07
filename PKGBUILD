# Maintainer: Duncan Deveaux <duncan.at.hikounomizu.dot.org>

pkgname=hikounomizu
pkgver=0.9.2
pkgrel=1
pkgdesc="Platform-based, anime-styled fighting game"
arch=('x86_64')
url="https://hikounomizu.org"
license=('custom')
depends=('sdl2' 'sdl2_image' 'glu' 'freetype2' 'openal' 'libvorbis' 'pugixml')
makedepends=('cmake>=3.13' 'gendesk')
source=("https://download.tuxfamily.org/hnm/0.9.2/hikounomizu-0.9.2-src-withdata.tar.bz2")
md5sums=('f8ecea96166ee979242b2c37fe3580fe')


prepare() {
	
	gendesk -n --pkgname "${pkgname}" --pkgdesc "${pkgdesc}" \
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
	install -Dm644 "${pkgname}-${pkgver}/GPL" "${pkgdir}/usr/share/licenses/${pkgname}/GPL"
	install -Dm644 "${pkgname}-${pkgver}/FAL" "${pkgdir}/usr/share/licenses/${pkgname}/FAL"
	install -Dm644 "${pkgname}-${pkgver}/README" "${pkgdir}/usr/share/doc/${pkgname}/README"
	
	# Install Desktop & Icon files
	install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -Dm644 "${pkgname}-${pkgver}/data/gfx/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
	
	# Install data & binary
	make -C build DESTDIR="${pkgdir}" install
}

