# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>

pkgname=freecalypso-tools
pkgver=r19
pkgrel=1
pkgdesc="FreeCalypso host tools package"
arch=('x86_64' 'i686')
url="https://www.freecalypso.org/hg/${pkgname}"
license=('custom')
groups=('freecalypso')
conflicts=("${pkgname}-hg")
_tarname=fc-host-tools-${pkgver}
source=("https://www.freecalypso.org/pub/GSM/FreeCalypso/${_tarname}.tar.bz2"
	'ringtools_imy_fix_tdma_durations.diff')
sha256sums=('a095b309498f30a0bf018692792c84800c2f025ac583afc63a42945186e694fe'
	    '312e2b2c0720c076d3f0a43c12d29013645609303fa079da269c2784f743ea90')

prepare() {
	cd "${_tarname}"
	# https://www.freecalypso.org/hg/freecalypso-tools/rev/a96cb97b66a2
	patch -p1 < "${srcdir}/ringtools_imy_fix_tdma_durations.diff"
}

build() {
	cd "${_tarname}"
	make
}

package() {
	cd "${_tarname}"

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -d "${pkgdir}/usr/share/doc/${pkgname}"
	cp -r doc/* "${pkgdir}/usr/share/doc/${pkgname}/"

	# DESTDIR is not respected, use INSTALL_PREFIX instead
	make INSTALL_PREFIX="${pkgdir}/opt/freecalypso/" install
}
