# Maintainer: xx777 <zenmchen at gmail dot com>
# Contributor: Jerry Xiao <aur at mail.jerryxiao.cc>

_pkgbase=rtw89
pkgname=rtw89-dkms-git
pkgver=r1094.67a66dd
pkgrel=1
pkgdesc="Driver for Realtek 802.11ax wireless chips"
arch=('any')
url="https://github.com/lwfinger/rtw89"
license=('GPL2')
makedepends=('git' 'linux-firmware')
depends=('dkms')
source=("git+https://github.com/a5a5aa555oo/rtw89.git")
sha256sums=('SKIP')

prepare() {
	cd "${srcdir}"/${_pkgbase}
	sed -e "/POST_INSTALL/d" -e "/PACKAGE_VERSION/d" -i dkms.conf
	printf "PACKAGE_VERSION=\"@PKGVER@\"\n" >> dkms.conf
}

pkgver() {
	cd "${srcdir}"/${_pkgbase}
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${srcdir}"/${_pkgbase}
	install -Dm 644 -t "${pkgdir}"/usr/src/${_pkgbase}-${pkgver} *.c *.h Makefile dkms.conf
	install -Dm 644 -t "${pkgdir}"/etc/modprobe.d blacklist-rtw89.conf
 	sed -e "s/@PKGVER@/${pkgver}/" -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
}
