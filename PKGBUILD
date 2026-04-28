# Maintainer: Martin Kröner <aur@kroner.dev>
# shellcheck disable=SC2034,SC2128,SC2154
_pkgname=tuxedo-drivers
_reponame=${_pkgname}-nocompatcheck
pkgname=${_reponame}-dkms
pkgver=4.22.1
pkgrel=1
pkgdesc="TUXEDO Computers kernel module drivers. Compatibility check disabled - works when using identical models from other brands, example being TUXEDO Pulse 14 Gen 4 and Schenker Via 14 Pro (M24)"
url="https://gitlab.com/kronerm/${_reponame}"
license=("GPL-2.0-or-later")
arch=('x86_64')
depends=('dkms')
options=(!debug)
optdepends=('linux-headers: build modules against Arch kernel'
	'linux-lts-headers: build modules against LTS kernel'
	'linux-zen-headers: build modules against ZEN kernel'
	'linux-hardened-headers: build modules against the HARDENED kernel'
	'udev-hid-bpf: resolve keyboard issues on the Sirius 16 Gen1/2')
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
source=($pkgname-$pkgver.tar.gz::https://gitlab.com/kronerm/${_reponame}/-/archive/v${pkgver}-patched.${pkgrel}/tuxedo-drivers-v${pkgver}-patched.${pkgrel}.tar.gz dkms.conf)
sha256sums=('739e101123cdd44f619c5533dc6509608be517416a5e19807ca012a9f98e59f2'
            '0b1f2ceb729b1944504d1227e39b202159076846aaa38f8b6237b9535e543a21')
sha512sums=('d8fb9a24c8722e27d62267b9e0dfffa131ceaae26e2fc89065badb1fd1545cc617a5be338492592f6a2cd25f8f2ac6cc25b819856b88529e373bb0c8b4bfa145'
            'dda443b5966221a355fecdae7a2eb23346666cbcf93707d2fff660a32ec75cee592ae211c8d22e55413d530f59e8667292a0346d8bf6b2d280b45f3bc09efafd')

package() {
	extracted_source_dir=("$_reponame"-v"$pkgver"-patched."$pkgrel"-*/)

	target_dkms_dir="$pkgdir"/usr/src/"$_pkgname"-v"$pkgver"
	install -Dm644 "$srcdir"/dkms.conf "$target_dkms_dir"/dkms.conf
	sed "s/#MODULE_VERSION#/$pkgver/" "$target_dkms_dir"/dkms.conf
	cp -avr "$extracted_source_dir"/src/* "$target_dkms_dir"

	install -Dm644 "$extracted_source_dir"/files/usr/lib/modprobe.d/*.conf -t "$pkgdir"/usr/lib/modprobe.d/
	install -Dm644 "$extracted_source_dir"/files/usr/lib/udev/rules.d/*.rules -t "$pkgdir"/usr/lib/udev/rules.d/
	install -Dm644 "$extracted_source_dir"/files/usr/lib/udev/hwdb.d/*.hwdb -t "$pkgdir"/usr/lib/udev/hwdb.d/
}
