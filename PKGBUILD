# Maintainer: Christian Hesse <mail@eworm.de>

pkgbase=wireguard
pkgname=(wireguard-dkms wireguard-tools)
pkgver=0.0.20161216
pkgrel=1
pkgdesc='next generation secure network tunnel'
arch=('x86_64' 'i686')
url='http://www.wireguard.io/'
license=('GPL')
makedepends=('git' 'libmnl')
source=("${pkgbase}-${pkgver}.tar.xz::https://git.zx2c4.com/WireGuard/snapshot/WireGuard-${pkgver}.tar.xz")
sha256sums=('9d3c1f52a9995d2bf1f5cd9d6b1922bd1f78fb3ddbd30bf3587077f79ef0977b')

prepare() {
	cd WireGuard-${pkgver}/

	find contrib/examples/ -name '.gitignore' -delete
}

build() {
	cd WireGuard-${pkgver}/

	make -C src/tools/
}

package_wireguard-dkms() {
	depends=('dkms')
	provides=('WIREGUARD-MODULE')

	cd WireGuard-${pkgver}/

	make -C src/ DESTDIR="${pkgdir}/" DKMSDIR="/usr/src/wireguard-${pkgver}/" dkms-install
}

package_wireguard-tools() {
	depends=('libmnl' 'WIREGUARD-MODULE')

	cd WireGuard-${pkgver}/

	make -C src/tools/ DESTDIR="${pkgdir}/" install

	install -d -m0755 "${pkgdir}"/usr/share/${pkgbase}/
	cp -r contrib/examples/ "${pkgdir}"/usr/share/${pkgbase}/
}

