# Maintainer: xx777 <zenmchen at gmail dot com>
# Contributor: PRESFIL <echo cHJlc2ZpbEBwcm90b25tYWlsLmNvbQo= | base64 -d>
# Contributor: librewish <librewish@gmail.com
# Contributor: Bjoern Franke <bjo+aur@schafweide.org>
# Contributor: feanor1397 <feanor1397@gmail.com>

_pkgbase=rtw88
pkgname=rtw88-dkms-git
pkgver=r575.0ea6212
pkgrel=1
pkgdesc='Driver for Realtek 802.11ac wireless chips'
license=('GPL2' 'custom')
arch=('any')
url='https://github.com/lwfinger/rtw88'
depends=('dkms' 'linux-firmware')
makedepends=('git')
optdepends=('usb_modeswitch: A tool which can switch the adapter from CD-ROM mode to wifi mode ')
source=("git+https://github.com/lwfinger/rtw88.git"
	"dkms.conf")
sha256sums=('SKIP'
	    '13f988924e0d132da5f8de5c355018142c8cd7af4e70076e9681c42d2a1048ce')

prepare() {
	cd "${srcdir}"/${_pkgbase}
	rm -f convert_firmware.*
}

pkgver() {
	cd "${srcdir}"/${_pkgbase}
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
	cd "${srcdir}"/${_pkgbase}
	install -Dm 644 -t "${pkgdir}"/usr/lib/firmware/rtw88 firmware/rtw8814a_fw.bin
	install -Dm 644 -t "${pkgdir}"/usr/src/${_pkgbase}-${pkgver} *.c *.h Makefile
	install -Dm 644 -t "${pkgdir}"/usr/src/${_pkgbase}-${pkgver} "${srcdir}"/dkms.conf
	install -Dm 644 -t "${pkgdir}"/etc/modprobe.d blacklist-rtw88.conf
 	sed -e "s/@PKGVER@/${pkgver}/" -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
}
