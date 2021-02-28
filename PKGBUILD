# Maintainer: Arvedui <arvedui@posteo.de>
# Contributor: Jakub Kądziołka <kuba@kadziolka.net>

pkgname=sameboy
pkgdesc="An accuracy-focused Game Boy/Game Boy Color emulator"
pkgver=0.14
pkgrel=2
arch=(x86_64)
url="https://github.com/LIJI32/SameBoy"
license=(MIT)
depends=(sdl2 hicolor-icon-theme)
conflicts=(sameboy-git)
# Upstream suggests using clang, but gcc is supported on Linux: https://github.com/LIJI32/SameBoy/issues/164#issuecomment-486464194
makedepends=(rgbds make git xdg-utils)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/LIJI32/SameBoy/archive/v${pkgver}.tar.gz"
	"sameboy-0a4cb814-fix-destdir.patch::https://github.com/LIJI32/SameBoy/commit/0a4cb8148f6bcecd20486a6563a43eb9c074500c.patch")
md5sums=('c98eb4bd5a645ade48cd0dba1f496bd5'
         'dab79f4afa38cabf94a46634eb3e2d66')

prepare() {
	cd "${srcdir}/SameBoy-${pkgver}"
	patch -p1 < "${srcdir}/sameboy-0a4cb814-fix-destdir.patch"
}

build(){
	cd "${srcdir}/SameBoy-${pkgver}"
	make sdl CONF=release DATA_DIR=/usr/share/games/sameboy/ CC=gcc
}

package(){
	cd "${srcdir}/SameBoy-${pkgver}"

	make install CONF=release PREFIX=/usr/ DESTDIR="${pkgdir}"
	install -D "${pkgdir}/usr/share/sameboy/LICENSE" "${pkgdir}/usr/share/licenses/sameboy/LICENSE"
	rm "${pkgdir}/usr/share/sameboy/LICENSE"
	install -Dm644 FreeDesktop/sameboy.desktop "${pkgdir}/usr/share/applications/sameboy.desktop"

	# mimetype icons don't belong here
	# that could lead to file conflicts
	find "${pkgdir}" -name 'x-gameboy*-rom.png' -delete
	find "${pkgdir}" -name mimetypes -delete

}
