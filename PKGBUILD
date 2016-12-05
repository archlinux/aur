# Maintainer: Christian Hesse <mail@eworm.de>

pkgbase=wireguard
pkgname=(wireguard-dkms wireguard-tools)
pkgver=0.0.20161129
pkgrel=3
pkgdesc='next generation secure network tunnel'
arch=('x86_64' 'i686')
url='http://www.wireguard.io/'
license=('GPL')
makedepends=('git' 'libmnl')
source=("${pkgbase}-${pkgver}.tar.xz::https://git.zx2c4.com/WireGuard/snapshot/WireGuard-experimental-${pkgver}.tar.xz"
	'dkms.conf')
sha256sums=('7bdce3e56aaae91b195b8bbf7afc8d07f68632c997aa702c1ab84745c099d1b7'
            'f34dced05d2b1d9713da12eeef02e71db213646a4c8f6852227430bd84127433')

prepare() {
	cd WireGuard-experimental-${pkgver}/

	sed -i '/^include/d' src/Makefile

	find contrib/examples/ -name '.gitignore' -delete
}

build() {
	cd WireGuard-experimental-${pkgver}/

	make -C src/tools/
}

package_wireguard-dkms() {
	depends=('dkms')

	cd WireGuard-experimental-${pkgver}/src/

	install -d -m0755 "${pkgdir}"/usr/src/wireguard-${pkgver}/{crypto,selftest}/
	install -D -m0644 "${srcdir}"/dkms.conf "${pkgdir}"/usr/src/wireguard-${pkgver}/dkms.conf
	install -m0644 Kbuild Kconfig Makefile *.c *.h "${pkgdir}"/usr/src/wireguard-${pkgver}/
	install -m0644 crypto/* "${pkgdir}"/usr/src/wireguard-${pkgver}/crypto/
	install -m0644 selftest/* "${pkgdir}"/usr/src/wireguard-${pkgver}/selftest/
}

package_wireguard-tools() {
	depends=('libmnl')

	cd WireGuard-experimental-${pkgver}/

	make -C src/tools/ DESTDIR="${pkgdir}/" install

	install -d -m0755 "${pkgdir}"/usr/share/${pkgbase}/
	cp -r contrib/examples/ "${pkgdir}"/usr/share/${pkgbase}/
}

