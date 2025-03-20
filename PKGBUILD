# Maintainer: nl6720 <nl6720@archlinux.org>

pkgname=lightdm-kde-greeter
pkgver=6.0.2
pkgrel=1
pkgdesc='LightDM Greeter for KDE'
arch=(x86_64)
url='https://invent.kde.org/plasma/lightdm-kde-greeter'
license=('GPL-3.0-or-later')
depends=(lightdm kdeclarative qt6-5compat kiconthemes kcmutils kpackage kconfig kconfigwidgets networkmanager-qt kcoreaddons ki18n kauth kservice libplasma)
makedepends=(git cmake extra-cmake-modules qt6-tools gtk2-compat)
source=("git+https://invent.kde.org/plasma/lightdm-kde-greeter.git#tag=v${pkgver}")
sha512sums=('b1153b2d19bc224605a33b079c0a3ea45db90eb40fee7bbe2c80104ecd538f3b15ec60f2b59dfe7c2755d10fac32e0a4eb1d6146ccb67a0c2fb23256ad06dddf')
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
