# Maintainer: Janne Heß <jannehess@gmail.com>

pkgname=mkinitcpio-sd-zfs
pkgver=1.0.1
pkgrel=1
pkgdesc='Compatibility between systemd and ZFS roots'
license=('GPL3')
url='https://github.com/dasJ/sd-zfs'
conflicts=('mkinitcpio-sd-zfs-git')
depends=('mkinitcpio' 'systemd')
source=("https://github.com/dasJ/sd-zfs/archive/v${pkgver}.tar.gz"
        'preset')
sha512sums=('66ad2f3f9a7235ece9887cd4ffd598aca5ca5a0f9889bcc1282104dcd3362aeb332780770b665ec84f49e8f4c0512e8e96bd622a3becba808123c5dc3eb46445'
            '4c112c138b36cfd5c4b16d043da0410b06d2f1ac485a69bcde469701e6d52a0ca30f0071d51875b0de27e847aecc192c9485aabc20fcf53801b1ffe8c06c7d30')
arch=('i686' 'x86_64')

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
	install -Dm644 units/sd-zfs-generate-shutdown-ramfs.service "${pkgdir}/usr/lib/systemd/system/sd-zfs-generate-shutdown-ramfs.service"
	install -Dm644 "${srcdir}/preset" "${pkgdir}/usr/lib/systemd/system-preset/51-sd-zfs.preset"
}
