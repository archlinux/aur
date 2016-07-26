# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>

_pkgbase=mt7610u_sta
pkgname=mt7610u_sta-dkms-git
pkgver=r25.5f01636
pkgrel=1
# To get an overview of witch WiFi dongle has this chipset refer to https://wikidevi.com/wiki/MediaTek_MT7610U
pkgdesc="Kernel module for MediaTek MT7610U WiFi chipset featured in TP-Link Archer T2U and T2UH, TP-Link TL-WDN5200, ASUS USB-AC50, ASUS USB-AC51, Comcast Xfinity KXW02AAA, D-Link DWA-171 rev B1 and more"
arch=('any')
license=('GPL2')
url="https://github.com/xSmallDeadGuyx/mt7610u_wifi_sta_v3002_dpo_20130916.git"
depends=('dkms')
makedepends=('git')
provides=("mt7610u_sta=${pkgver}" "mt7610u_wifi_sta=${pkgver}")
conflicts=("mt7610u_sta" "mt7610u_wifi_sta")
install="${_pkgbase}.install"
source=("${_pkgbase}"::"git+https://github.com/xSmallDeadGuyx/mt7610u_wifi_sta_v3002_dpo_20130916.git"
	"dkms.conf")
md5sums=('SKIP'
         '189127dcff1db3d42bc6f4d1cea17974')

pkgver() {
	cd "${srcdir}/${_pkgbase}"
	( set -o pipefail
	git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
	|| printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

package() {
	cd "${srcdir}/${_pkgbase}"

	# Install .dat file for wireless module
	install -Dm644 ./RT2870STA.dat "${pkgdir}/etc/Wireless/RT2870STA/RT2870STA.dat"

	# Copy dkms.conf
	install -Dm644 ../dkms.conf "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"

	# Set an appropiate name and version for the dkms configuration file which will build the module
	sed -e "s/@_PKGBASE@/${_pkgbase}/" \
		-e "s/@PKGVER@/${pkgver}/" \
		-i "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"

	# Copy sources (including Makefile)
	cp -dpr --no-preserve=ownership ./* "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/"
}
