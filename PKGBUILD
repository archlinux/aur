# Maintainer: nl6720 <nl6720@archlinux.org>

pkgname=lightdm-kde-greeter
pkgver=6.1.8
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
sha512sums=('67500aae2a5bc297f59d9a47a1d3425087f04a0f9ae77f1fb62e27bebf6395df31801c4c0dd3d7b5726aff9faa8a99fe5bdf7216a5e118dd0fd7274cc0af1d91')
backup=('etc/lightdm/lightdm-kde-greeter.conf')

prepare() {
	install -d build
	sed 's/sbin/bin/' -i "${pkgname}/greeter/"{CMakeLists.txt,lightdm-kde-greeter.desktop}
	sed 's/_ldm/lightdm/' -i "${pkgname}/kcm/helper.cpp"
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

	install -d "${pkgdir}/usr/lib/tmpfiles.d/"
	printf 'd /var/lib/lightdm-kde-greeter 0750 lightdm lightdm -\n' > "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}
