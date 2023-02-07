# Maintainer: Jorge Barroso <jorge_barroso_11 at hotmail dot com>
_pkgname=harvesttimer-qt
_appname=harvest
pkgname=harvest-timer-qt
pkgver=1.0.5.1
pkgrel=1
pkgdesc='Desktop app for Harvest, a simple time tracker and reporting tool for companies'
arch=('x86_64')
url='https://github.com/jorge-barroso/harvesttimer-qt'
license=('GPL3')
provides=('harvest-timer')
conflicts=('harvest-timer')
depends=('qt6-base' 'qt6-svg')
makedepends=('cmake' 'qt6-tools')
apptag="v${pkgver}"
install="${pkgname}.install"
source=(
	"https://github.com/jorge-barroso/${_pkgname}/archive/refs/tags/${apptag}.tar.gz"
)
srcdir_name="${_pkgname}-${pkgver}"
sha256sums=('c508a36adb60b696c267f4d3e16b564552a36322a5ce9a2a96afbb076aa632ba')

build() {
	cd "${srcdir}"

	mkdir -p "${srcdir}/build"
	cd "${srcdir}/build"

	cmake "../${srcdir_name}/" -DCMAKE_INSTALL_PREFIX=/usr/bin

	make || return 1
}

package() {
	cd "${srcdir}/build"

	make DESTDIR="$pkgdir/" install || return 1
	
	for _size in 16 24 32 48 64 96 128 256 512; do
		install -Dm644 "../${srcdir_name}/resources/icons/hicolor/${_size}x${_size}.png" "$pkgdir/usr/share/icons/hicolor/${_size}x${_size}/apps/${_appname}.png"
	done

	install -Dm644 "../${srcdir_name}/resources/desktop/${_appname}.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/${_appname}.svg"

	install -Dm755 "../${srcdir_name}/resources/desktop/${_appname}.desktop" "${pkgdir}/usr/share/applications/${_appname}.desktop"
}
