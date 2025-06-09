# Maintainer: Martin Kröner <aur@kroner.dev>
# shellcheck disable=SC2034,SC2128,SC2154
_pkgname=tuxedo-drivers
_reponame=${_pkgname}-nocompatcheck
pkgname=${_reponame}-dkms
pkgver=4.13.1
pkgrel=1
pkgdesc="TUXEDO Computers kernel module drivers. Compatibility check disabled - works when using identical models from other brands, example being TUXEDO Pulse 14 Gen 4 and Schenker Via 14 Pro (M24)"
url="https://gitlab.com/kreny/${_reponame}"
license=("GPL-2.0-or-later")
arch=('x86_64')
depends=('dkms')
options=(!debug)
optdepends=('linux-headers: build modules against Arch kernel'
	'linux-lts-headers: build modules against LTS kernel'
	'linux-zen-headers: build modules against ZEN kernel'
	'linux-hardened-headers: build modules against the HARDENED kernel')
# tuxedo-keyboard-ite = ite_8291, ite_8291_lb, ite_8297 and ite_829x
provides=('tuxedo-drivers-dkms'
	'tuxedo-keyboard'
	'tuxedo-keyboard-ite'
	'tuxedo-io'
	'clevo-wmi'
	'clevo-acpi'
	'uniwill-wmi'
	'ite_8291'
	'ite_8291_lb'
	'ite_8297'
	'ite_829x')
conflicts=('tuxedo-drivers-dkms' 'tuxedo-keyboard-dkms' 'tuxedo-keyboard-ite-dkms')
source=($pkgname-$pkgver.tar.gz::https://gitlab.com/kreny/${_reponame}/-/archive/v${pkgver}-patched.${pkgrel}/tuxedo-drivers-v${pkgver}-patched.${pkgrel}.tar.gz)
sha256sums=('6d13868ea0cf56fcc7b94798d87edc9dcb629d9c15b92d28d5f73c7b547000f8')
sha512sums=('cb4d696afccb8ed6ee90d3f7c7e905cddbdff8e469b0baaa5b84bbd1b2eafea1b28c15021f70ca51bf6d1fe25dd360badefc9eabc2f0774ef6f6ab9ef7702404')

package() {
	extracted_source_dir=("$_reponame"-v"$pkgver"-patched."$pkgrel"-*/)

	target_dkms_dir="$pkgdir"/usr/src/"$_pkgname"-v"$pkgver"/
	target_dkms_file="$target_dkms_dir"/dkms.conf

	udev_rules_dir="$pkgdir"/etc/udev/rules.d/
	udev_hwdb_dir="$pkgdir"/usr/lib/udev/hwdb.d/

	modprobe_dir="$pkgdir"/usr/lib/modprobe.d/

	install -Dm644 "$extracted_source_dir"/debian/tuxedo-drivers.dkms "$target_dkms_file"
	sed "s/#MODULE_VERSION#/$pkgver/" "$target_dkms_file"

	cp -avr "$extracted_source_dir"/src/* "$target_dkms_dir"

	install -Dm644 "$extracted_source_dir"/tuxedo_keyboard.conf -t "$modprobe_dir"
	install -Dm644 "$extracted_source_dir"/99-z-tuxedo-systemd-fix.rules -t "$udev_rules_dir"
	install -Dm644 "$extracted_source_dir"/99-infinityflex-touchpanel-toggle.rules -t "$udev_rules_dir"
	install -Dm644 "$extracted_source_dir"/61-sensor-tuxedo.hwdb -t "$udev_hwdb_dir"
	install -Dm644 "$extracted_source_dir"/61-keyboard-tuxedo.hwdb -t "$udev_hwdb_dir"
}
