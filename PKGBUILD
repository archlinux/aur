# Maintainer: Martin Kröner <aur@kroner.dev>
_pkgname=tuxedo-drivers
pkgname=tuxedo-drivers-nocompatcheck-dkms
pkgver=4.5.3
pkgrel=1
pkgdesc="TUXEDO Computers kernel module drivers. Compatibility check disabled - works when using identical models from other brands, example being TUXEDO Pulse 14 Gen 4 and Schenker Via 14 Pro (M24)"
url="https://gitlab.com/tuxedocomputers/development/packages/tuxedo-drivers"
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
#backup=(etc/modprobe.d/tuxedo_keyboard.conf)
source=($pkgname-$pkgver.tar.gz::https://gitlab.com/tuxedocomputers/development/packages/tuxedo-drivers/-/archive/v${pkgver}/tuxedo-drivers-v${pkgver}.tar.gz disable-compatibility-check.patch tuxedo_io.conf)
sha256sums=('176e465c84e4a830afabe608546ff076a38d6dd033d594e827e5b64d2a296206'
	'7234b012ebd52e3ecf80723f9ec1b709b7dccf631974803473b57b846085fcc1'
	'd94d305bfd2767ad047bc25cc5ce986e76804e7376c3dd4d8e500ebe2c7bef3c')
sha512sums=('b99516e044837b3013a1d50534da7cd261472ab758b47ec4750ae0836c0b2adf54441741c11d70053aeb61a282b15ba459ef09fb7a7c0cf9387646200f36ab84'
	'084365d1045239e601d9d51dda3cce8d26dbe44c369d6d5a33a5bac8157ce6d56eaf83f2c60ff79fa7e7016b61635fe3b69b4e850bfcb0f8a4197493a06d9efb'
	'3101d1063e9c45eccb505fa21578cba33ae5c85b3d5b1c62c90806ad9d7b04410c91ded7a7115a85d1f6ecbd90ccc9e5f2ecf269dac4a557baa017a629bbcf81')

package() {
	mkdir -p "${pkgdir}/usr/src/${_pkgname}-v${pkgver}"
	mkdir -p "${pkgdir}/etc/udev/rules.d/"
	sed "s/#MODULE_VERSION#/${pkgver}/" "${_pkgname}-v$pkgver"/debian/tuxedo-drivers.dkms >dkms.conf
	install -Dm644 dkms.conf -t "$pkgdir/usr/src/${_pkgname%}-v$pkgver/"
	install -Dm644 "${_pkgname%}-v$pkgver"/Makefile -t "$pkgdir/usr/src/${_pkgname%}-v$pkgver/"
	install -Dm644 "${_pkgname%}-v$pkgver"/tuxedo_keyboard.conf -t "$pkgdir/usr/lib/modprobe.d/"
	install -Dm644 "$srcdir/tuxedo_io.conf" -t "$pkgdir/usr/lib/modules-load.d/"
	patch -d "${_pkgname%}-v$pkgver" -p1 <disable-compatibility-check.patch
	cp -avr "${_pkgname%}-v$pkgver"/src/* "$pkgdir/usr/src/${_pkgname%}-v$pkgver/"
	install -Dm644 "${_pkgname%}-v$pkgver"/99-z-tuxedo-systemd-fix.rules -t "$pkgdir/etc/udev/rules.d/"
}
