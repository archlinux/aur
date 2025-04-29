# Maintainer: djsigmann <djsigmann@protonmail.com>
# Contributer: Matthew Shaw <mtthwjhnshw at gmail dot com>

_pkgname=nifskope
pkgname=${_pkgname}-git
pkgver=1.1.3.864.g30954e7f
pkgrel=3
pkgdesc="Utility for opening and editing the NetImmerse (NIF) file format."
arch=('i686' 'x86_64')
url="http://niftools.org"
license=('custom')
depends=('qt5-base')
makedepends=('git' 'gendesk')
source=(
	'git+https://github.com/niftools/nifskope.git'
	'git+https://github.com/niftools/nifdocsys.git'
	'git+https://github.com/qhull/qhull.git'
	'git+https://github.com/madler/zlib.git'
	"${_pkgname}.png::https://www.niftools.org/assets/images/NifTools-Logo-128.png"
)
md5sums=(
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'53e5203a116423d3436401395fa12a35'
)

prepare() {
	gendesk -f --pkgname "${_pkgname}" --pkgdesc "${pkgdesc}" --exec NifSkope # generate desktop entry

	cd "${srcdir}/${_pkgname}"

	git submodule update --init --recursive
	git pull origin pull/147/head

	sed -i -e "\$atarget.path = /usr/bin\nINSTALLS += target" NifSkope.pro
	sed -i '6i#include <unistd.h>' lib/zlib/{gzlib.c,gzread.c,gzwrite.c} # patch zlib to fix compile errors
}

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --always | sed 's|nifskope-\([0-9]\+.[0-9]\+.[0-9]\+\)|\1|' | sed 's|-|.|g'
}

build() {
	cd "${srcdir}/${_pkgname}"
	qmake-qt5 *.pro
	make
}

package() {
	install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
	install -Dm644 "${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"

	cd "${srcdir}/${_pkgname}"
	make INSTALL_ROOT="${pkgdir}/" install

	install -Dm755 "${srcdir}/${_pkgname}/build/docsys/nifxml/nif.xml" "${pkgdir}/usr/share/${_pkgname}/nif.xml"
	install -Dm755 "${srcdir}/${_pkgname}/build/docsys/kfmxml/kfm.xml" "${pkgdir}/usr/share/${_pkgname}/kfm.xml"

	install -Dm755 "${srcdir}/${_pkgname}/release/LICENSE.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

}
