# Maintainer: Jordan Christiansen <xordspar0@gmail.com>

# To do:
# * If upstream adds a way to specify the location of the data files, move the
#   package contents to /usr/bin/ and /usr/share/.

pkgname=gearhead
_reponame=gearhead-1
pkgver=1.310
pkgrel=1
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
sha256sums=('7f0fa83d745d683b802e3f44cea70a66b6d6a46f1b4e2db49c774f176089e627'
            'd1ea4838314a285c44513e744c1a0510fa1bb6ffea36ca72d9c5d83d9e7e86aa'
            '4e63008fccb83ef028d0cca384ba1404731ab5f3a68d3a1a1efcbc0bed2fe143'
            '5e0241bc81e08394c5493448bc6f6d7b4a80280ee47f983b844783a7d907b66f')

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
