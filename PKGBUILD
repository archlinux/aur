# Maintainer: Keyaku <xbox dash tug dash geography at duck dot com>
# Contributor: Thomas Rijpstra <thomas at fourlights dot nl>

# Based on the Minisforum V3 patch by Thomas Rijpstra <thomas at fourlights dot nl>
# and the original fix by eplightning: https://github.com/mudkipme/awesome-minisforum-v3/issues/2#issuecomment-2279282784

pkgname=minisforum-v3se-dsdt
pkgver=1.0.0
pkgrel=1
pkgdesc="Patch ACPI DSDT to support the Minisforum V3 SE accelerometer (ST LSM6DS3TR-C, HID SMO8B30)"
arch=('any')
url='https://github.com/Keyaku/minisforum-v3se-dsdt'
license=('MIT')
makedepends=('iasl')
depends=('mkinitcpio')
# Supersedes the generic Minisforum V3 package
conflicts=('minisforum-v3-dsdt')

DLAGENTS+=('manual::/usr/bin/echo Note: as root, dump the current DSDT first: sudo cat /sys/firmware/acpi/tables/DSDT > dsdt.dat -- IMPORTANT: if minisforum-v3se-dsdt is already installed, /sys exposes the PATCHED DSDT (acpi_override is active), so uninstall the package or boot without the override before dumping, otherwise you will be re-patching an already-patched table.')
source=('manual://dsdt.dat' 'fix-dsdt.patch')
sha256sums=(
	'e1f9721a12205c20676b8ed45670dc03f61bac420955f28aa678d09e08dfbe6f'
	'fa87dc5e0121209c22a113717c5ea6e2e8cca24545915334d40d7986f802c523'
)

install='dsdt.install'

prepare() {
	cd "$srcdir"
	iasl -d -ve "dsdt.dat"
	patch -i "fix-dsdt.patch"
	iasl -tc -ve "dsdt.dsl"
}

package() {
	install -Dm644 "$srcdir/dsdt.aml" "$pkgdir/etc/initcpio/acpi_override/minisforum_v3se_dsdt.aml"
}
