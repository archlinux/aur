# Maintainer: Martin Kröner <aur@kroner.dev>
_pkgname=tuxedo-drivers
_reponame=${_pkgname}-nocompatcheck
pkgname=${_reponame}-dkms
pkgver=4.13.1
pkgrel=1
pkgdesc="TUXEDO Computers kernel module drivers. Compatibility check disabled - works when using identical models from other brands, example being TUXEDO Pulse 14 Gen 4 and Schenker Via 14 Pro (M24)"
url="https://gitlab.com/kreny/${_reponame}"
license=("GPL3")
arch=('x86_64')
depends=('dkms')
options=(!debug)
optdepends=('linux-headers: build modules against Arch kernel'
	'linux-lts-headers: build modules against LTS kernel'
	'linux-zen-headers: build modules against ZEN kernel'
	'linux-hardened-headers: build modules against the HARDENED kernel')
# tuxedo-keyboard-ite = ite_8291, ite_8291_lb, ite_8297 and ite_829x
provides=('tuxedo-drivers-dkms' 'tuxedo-keyboard'
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
source=($pkgname-$pkgver.tar.gz::https://gitlab.com/kreny/${_reponame}/-/archive/v${pkgver}-patched.${pkgrel}/tuxedo-drivers-v${pkgver}-patched.${pkgrel}.tar.gz tuxedo_io.conf)
sha256sums=('6d13868ea0cf56fcc7b94798d87edc9dcb629d9c15b92d28d5f73c7b547000f8'
	'd94d305bfd2767ad047bc25cc5ce986e76804e7376c3dd4d8e500ebe2c7bef3c')
sha512sums=('cb4d696afccb8ed6ee90d3f7c7e905cddbdff8e469b0baaa5b84bbd1b2eafea1b28c15021f70ca51bf6d1fe25dd360badefc9eabc2f0774ef6f6ab9ef7702404'
	'3101d1063e9c45eccb505fa21578cba33ae5c85b3d5b1c62c90806ad9d7b04410c91ded7a7115a85d1f6ecbd90ccc9e5f2ecf269dac4a557baa017a629bbcf81')

package() {
	extracted_archive=("${_reponame}-v${pkgver}-patched.${pkgrel}-"*)

	mkdir -p "${pkgdir}/usr/src/${_pkgname}-v${pkgver}"
	mkdir -p "${pkgdir}/etc/udev/rules.d/"
	mkdir -p "${pkgdir}/usr/lib/udev/hwdb.d"
	sed "s/#MODULE_VERSION#/${pkgver}/" "${extracted_archive}"/debian/tuxedo-drivers.dkms >dkms.conf
	install -Dm644 dkms.conf -t "$pkgdir/usr/src/${_pkgname}-v$pkgver/"
	install -Dm644 "${extracted_archive}"/Makefile -t "$pkgdir/usr/src/${_pkgname}-v${pkgver}/"
	install -Dm644 "${extracted_archive}"/tuxedo_keyboard.conf -t "$pkgdir/usr/lib/modprobe.d/"
	install -Dm644 "${srcdir}/tuxedo_io.conf" -t "${pkgdir}/usr/lib/modules-load.d/"
	cp -avr "${extracted_archive}"/src/* "$pkgdir/usr/src/${_pkgname}-v$pkgver/"
	install -Dm644 "${_reponame}-v${pkgver}-patched.${pkgrel}-"*/99-z-tuxedo-systemd-fix.rules -t "$pkgdir/etc/udev/rules.d/"
	install -Dm644 "${_reponame}-v${pkgver}-patched.${pkgrel}-"*/99-infinityflex-touchpanel-toggle.rules -t "$pkgdir/etc/udev/rules.d/"
	install -Dm644 "${_reponame}-v${pkgver}-patched.${pkgrel}-"*/61-sensor-infinityflex.hwdb -t "$pkgdir/usr/lib/udev/hwdb.d"
}
