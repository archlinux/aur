# Maintainer: Christian Hesse <mail@eworm.de>

pkgbase=wireguard
pkgname=(wireguard-dkms wireguard-tools)
pkgver=0.0.20160711
pkgrel=1
pkgdesc='next generation secure network tunnel'
arch=('x86_64' 'i686')
url='http://www.wireguard.io/'
license=('GPL')
makedepends=('git' 'libmnl')
source=("${pkgbase}-${pkgver}.tar.xz::https://git.zx2c4.com/WireGuard/snapshot/WireGuard-experimental-${pkgver}.tar.xz"
	'dkms.conf')
sha256sums=('4ab876642236abcac416f7b75cf5e9e28b8581d5b7741d36a437af08c42d8081'
            'f34dced05d2b1d9713da12eeef02e71db213646a4c8f6852227430bd84127433')

build() {
	cd WireGuard-experimental-${pkgver}/src/tools/

	make
}

package_wireguard-dkms() {
	depends=('dkms')

	cd WireGuard-experimental-${pkgver}/src/

	install -d -m0755 "${pkgdir}"/usr/src/wireguard-${pkgver}/crypto/
	install -D -m0755 "${srcdir}"/dkms.conf "${pkgdir}"/usr/src/wireguard-${pkgver}/dkms.conf
	install -m0755 Makefile *.c *.h "${pkgdir}"/usr/src/wireguard-${pkgver}/
	install -m0755 crypto/* "${pkgdir}"/usr/src/wireguard-${pkgver}/crypto/
}

package_wireguard-tools() {
	depends=('libmnl')

	cd WireGuard-experimental-${pkgver}/src/tools/

	make DESTDIR="${pkgdir}/" install
}

