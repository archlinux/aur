# Maintainer: Martin Kröner <aur@kroner.dev>
_pkgname=tuxedo-drivers
_reponame=${_pkgname}-nocompatcheck
pkgname=${_reponame}-dkms
pkgver=4.6.1
pkgrel=2
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
sha256sums=('fc6fbaffeed0a777e24a8a45d9dfe13b41eb038607bde54fb4c8a4cbf2b48856'
	'd94d305bfd2767ad047bc25cc5ce986e76804e7376c3dd4d8e500ebe2c7bef3c')
sha512sums=('43dbcae1e12894c52c86110ac6ea919eb233321bdf6a8b3851798a65ba21294bc7fcc160f30a24b1c1fb4a984e6a093c952c280daffa755a172e2a91dfa82f6e'
	'3101d1063e9c45eccb505fa21578cba33ae5c85b3d5b1c62c90806ad9d7b04410c91ded7a7115a85d1f6ecbd90ccc9e5f2ecf269dac4a557baa017a629bbcf81')

package() {
	extracted_archive=("${_reponame}-v${pkgver}-patched.${pkgrel}-"*)

	mkdir -p "${pkgdir}/usr/src/${_pkgname}-v${pkgver}"
	mkdir -p "${pkgdir}/etc/udev/rules.d/"
	sed "s/#MODULE_VERSION#/${pkgver}/" "${extracted_archive}"/debian/tuxedo-drivers.dkms >dkms.conf
	install -Dm644 dkms.conf -t "$pkgdir/usr/src/${_pkgname}-v$pkgver/"
	install -Dm644 "${extracted_archive}"/Makefile -t "$pkgdir/usr/src/${_pkgname}-v${pkgver}/"
	install -Dm644 "${extracted_archive}"/tuxedo_keyboard.conf -t "$pkgdir/usr/lib/modprobe.d/"
	install -Dm644 "${srcdir}/tuxedo_io.conf" -t "${pkgdir}/usr/lib/modules-load.d/"
	cp -avr "${extracted_archive}"/src/* "$pkgdir/usr/src/${_pkgname}-v$pkgver/"
	install -Dm644 "${_reponame}-v${pkgver}-patched.${pkgrel}-"*/99-z-tuxedo-systemd-fix.rules -t "$pkgdir/etc/udev/rules.d/"
}
