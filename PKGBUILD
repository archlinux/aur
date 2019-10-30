# Maintainer: Tomasz Maciej Nowak <com[dot]gmail[at]tmn505>

# All my PKGBUILDs are managed at https://github.com/tmn505/AUR

pkgbase=mt76-git
pkgname=('mt76-dkms-git' 'mt76-firmware-git')
pkgver=r1619.gf2be00b
pkgrel=1
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/openwrt/mt76'
license=('GPL2')
makedepends=('git')
source=("git+${url}.git"
        'dkms.conf')
sha256sums=('SKIP'
            '084b5d5127dd3569c417c1574af40fffdccf2e74d8ef93f1615d27ed492a7146')

pkgver() {
	cd ${srcdir}/mt76
	printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package_mt76-dkms-git() {
	pkgdesc='mac80211 driver for MediaTek MT76x2e, MT7603, MT7628 and MT7688'
	provides=('mt76-dkms')
	depends=('dkms' 'mt76-firmware-git')

	install -dm755 ${pkgdir}/usr/src/mt76-${pkgver}/
	cp -R ${srcdir}/mt76/* ${pkgdir}/usr/src/mt76-${pkgver}/
	rm -fR ${pkgdir}/usr/src/mt76-${pkgver}/firmware
	sed --follow-symlinks -e "s/@PKGVER@/${pkgver}/" ${srcdir}/dkms.conf > ${pkgdir}/usr/src/mt76-${pkgver}/dkms.conf
}

package_mt76-firmware-git() {
	pkgdesc='Firmware for MediaTek MT76x2e, MT7603, MT7628 and MT7688'
	provides=('mt76-firmware')

	install -dm755 ${pkgdir}/usr/lib/firmware/mediatek
	cp ${srcdir}/mt76/firmware/* ${pkgdir}/usr/lib/firmware/mediatek/
	# remove firmwares present in linux-firmware package
	rm -f ${pkgdir}/usr/lib/firmware/mediatek/{mt7610e,mt7615_cr4,mt7615_n9,mt7615_rom_patch}.bin
}
