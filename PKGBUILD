# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>

_pkgname=freecalypso-tools
pkgname="${_pkgname}-hg"
pkgver=r963.b515a97e5dff
pkgrel=1
pkgdesc="FreeCalypso host tools package"
arch=('x86_64' 'i686')
url="https://www.freecalypso.org/hg/${_pkgname}"
license=('custom')
groups=('freecalypso')
depends=()
makedepends=('mercurial')
source=("hg+https://www.freecalypso.org/hg/${_pkgname}"
	"ringtools_imy_fix_tdma_durations.diff")
md5sums=('SKIP'
	 'b5080911de58727d42d6c7969f2c1cac')

pkgver() {
	cd "${_pkgname}"
	printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

prepare() {
	cd "${_pkgname}"
	hg import --no-commit "${srcdir}/ringtools_imy_fix_tdma_durations.diff"
}

build() {
	cd "${_pkgname}"
	make
}

package() {
	cd "${_pkgname}"

	install -d "${pkgdir}/opt"
	install -d "${pkgdir}/usr/share/doc/${_pkgname}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

	# DESTDIR is not respected, '/opt/freecalypso' is hard-coded.
	# The project's author is strongly against using any other directory.
	make install
	cp -r /opt/freecalypso "${pkgdir}/opt/"
	cp -r doc/* "${pkgdir}/usr/share/doc/${_pkgname}/"
}
