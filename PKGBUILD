# Maintainer: Jordan Christiansen <xordspar0@gmail.com>

# To do:
# * If upstream adds a way to specify the location of the data files, move the
#   package contents to /usr/bin/ and /usr/share/.

pkgname=gearhead
_reponame=gearhead-1
pkgver=1.302
pkgrel=4
pkgdesc="A rougelike mecha role playing game"
arch=(i686 x86_64)
url="http://www.gearheadrpg.com/"
license=('LGPL')
depends=(sdl sdl_image sdl_ttf)
makedepends=(fpc)
source=("https://github.com/jwvhewitt/${_reponame}/archive/v${pkgver}.tar.gz"
		${pkgname}.sh
		${pkgname}.desktop
		${pkgname}.png)
md5sums=('6699f67d4f28bc81cb23181bbba58b58'
         '72108dac70046280a6d98cab518c8c0e'
         '825e9199b54a7c73f974de6b79fee470'
         '19f59e008bbe3fdcf39363818d3a5cf1')

build() {
	cd "${_reponame}-${pkgver}"

	fpc gharena
	# Clear object files so we can build the sdl ones.
	rm *.ppu *.o
	fpc -dSDLMODE -ogharena-sdl gharena
	rm *.ppu *.o
}

package() {
	# Install the game itself.
	cd "${_reponame}-${pkgver}"
	install -d "${pkgdir}/opt/${pkgname}"
	cp -ar -t "${pkgdir}/opt/${pkgname}" Image Design GameData Series doc
	install -Dm755 gharena "${pkgdir}/opt/${pkgname}"
	install -Dm755 gharena-sdl "${pkgdir}/opt/${pkgname}"

	# Install the command line and desktop runners.
	cd "${srcdir}"
	install -Dm755 ${pkgname}.sh "${pkgdir}/usr/bin/${pkgname}"
	ln -s ${pkgname} "${pkgdir}/usr/bin/${pkgname}-sdl"
	# The .desktop file was adapted from Debian's gearhead package.
	install -Dm644 ${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -Dm644 ${pkgname}.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

	# Install the documentation
	install -d "${pkgdir}/usr/share/doc/${pkgname}"
	ln -s "/opt/${pkgname}/doc/man_chara.txt" "${pkgdir}/usr/share/doc/${pkgname}/man_chara.txt"
	ln -s "/opt/${pkgname}/doc/man_mecha.txt" "${pkgdir}/usr/share/doc/${pkgname}/man_mecha.txt"
	ln -s "/opt/${pkgname}/doc/man_umek.txt" "${pkgdir}/usr/share/doc/${pkgname}/man_umek.txt"
}
