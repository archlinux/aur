# Maintainer: Arvedui <arvedui@posteo.de>
# Contributor: Jakub Kądziołka <kuba@kadziolka.net>

pkgname=sameboy
pkgdesc="An accuracy-focused Game Boy/Game Boy Color emulator"
pkgver=0.14.1
pkgrel=1
arch=(x86_64)
url="https://github.com/LIJI32/SameBoy"
license=(MIT)
depends=(sdl2 hicolor-icon-theme)
conflicts=(sameboy-git)
# Upstream suggests using clang, but gcc is supported on Linux: https://github.com/LIJI32/SameBoy/issues/164#issuecomment-486464194
makedepends=(rgbds make git)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/LIJI32/SameBoy/archive/v${pkgver}.tar.gz"
	"sameboy-d2ed1343-add-missing-mkdir.patch::https://github.com/LIJI32/SameBoy/commit/d2ed1343e5ef890f3ec9377941af25453cfe46b5.patch")
md5sums=('6b61ba6b6b688a0ae2badee00ed45f70'
         'c71062c0994e1966ca86ab8178f405bd')

prepare() {
	cd "${srcdir}/SameBoy-${pkgver}"
	patch -p1 < "${srcdir}/sameboy-d2ed1343-add-missing-mkdir.patch"
}

build(){
	cd "${srcdir}/SameBoy-${pkgver}"
	make sdl CONF=release DATA_DIR=/usr/share/games/sameboy/ CC=gcc FREEDESKTOP=true
}

package(){
	cd "${srcdir}/SameBoy-${pkgver}"

	make install CONF=release PREFIX=/usr/ DATA_DIR=/usr/share/games/sameboy/ DESTDIR="${pkgdir}" FREEDESKTOP=true
	install -D "${pkgdir}/usr/share/sameboy/LICENSE" "${pkgdir}/usr/share/licenses/sameboy/LICENSE"
	rm "${pkgdir}/usr/share/sameboy/LICENSE"

	# mimetype icons don't belong here
	# that could lead to file conflicts
	find "${pkgdir}" -name 'x-gameboy*-rom.png' -delete
	find "${pkgdir}" -name mimetypes -delete

}
