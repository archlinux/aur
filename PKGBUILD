# Maintainer: xx777 <zenmchen at gmail dot com>
# Contributor: PRESFIL <echo cHJlc2ZpbEBwcm90b25tYWlsLmNvbQo= | base64 -d>
# Contributor: librewish <librewish@gmail.com
# Contributor: Bjoern Franke <bjo+aur@schafweide.org>
# Contributor: feanor1397 <feanor1397@gmail.com>

_pkgbase=rtw88
pkgname=rtw88-dkms-git
pkgver=r473.610e04f
pkgrel=1
pkgdesc='Driver for Realtek 802.11ac wireless chips'
license=('GPL2' 'custom')
arch=('any')
url='https://github.com/lwfinger/rtw88'
depends=('dkms' 'linux-firmware')
makedepends=('git')
optdepends=('usb_modeswitch: A tool which can switch the adapter from CD-ROM mode to wifi mode ')
source=("git+https://github.com/lwfinger/rtw88.git"
	"blacklist-rtw88.conf"
	"dkms.conf"
	"0001-Add-support-for-kernel-6.11.patch")
sha256sums=('SKIP'
	    'f814ee492e75de83d348e515002f23863840baaae6339c374d677f7d05a3b2fe'
	    '74b52b0b0f07f2e95fd0068e3e92537768d32c9a236000cde2b7fabe27b346fd'
	    'a37979ba10aca75081517dae2c0fe74dde607be1b17869468791575c2b0a9920')

prepare() {
	cd "${srcdir}"/${_pkgbase}
	rm -f convert_firmware.*
	patch -p1 -i ../0001-Add-support-for-kernel-6.11.patch
}

pkgver() {
	cd "${srcdir}"/${_pkgbase}
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
	cd "${srcdir}"/${_pkgbase}
	install -Dm 644 -t "${pkgdir}"/usr/lib/firmware/rtw88 firmware/rtw8812a_fw.bin
	install -Dm 644 -t "${pkgdir}"/usr/src/${_pkgbase}-${pkgver} *.c *.h Makefile
	install -Dm 644 -t "${pkgdir}"/usr/src/${_pkgbase}-${pkgver} "${srcdir}"/dkms.conf
	install -Dm 644 -t "${pkgdir}"/etc/modprobe.d "${srcdir}"/blacklist-rtw88.conf
 	sed -e "s/@PKGVER@/${pkgver}/" -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
}
