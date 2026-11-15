# Maintainer: Arvedui <arvedui@posteo.de>
# Contributor: Jakub Kądziołka <kuba@kadziolka.net>

pkgname=sameboy
pkgdesc="An accuracy-focused Game Boy/Game Boy Color emulator"
pkgver=1.0.5
pkgrel=1
arch=(x86_64)
url="https://github.com/LIJI32/SameBoy"
license=(MIT)
depends=(sdl2 hicolor-icon-theme gdk-pixbuf2)
conflicts=(sameboy-git)
# Upstream suggests using clang, but gcc is supported on Linux: https://github.com/LIJI32/SameBoy/issues/164#issuecomment-486464194
makedepends=(rgbds make)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/LIJI32/SameBoy/archive/v${pkgver}.tar.gz")
b2sums=('8d378d55757dac71e9f5bd55c500adaf16b4dcc0592319a4f180f925760bc6cde48087743b640db2f0f2d4d33acdbc29359ace9439ecd8bbf09649faeff4211a')

build(){
	cd "${srcdir}/SameBoy-${pkgver}"
	make sdl xdg-thumbnailer CONF=release DATA_DIR=/usr/share/games/sameboy/ CC=gcc FREEDESKTOP=true
}

package(){
	cd "${srcdir}/SameBoy-${pkgver}"

	make install CONF=release PREFIX=/usr/ DATA_DIR=/usr/share/games/sameboy/ DESTDIR="${pkgdir}" FREEDESKTOP=true
	install -D "${pkgdir}/usr/share/games/sameboy/LICENSE" "${pkgdir}/usr/share/licenses/sameboy/LICENSE"

	# mimetype icons don't belong here
	# that could lead to file conflicts
	find "${pkgdir}" -name 'x-gameboy*-rom.png' -delete
	find "${pkgdir}" -name mimetypes -delete

}
