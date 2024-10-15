# Maintainer: xx777 <zenmchen at gmail dot com>
# Contributor: PRESFIL <echo cHJlc2ZpbEBwcm90b25tYWlsLmNvbQo= | base64 -d>
# Contributor: librewish <librewish@gmail.com
# Contributor: Bjoern Franke <bjo+aur@schafweide.org>
# Contributor: feanor1397 <feanor1397@gmail.com>

_pkgbase=rtw88
pkgname=rtw88-dkms-git
pkgver=r512.247209b
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
	    'eae601a60acb3e9ca45ba025cbd849b129d62600e35b5973f188b90529ff1802')

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
	install -Dm 644 -t "${pkgdir}"/usr/lib/firmware/rtw88 firmware/rtw8812a_fw.bin
	install -Dm 644 -t "${pkgdir}"/usr/src/${_pkgbase}-${pkgver} *.c *.h Makefile
	install -Dm 644 -t "${pkgdir}"/usr/src/${_pkgbase}-${pkgver} "${srcdir}"/dkms.conf
	install -Dm 644 -t "${pkgdir}"/etc/modprobe.d blacklist-rtw88.conf
 	sed -e "s/@PKGVER@/${pkgver}/" -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
}
