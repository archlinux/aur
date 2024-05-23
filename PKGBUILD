# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>

_hgname=fc-sim-tools
_pkgname=freecalypso-sim-tools
pkgname="${_pkgname}-hg"
pkgver=r103.3477438b5706
pkgrel=4
pkgdesc="FreeCalypso SIM card tools"
arch=('x86_64' 'i686')
url="https://www.freecalypso.org/hg/${_hgname}"
license=('custom')
groups=('freecalypso')
depends=('pcsclite')
makedepends=('mercurial')
conflicts=("${_pkgname}")
source=("hg+https://www.freecalypso.org/hg/${_hgname}")
md5sums=('SKIP')

pkgver() {
	cd "${_hgname}"
	printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
	cd "${_hgname}"
	make CFLAGS="-std=gnu89 ${CFLAGS}" CFLAGS_PCSC="-std=gnu89 ${CFLAGS} -I/usr/include/PCSC"
}

package() {
	cd "${_hgname}"

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	install -d "${pkgdir}/usr/share/doc/${_pkgname}"
	cp -r doc/* "${pkgdir}/usr/share/doc/${_pkgname}/"

	# DESTDIR is not respected, use INSTALL_PREFIX instead
	make INSTALL_PREFIX="${pkgdir}/opt/freecalypso/" install
}
