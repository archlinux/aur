# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Corey Hinshaw <coreyhinshaw(at)gmail(dot)com>
pkgname=system76-dkms
pkgver=1.0.12
pkgrel=2
pkgdesc="On newer System76 laptops, this driver controls some of the hotkeys and allows for custom fan control."
arch=('x86_64')
url="https://github.com/pop-os/system76-dkms"
license=('GPL3')
depends=('dkms')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('0e5e6c4d9d61502eb3af05c8751ed4d9301d883949eb7f244225ed222d4617d9')

package() {
	# Installation directory
	local install_dir="$pkgdir/usr/src/system76-$pkgver"

	cd "$pkgname-$pkgver"

	# Install source files
	for file in {Makefile,*.c,*.h}; do
		[ -f "$file" ] || continue
		install -Dm644 -t "$install_dir/" "$file"
	done

	# Install udev hwdb files
	install -Dm644 -t "$pkgdir/usr/lib/udev/hwdb.d/" lib/udev/hwdb.d/*

	# Edit and install dkms configuration
	sed "s/#MODULE_VERSION#/$pkgver/" "debian/system76-dkms.dkms" > "$install_dir/dkms.conf"

	# Load the module at boot
	install -Dm644 "usr/share/initramfs-tools/modules.d/$pkgname-dkms.conf" \
		"$pkgdir/etc/modules-load.d/$pkgname.conf"
}
