# Maintainer: Jakub Kądziołka <kuba@kadziolka.net>
# Maintainer: basxto <archlinux basxto de>

pkgname=sameboy-git
pkgdesc="An accuracy-focused Game Boy/Game Boy Color emulator"
pkgver=1468.c6ea5720
pkgrel=1
arch=(x86_64)
url="https://github.com/LIJI32/SameBoy"
license=(MIT)
provides=(sameboy)
depends=(sdl2 hicolor-icon-theme)
# Upstream suggests using clang, but gcc is supported on Linux: https://github.com/LIJI32/SameBoy/issues/164#issuecomment-486464194
makedepends=(rgbds make git)
source=(git+https://github.com/LIJI32/SameBoy)
sha1sums=('SKIP')

prepare(){
	sed -i 's/-Werror//' SameBoy/Makefile
}

pkgver(){
	cd SameBoy
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build(){
	make -C SameBoy sdl CONF=release PREFIX=/usr/
}

package(){
	cd SameBoy
	# make install missed creation of this folder *shrugs
	install -d "${pkgdir}"/usr/share/applications/
	make install CONF=release PREFIX=/usr/ DESTDIR="${pkgdir}"
	# mimetype icons don't belong here
	# that could lead to file conflicts
	find "${pkgdir}" -name 'x-gameboy*-rom.png' -delete
	find "${pkgdir}" -name mimetypes -delete
	# move license to the correct path for arch
	install -d "${pkgdir}"/usr/share/licenses/${pkgname}/
	mv "${pkgdir}"/usr/share/${provides[0]}/LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/
}
