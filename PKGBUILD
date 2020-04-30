# Maintainer: Tomasz Maciej Nowak <com[dot]gmail[at]tmn505>

# All my PKGBUILDs are managed at https://github.com/tmn505/AUR

pkgbase=mt76-git
pkgname=('mt76-dkms-git' 'mt76-firmware-git')
pkgver=r1915.g5f3ccc7
pkgrel=4
url='https://github.com/openwrt/mt76'
makedepends=('git')
source=("git+${url}.git"
        'wireless-mediatek-Replace-rcu_swap_protected-with-rc.patch'
        'dkms.conf')
sha256sums=('SKIP'
            '464dcf601bbfbce3e0dd7fcb5008f44b979c6ad85325244d0e0aa3cdea7fb13e'
            '1c4a61f05b090bd982d21f85568f28bdff6d3a26a9a8853603dcffdd4260cec0')

pkgver() {
	cd ${srcdir}/mt76
	printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package_mt76-dkms-git() {
	pkgdesc='mac80211 driver for MediaTek MT76x0e, MT76x2e, MT7603, MT7615, MT7628 and MT7688'
	arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
	license=('GPL2' 'ISC')
	provides=('mt76-dkms')
	depends=('dkms')
	optdepends=('linux-firmware: basic set of firmwares'
	            'mt76-firmware-git: complementary set of firmwares')

	install -dm755 ${pkgdir}/usr/src/mt76-${pkgver}/patches
	cp -r ${srcdir}/mt76/* ${pkgdir}/usr/src/mt76-${pkgver}/
	cp ${srcdir}/wireless-mediatek-Replace-rcu_swap_protected-with-rc.patch ${pkgdir}/usr/src/mt76-${pkgver}/patches/
	rm -f -r ${pkgdir}/usr/src/mt76-${pkgver}/firmware
	sed --follow-symlinks -e "s,@PKGVER@,${pkgver}," ${srcdir}/dkms.conf > ${pkgdir}/usr/src/mt76-${pkgver}/dkms.conf
}

package_mt76-firmware-git() {
	pkgdesc='Firmware for MediaTek MT76x2e, MT7603, MT7628'
	arch=('any')
	license=('custom:Ralink Limited Patent License')
	provides=('mt76-firmware')

	install -dm755 ${pkgdir}/usr/lib/firmware/mediatek
	cp ${srcdir}/mt76/firmware/* ${pkgdir}/usr/lib/firmware/mediatek/
	# remove binaries present in linux-firmware package
	rm -f ${pkgdir}/usr/lib/firmware/mediatek/{mt7610e,mt7615_cr4,mt7615_n9,mt7615_rom_patch,mt7622_n9,mt7622_rom_patch}.bin
}
