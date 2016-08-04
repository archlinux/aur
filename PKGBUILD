# Maintainer: Janne Heß <jannehess@gmail.com>

pkgname=mkinitcpio-sd-zfs
pkgver=0.1.0
pkgrel=1
pkgdesc='Compatibility between systemd and ZFS roots'
license=('GPL3')
conflicts=('mkinitcpio-sd-zfs-git')
depends=('mkinitcpio' 'systemd')
source=("https://github.com/dasJ/sd-zfs/archive/v${pkgver}.tar.gz")
sha512sums=('b5e533d6b082f8759b90ea9ab80fc04290abff62e75144e02bca11f6b208c1df9fb42fc17266b71263c752298eb62ec9cc06883bed5b3df2bcdeb59dd08ee874')
arch=('i686' 'x86_64')

build() {
	cd "sd-zfs-${pkgver}"

	make all
}

package() {
	cd "sd-zfs-${pkgver}"

	# mkinitcpio
	install -Dm644 mkinitcpio-sd-zfs.install "${pkgdir}/usr/lib/initcpio/install/sd-zfs"

	# binaries
	for bin in mount.zfs_member zfs-getforce; do
		install -Dm755 "${bin}" "${pkgdir}/usr/lib/mkinitcpio-sd-zfs/${bin}"
	done

	# systemd unit
	install -Dm644 units/zfs-getforce.service "${pkgdir}/usr/lib/mkinitcpio-sd-zfs/units/zfs-getforce.service"

	# systemd overrides
	for override in sysroot.mount zfs-import-{scan,cache}.service; do
		install -Dm644 "overrides/${override}" "${pkgdir}/usr/lib/mkinitcpio-sd-zfs/overrides/${override}"
	done
}
