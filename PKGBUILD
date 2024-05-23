# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>

pkgname=freecalypso-tools
pkgver=r21
pkgrel=3
pkgdesc="FreeCalypso host tools package"
arch=('x86_64' 'i686')
url="https://www.freecalypso.org/hg/${pkgname}"
license=('custom')
groups=('freecalypso')
conflicts=("${pkgname}-hg")
_tarname=fc-host-tools-${pkgver}
source=("https://www.freecalypso.org/pub/GSM/FreeCalypso/${_tarname}.tar.bz2"
	'rvinterf_werrorformat_security.patch')
sha256sums=('e038b3bdd30f60e7e1cf08837f29a0865463d4a80e5bec47054795fbac446862'
            '7d0141203308108b0e17727171fa3e2a1e8f309aeb083c2012c2bde75c85414b')

prepare() {
	cd "${_tarname}"
	patch -p1 < "${srcdir}/rvinterf_werrorformat_security.patch"
}

build() {
	cd "${_tarname}"
	make CFLAGS="-std=gnu89 ${CFLAGS}"
}

package() {
	cd "${_tarname}"

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -d "${pkgdir}/usr/share/doc/${pkgname}"
	cp -r doc/* "${pkgdir}/usr/share/doc/${pkgname}/"

	# DESTDIR is not respected, use INSTALL_PREFIX instead
	make INSTALL_PREFIX="${pkgdir}/opt/freecalypso/" install
}
