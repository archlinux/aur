# Maintainer: renanbs <renanbs@users.noreply.github.com>
#
# Read-only hwmon driver for Uniwill/Tongfang ECs that only expose the vendor
# ACPI-WMI interface (no INOU0000 ACPI device, so the in-tree uniwill-laptop
# driver cannot probe). It reads fan tachometers, CPU/GPU temperatures and PWM
# values; it never writes to the EC.
pkgname=uniwill-ec-hwmon-dkms
pkgver=0.1.0
pkgrel=1
pkgdesc="Read-only hwmon driver for Uniwill/Tongfang ECs over ACPI-WMI (fan RPM, CPU/GPU temps, PWM)"
arch=('any')
url="https://github.com/renanbs/uniwill-ec-hwmon"
license=('GPL-2.0-only')
depends=('dkms')
makedepends=('git')
source=("git+${url}.git#tag=v${pkgver}")
sha256sums=('SKIP')
install=uniwill-ec-hwmon.install

package() {
	local src="$srcdir/uniwill-ec-hwmon-${pkgver}"
	local dst="$pkgdir/usr/src/uniwill-ec-hwmon-${pkgver}"

	# git sources are checked out as <repo name>; fall back for tarball sources
	[[ -d "$src" ]] || src="$srcdir/uniwill-ec-hwmon"

	install -d "$dst"
	install -m644 "$src/uniwill_ec_hwmon.c" "$src/Makefile" "$src/dkms.conf" "$dst/"

	install -d "$pkgdir/etc/modules-load.d"
	printf 'uniwill_ec_hwmon\n' > "$pkgdir/etc/modules-load.d/uniwill-ec-hwmon.conf"
}
