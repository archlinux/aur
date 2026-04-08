# Maintainer: nl6720 <nl6720@archlinux.org>

pkgname=lightdm-kde-greeter
pkgver=6.1.6
pkgrel=1
pkgdesc='LightDM Greeter for KDE'
arch=(x86_64)
url='https://invent.kde.org/plasma/lightdm-kde-greeter'
license=('GPL-3.0-or-later')
depends=(lightdm kdeclarative qt6-5compat kiconthemes kcmutils kpackage kconfig kconfigwidgets networkmanager-qt kcoreaddons ki18n kauth kservice libei libplasma)
makedepends=(git cmake extra-cmake-modules qt6-tools gtk2-compat vulkan-headers)
source=("git+https://invent.kde.org/plasma/lightdm-kde-greeter.git#tag=v${pkgver}")
sha512sums=('b08b58c5d7daaaa4d947e9c4f07a973fa8299ea646cb98178247e2688b0075dbb8e7564e208fda81d6626e752ab0c9216a9c17bfc4f6e0c455523c6ece272c85')
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
