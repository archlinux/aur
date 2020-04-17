# Maintainer: CrankySupertoon <crankysupertoon@gmail.com.com>

pkgname=pegasus-metadata-editor-git
_pkgname=pegasus-metaed
pkgver=continuous.r0.gc7aa199
pkgrel=1
pkgdesc='A graphical metadata editor for Pegasus'
arch=('x86_64')
makedepends=('wget' 'gendesk' 'qt5-base')
depends=('git' 'qt5-tools')
url='https://github.com/mmatyas/pegasus-metadata-editor'
license=('GPL3')
source=("pegasus-metadata-editor-git::git+https://github.com/mmatyas/pegasus-metadata-editor.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}/${pkgname}"
	gendesk -f --pkgname "Pegasus Metadata Editor" --pkgdesc "${pkgdesc}" --exec "/usr/bin/${_pkgname}" -n
}

build() {
	cd "${srcdir}/${pkgname}"
	mkdir build -p
	cd build
	qmake ..
	make	
}

package() {
	cd "${srcdir}/${pkgname}"
	install -Dm644 "Pegasus Metadata Editor.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

	wget https://raw.githubusercontent.com/mmatyas/pegasus-frontend/master/assets/icon.png
	install -Dm644 "icon.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"

	cd "${srcdir}/${pkgname}/build/src/"
	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
