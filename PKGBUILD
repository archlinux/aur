# Contributor Alper Kanat <alperkanat@raptiye.org>
# Contributor Jaeic Lee <zeraxeal@gmail.com>
# Contributor Zhang Li <richselian@gmail.com>
# Based on rt2860 package from Marius Dransfeld <marius.dransfeld@gmail.com>
# Maintainer: Manuel Olguin <molguin@dcc.uchile.cl>

pkgname="rt3290sta-dkms"
pkgver="2.6.0.0"
pkgrel=5
pkgdesc="Drivers for rt3290 chipset wireless cards"
arch=("i686" "x86_64")
url="http://www.ralinktech.com/"
license=('GPL')
depends=("dkms")
makedepends=("make" "linux-headers")
replaces=("rt3290sta")
conflicts=("rt2860" "rt3090" "rt3290sta")
install="rt3290sta.install"

source=(
	"https://launchpad.net/~barracuda72/+archive/ralink/+files/rt3290-dkms_2.6.0.0rev1-0ubuntu1~ppa1.tar.gz"
	"rt3290sta_fix_64bit_3.8.patch"
	"kernel_version_fix.patch"
	"3.14fix.patch"
	"sta_fix.patch"
)
md5sums=(
	"edb2c4c636f899ee4b096e3eea41a4e4"
	"3731311126f4baa55aea33cdad8dd999"
	"4c465506484a5d6f63300f6651c6767b"
	"251b1aa059722f341effcd81f89312f8"
	"8713205e497903abf47cc032fa90ae88"
)

build() {
	cd ${srcdir}
	tar zxvf rt3290-dkms_2.6.0.0rev1-0ubuntu1~ppa1.tar.gz
	cd ${srcdir}/rt3290-2.6.0.0rev1/
	patch -p1 -i ${srcdir}/rt3290sta_fix_64bit_3.8.patch
	patch -p1 -i ${srcdir}/kernel_version_fix.patch --binary
	patch -p1 -i ${srcdir}/3.14fix.patch
	patch -p1 -i ${srcdir}/sta_fix.patch
}

package() {
	cd ${srcdir}/rt3290-2.6.0.0rev1/
	mkdir -pv ${pkgdir}/usr/src/rt3290-2.6.0.0rev1/
	mkdir -pv ${pkgdir}/etc/Wireless/RT2860STA/
	mkdir -pv ${pkgdir}/etc/modprobe.d/
	cp -Rv chips common include os rate_ctrl sta tools ${pkgdir}/usr/src/rt3290-2.6.0.0rev1/
	chown -R 0:0 ${pkgdir}/usr/src/rt3290-2.6.0.0rev1/
	chmod -R 0644 ${pkgdir}/usr/src/rt3290-2.6.0.0rev1/
	install -m 0644 -o root -g root Makefile ${pkgdir}/usr/src/rt3290-2.6.0.0rev1/
	install -m 0644 -o root -g root debian/dkms.conf ${pkgdir}/usr/src/rt3290-2.6.0.0rev1/
	install -m 0755 -o root -g root RT2860STA.dat ${pkgdir}/etc/Wireless/RT2860STA/
	install -m 0644 -o root -g root blacklist-ralink.conf ${pkgdir}/etc/modprobe.d/
}


