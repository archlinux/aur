# Maintainer: nl6720 <nl6720@archlinux.org>

pkgname=lightdm-kde-greeter
pkgver=6.1.2
pkgrel=1
pkgdesc='LightDM Greeter for KDE'
arch=(x86_64)
url='https://invent.kde.org/plasma/lightdm-kde-greeter'
license=('GPL-3.0-or-later')
depends=(lightdm kdeclarative qt6-5compat kiconthemes kcmutils kpackage kconfig kconfigwidgets networkmanager-qt kcoreaddons ki18n kauth kservice libplasma)
makedepends=(git cmake extra-cmake-modules qt6-tools gtk2-compat)
source=("git+https://invent.kde.org/plasma/lightdm-kde-greeter.git#tag=v${pkgver}")
sha512sums=('5fa4cde1ea02d364d9ad682c4b71a3231f92d88b30d5d83bcece8c86c746ad4676ab764ec81a6c32a0e14924292ec4580cefd91b1aaa99908225c9380369d36e')
backup=('etc/lightdm/lightdm-kde-greeter.conf')

prepare() {
	install -d build
	sed 's/sbin/bin/' -i "${pkgname}/greeter/CMakeLists.txt"
}

build() {
	cmake -B build -S "${pkgname}" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DLIBEXEC_INSTALL_DIR="/usr/lib/${pkgname}" \
		-DDATA_INSTALL_DIR="/usr/share" \
		-DGREETER_IMAGES_DIR="/var/lib/${pkgname}/images" \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
