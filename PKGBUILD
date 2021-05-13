# Maintainer: Dennis Værum <archlinux@varum.dk>
# Maintainer (old): Janne Heß <jannehess@gmail.com>

pkgname=mkinitcpio-sd-zfs
pkgver=1.0.2
pkgrel=1
pkgdesc='Compatibility between systemd and ZFS roots'
license=('MIT')
url='https://github.com/dasJ/sd-zfs'
conflicts=('mkinitcpio-sd-zfs-git')
depends=('mkinitcpio' 'systemd')

source=("https://github.com/dasJ/sd-zfs/archive/v${pkgver}.tar.gz")
sha512sums=('04ceb91cf0c1d54a787ab3ac028c4b930eb948ee71d1b07b45b8faa8cbae08a3458f0d2f9e076ea8f19a344cc44a9e155ec59f4f5f4e45ef0d851b2ac12880b8')

#_git_commit="1a36d4fd85377c0b323d8f2ca2039770e5a0fee4"
#source=("https://github.com/dasJ/sd-zfs/archive/${_git_commit}.tar.gz")
#sha512sums=('a0669969a6bc430d502d3b93b2fe5626c115735df3452c368a906e6da0f9a0b41b2159b4cf4c9afc59a87818d289a7e473f686dd230df70db1e469e968a655c9')

arch=('any')

_src_dir="sd-zfs-${_git_commit:-${pkgver}}"

build() {
	cd "${_src_dir}"

	make all
}

package() {
	local install bin
	cd "${_src_dir}"

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
