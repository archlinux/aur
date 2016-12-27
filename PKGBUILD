# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Jason A. Donenfeld <Jason@zx2c4.com>

pkgbase=wireguard
pkgname=(wireguard-dkms wireguard-tools)
pkgver=0.0.20161223
pkgrel=1
pkgdesc='next generation secure network tunnel'
arch=('x86_64' 'i686')
url='http://www.wireguard.io/'
license=('GPL')
makedepends=('git' 'libmnl')
source=("${pkgbase}-${pkgver}.tar.xz::https://git.zx2c4.com/WireGuard/snapshot/WireGuard-${pkgver}.tar.xz")
sha256sums=('bbd98ff6667e76ac283685db9ee7a6777529f5d311a0bf1fe9a15932aed2b972')

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

