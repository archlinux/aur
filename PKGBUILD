# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>

_hgname=gsm-codec-lib
_pkgname=freecalypso-gsm-codec-lib
pkgname="${_pkgname}-hg"
pkgver=r251.946849291027
pkgrel=2
pkgdesc="FreeCalypso GSM codec libraries and utilities"
arch=('x86_64' 'i686')
url="https://www.freecalypso.org/hg/${_hgname}"
license=('custom')
groups=('freecalypso')
depends=('gsm')
makedepends=('mercurial')
source=("hg+https://www.freecalypso.org/hg/${_hgname}")
md5sums=('SKIP')

pkgver() {
	cd "${_hgname}"
	printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

prepare() {
	cd "${_hgname}"
	files=$(hg grep -l "#include <gsm.h>")
	sed -i "s#include <gsm.h>#include <gsm/gsm.h>#" $files
}

build() {
	cd "${_hgname}"
	make
}

package() {
	cd "${_hgname}"

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	install -d "${pkgdir}/usr/share/doc/${_pkgname}"
	cp -r doc/* "${pkgdir}/usr/share/doc/${_pkgname}/"

	# DESTDIR is not respected, use INSTALL_PREFIX and INSTBIN instead
	make INSTALL_PREFIX="${pkgdir}/usr" install-lib
	make INSTBIN="${pkgdir}/opt/freecalypso/bin" install-utils

	# For the sake of consistency with the 'gsm' package, move all header files
	# to '/usr/include/gsm'.  This problem was discussed here:
	# https://www.freecalypso.org/pipermail/community/2023-September/000892.html
	# https://www.freecalypso.org/pipermail/community/2023-September/000895.html
	install -d "${pkgdir}/usr/include/gsm"
	mv ${pkgdir}/usr/include/*.h "${pkgdir}/usr/include/gsm/"
}
