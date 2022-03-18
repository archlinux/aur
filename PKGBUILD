# Maintainer: Dennis Værum <archlinux@varum.dk>

pkgname=mkinitcpio-sd-zfs-git
pkgver=1.0.2.r4.g1a36d4f
pkgrel=3
pkgdesc='Compatibility between systemd and ZFS roots'
license=('MIT')
url='https://github.com/dasJ/sd-zfs'
conflicts=('mkinitcpio-sd-zfs')
depends=('mkinitcpio' 'systemd')

source=("$pkgname"::"git+https://github.com/dasJ/sd-zfs")
sha512sums=('SKIP')

arch=('any')

pkgver() {
	cd "$pkgname"
	git describe --long --tags | sed -e 's/\([^-]*-g\)/r\1/;s/-/./g' -e 's/^v//'
}

build() {
	cd "${pkgname}"

	make all
}

package() {
	local install bin
	cd "${pkgname}"

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
