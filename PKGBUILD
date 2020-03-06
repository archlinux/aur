# Maintainer: Janne Heß <jannehess@gmail.com>

pkgname=mkinitcpio-sd-zfs-any
pkgver=1.0.2
pkgrel=1
pkgdesc='Compatibility between systemd and ZFS roots'
license=('MIT')
url='https://github.com/dasJ/sd-zfs'
conflicts=('mkinitcpio-sd-zfs-git')
depends=('mkinitcpio' 'systemd')
source=("https://github.com/dasJ/sd-zfs/archive/v${pkgver}.tar.gz")
sha512sums=('04ceb91cf0c1d54a787ab3ac028c4b930eb948ee71d1b07b45b8faa8cbae08a3458f0d2f9e076ea8f19a344cc44a9e155ec59f4f5f4e45ef0d851b2ac12880b8')
arch=('any')

build() {
	cd "sd-zfs-${pkgver}"

	make all
}

package() {
	local install bin
	cd "sd-zfs-${pkgver}"

	# mkinitcpio
	for install in sd-zfs{,-shutdown}; do
		install -Dm644 "mkinitcpio-install/${install}" "${pkgdir}/usr/lib/initcpio/install/${install}"
	done

	# binaries
	install -Dm755 zfs-shutdown "${pkgdir}/usr/lib/systemd/system-shutdown/zfs-shutdown"
	for bin in initrd-zfs-generator mount.initrd_zfs; do
		install -Dm755 "${bin}" "${pkgdir}/usr/lib/mkinitcpio-sd-zfs/${bin}"
	done

	# systemd unit
	install -Dm644 units/mkinitcpio-override.conf "${pkgdir}/usr/lib/systemd/system/mkinitcpio-generate-shutdown-ramfs.service.d/sd-zfs.conf"
}
