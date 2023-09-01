# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>

_hgname=gsm-codec-lib
pkgname="freecalypso-${_hgname}"
pkgver=r2
pkgrel=1
pkgdesc="FreeCalypso GSM codec libraries and utilities"
arch=('x86_64' 'i686')
url="https://www.freecalypso.org/hg/${_hgname}"
license=('custom')
groups=('freecalypso')
depends=('gsm')
conflicts=("${pkgname}-hg")
_tarname="${_hgname}-${pkgver}"
source=("https://www.freecalypso.org/pub/GSM/codecs/${_tarname}.tar.bz2")
sha256sums=('9e6bd1c3e99aa42b448706562262966371c9e9fb4f910c4f3d1bf662c2085449')

prepare() {
	cd "${_tarname}"
	files=$(grep -Rl "#include <gsm.h>")
	sed -i "s#include <gsm.h>#include <gsm/gsm.h>#" $files
}

build() {
	cd "${_tarname}"
	make
}

package() {
	cd "${_tarname}"

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	install -d "${pkgdir}/usr/share/doc/${_pkgname}"
	cp -r doc/* "${pkgdir}/usr/share/doc/${_pkgname}/"

	# DESTDIR is not respected, use INSTALL_PREFIX and INSTBIN instead
	make INSTALL_PREFIX="${pkgdir}/usr" install-lib
	make INSTBIN="${pkgdir}/opt/freecalypso/bin" install-utils
}
