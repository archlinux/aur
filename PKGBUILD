# Maintainer: xx777 <zenmchen at gmail dot com>
# Contributor: Jerry Xiao <aur at mail.jerryxiao.cc>

_pkgbase=rtw89
pkgname=rtw89-dkms-git
pkgver=r1766.f93ba28
pkgrel=1
pkgdesc="Drivers for Realtek Wi-Fi 6/6E and Wi-Fi 7 adapters"
arch=('any')
url="https://github.com/morrownr/rtw89"
license=('GPL2')
makedepends=('git' 'linux-firmware-realtek')
depends=('dkms')
optdepends=('usb_modeswitch: A tool that switches the USB adapter from DriverCD mode to Wi-Fi mode')
source=("git+https://github.com/morrownr/rtw89.git")
sha256sums=('SKIP')

prepare() {
	cd "${srcdir}"/${_pkgbase}
	sed -i "s/\" __stringify(GIT_COMMIT) \"/$(git rev-parse HEAD)/g" core.c
	sed -i "s/PACKAGE_VERSION=.*/PACKAGE_VERSION=\"@PKGVER@\"/g" dkms.conf
}

pkgver() {
	cd "${srcdir}"/${_pkgbase}
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${srcdir}"/${_pkgbase}
	install -Dm 644 -t "${pkgdir}"/usr/src/${_pkgbase}-${pkgver} *.c *.h Makefile dkms.conf
	install -Dm 644 -t "${pkgdir}"/etc/modprobe.d rtw89.conf
 	sed -e "s/@PKGVER@/${pkgver}/" -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
}
