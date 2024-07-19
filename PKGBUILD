# Maintainer: xx777 <zenmchen at gmail dot com>
# Contributor: PRESFIL <echo cHJlc2ZpbEBwcm90b25tYWlsLmNvbQo= | base64 -d>
# Contributor: librewish <librewish@gmail.com
# Contributor: Bjoern Franke <bjo+aur@schafweide.org>
# Contributor: feanor1397 <feanor1397@gmail.com>

_pkgbase=rtw88
pkgname=rtw88-dkms-git
pkgver=r448.016fa04
pkgrel=1
pkgdesc='Driver for Realtek 802.11ac wireless chips'
license=('GPL2' 'custom')
arch=('any')
url='https://github.com/lwfinger/rtw88'
depends=('dkms' 'linux-firmware')
makedepends=('git')
optdepends=('usb_modeswitch: This tool switches the adapter to wifi mode if it is in CD-ROM mode.')
source=("git+https://github.com/lwfinger/rtw88.git"
	"blacklist-rtw88.conf"
	"dkms.conf")
sha256sums=('SKIP'
	    'f814ee492e75de83d348e515002f23863840baaae6339c374d677f7d05a3b2fe'
	    '74b52b0b0f07f2e95fd0068e3e92537768d32c9a236000cde2b7fabe27b346fd')

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
	install -Dm 644 -t "${pkgdir}"/usr/lib/firmware/rtw88 rtw8812a_fw.bin
	install -Dm 644 -t "${pkgdir}"/usr/src/${_pkgbase}-${pkgver} *.c *.h Makefile
	install -Dm 644 -t "${pkgdir}"/usr/src/${_pkgbase}-${pkgver} "${srcdir}"/dkms.conf
	install -Dm 644 -t "${pkgdir}"/etc/modprobe.d "${srcdir}"/blacklist-rtw88.conf
 	sed -e "s/@PKGVER@/${pkgver}/" -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
}
