# Maintainer: Tomasz Maciej Nowak <com[dot]gmail[at]tmn505>

# All my PKGBUILDs are managed at https://github.com/tmn505/AUR

pkgbase=mt76-git
pkgname=('mt76-dkms-git' 'mt76-firmware-git')
pkgver=r2013.gd6d9a7e
pkgrel=1
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/openwrt/mt76'
makedepends=('git')
source=("git+${url}.git"
        'Revert-mac80211-simplify-TX-aggregation-start.patch'
        'Revert-mt76-enable-Airtime-Queue-Limit-support.patch'
        'Revert-mt76-rely-on-mac80211-utility-routines-to-com.patch'
        'wireless-mediatek-Replace-rcu_swap_protected-with-rc.patch'
        'dkms.conf')
sha256sums=('SKIP'
            'a0100102d806486713e290c788d9478c2bcd951eca09956140f685a4289af76d'
            'bfd9729a0f19d3792e3c8a05fa133a18428ba3bf472c5e0e13fe2de841d52364'
            '553b685584ce5d4eebf1ac5d28010ccf5bf502abebc6c0a54206c44bfd6ed835'
            '464dcf601bbfbce3e0dd7fcb5008f44b979c6ad85325244d0e0aa3cdea7fb13e'
            '7f3e5a2d19f06e6e9c453a0b7d26ae128ee1c04eb1aee5be726fa53fe82c6364')

pkgver() {
	cd ${srcdir}/mt76
	printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package_mt76-dkms-git() {
	pkgdesc='mac80211 driver for MediaTek MT76x0e, MT76x2e, MT7603, MT7615, MT7628 and MT7688'
	license=('GPL2' 'ISC')
	provides=('mt76-dkms')
	depends=('dkms')
	optdepends=('linux-firmware: basic set of firmwares'
	            'mt76-firmware-git: complementary set of firmwares')

	install -dm755 ${pkgdir}/usr/src/mt76-${pkgver}/patches
	cp -r ${srcdir}/mt76/* ${pkgdir}/usr/src/mt76-${pkgver}/
	cp ${srcdir}/*.patch ${pkgdir}/usr/src/mt76-${pkgver}/patches/
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
