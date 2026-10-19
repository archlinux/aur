# Maintainer: nl6720 <nl6720@archlinux.org>

pkgname=lightdm-kde-greeter
pkgver=6.1.7
pkgrel=1
pkgdesc='LightDM Greeter for KDE'
arch=(x86_64)
url='https://invent.kde.org/plasma/lightdm-kde-greeter'
license=('GPL-3.0-or-later')
depends=(lightdm kdeclarative qt6-5compat kiconthemes kcmutils kpackage kconfig kconfigwidgets networkmanager-qt kcoreaddons ki18n kauth kservice libei libplasma)
makedepends=(git cmake extra-cmake-modules qt6-tools gtk2-compat vulkan-headers)
optdepends=('orca: screen reader support'
            'xorg-server: for lightdm-kde-greeter-x11')
source=("git+https://invent.kde.org/plasma/lightdm-kde-greeter.git#tag=v${pkgver}")
sha512sums=('a24a83eff17d83c0288c33a51a8c5c06e072db42015f9458fbbbddbed2ccda7fceae64975ae71a801ca3c06008237e6fa0809a9a736175550941d852d4581258')
backup=('etc/lightdm/lightdm-kde-greeter.conf')

prepare() {
	install -d build
	sed 's/sbin/bin/' -i "${pkgname}/greeter/CMakeLists.txt"
}

build() {
	cmake -B build -S "${pkgname}" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DKDE_INSTALL_LIBEXECDIR="lib/${pkgname}" \
		-DGREETER_IMAGES_DIR="/var/lib/${pkgname}/images" \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
