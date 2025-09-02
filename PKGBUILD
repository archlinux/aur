# Maintainer: xx777 <zenmchen at gmail dot com>
# Contributor: PRESFIL <echo cHJlc2ZpbEBwcm90b25tYWlsLmNvbQo= | base64 -d>
# Contributor: librewish <librewish@gmail.com
# Contributor: Bjoern Franke <bjo+aur@schafweide.org>
# Contributor: feanor1397 <feanor1397@gmail.com>

_pkgbase=rtw88
pkgname=rtw88-dkms-git
pkgver=r675.52072d8
pkgrel=1
pkgdesc='Drivers for Realtek 802.11n/802.11ac wireless chips'
license=('GPL2')
arch=('any')
url='https://github.com/lwfinger/rtw88'
depends=('dkms' 'linux-firmware-realtek')
makedepends=('git')
optdepends=('usb_modeswitch: A tool that can switch the adapter from CD-ROM mode to Wi-Fi mode')
source=("git+https://github.com/lwfinger/rtw88.git")
sha256sums=('SKIP')

prepare() {
	cd "${srcdir}"/${_pkgbase}
	rm -f convert_firmware.*
	sed -e "/POST_INSTALL/d" -e "/PACKAGE_VERSION/d" -i dkms.conf
	printf "PACKAGE_VERSION=\"@PKGVER@\"\n" >> dkms.conf
}

pkgver() {
	cd "${srcdir}"/${_pkgbase}
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
	cd "${srcdir}"/${_pkgbase}
	install -Dm 644 -t "${pkgdir}"/usr/src/${_pkgbase}-${pkgver} *.c *.h Makefile dkms.conf
	install -Dm 644 -t "${pkgdir}"/etc/modprobe.d rtw88.conf
 	sed -e "s/@PKGVER@/${pkgver}/" -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
}
