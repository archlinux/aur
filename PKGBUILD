# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Corey Hinshaw <corey(at)electrickite(dot)org>
pkgname=system76-acpi-dkms
pkgver=1.0.2+1+g0bc966c
pkgrel=1
pkgdesc="This provides the system76_acpi in-tree driver for systems missing it."
arch=('x86_64')
url="https://github.com/pop-os/system76-acpi-dkms"
license=('GPL')
depends=('dkms')
makedepends=('git')
_commit=0bc966cf8ec11a173e0bdffb9d5df8d99bea2617
source=("git+https://github.com/pop-os/system76-acpi-dkms.git#commit=$_commit"
        'system76-acpi.conf')
sha256sums=('SKIP'
            '7b7e6bac10669d47576c8bd0bedad8217b32c1e25cab9cbb2ff64aa6be11fd39')

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --tags | sed 's/-/+/g'
}

package() {
	# Installation directory
	local install_dir="$pkgdir/usr/src/system76-acpi-${pkgver//+*/}"

	cd "$srcdir/$pkgname"

	# Install source files
	for file in {Makefile,*.c,*.h}; do
		[ -f "$file" ] || continue
		install -D -m644 -t "$install_dir/" "$file"
	done

	# Install udev hwdb files
	install -Dm644 -t "$pkgdir/usr/lib/udev/hwdb.d/" lib/udev/hwdb.d/*

	# Edit and install dkms configuration
	sed "s/#MODULE_VERSION#/$pkgver/" "debian/system76-acpi-dkms.dkms" > "$install_dir/dkms.conf"

	# Load the module at boot
	install -Dm644 $srcdir/system76-acpi.conf -t "$pkgdir/etc/modules-load.d"
}
