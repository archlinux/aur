# Maintainer: Jesse Spangenberger <azulephoenix@gmail.com>

pkgname=notepadqq-git
_pkgname=notepadqq
pkgver=0.50.1.r5.g9362601
pkgrel=2
pkgdesc="A Linux clone of Notepad++"
arch=('i686' 'x86_64')
url="http://notepadqq.altervista.org/wp/"
license=('GPL3')
depends=('qt5-webkit>5.2' 'hicolor-icon-theme' 'desktop-file-utils')
makedepends=('git' 'qt5-svg>5.2')
provides=('notepadqq')
conflicts=('notepadqq-bin' 'notepadqq' 'notepadqq-common')
install=${_pkgname}.install
sha1sums=('SKIP')
options=('!emptydirs')

source=(git+https://github.com/notepadqq/notepadqq.git)

pkgver() {
	cd "${srcdir}/${_pkgname}"
	set -o pipefail
	git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_pkgname}"
	
	 ./configure --prefix "${pkgdir}/usr"
	 make
	
}

package() {
	cd "${srcdir}/${_pkgname}/src/ui"
	make DESTDIR="${pkgdir}/usr" install
	
	install -Dm644 "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg" "${pkgdir}/usr/share/pixmaps/${_pkgname}.svg"
}
