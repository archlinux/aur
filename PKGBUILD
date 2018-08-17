# Contributor: Jakob Gruber <jakob.gruber@gmail.com>
# Contributor: Geoffroy Carrier <geoffroy.carrier@koon.fr>
# Contributor: Filip Dvorak <fila@pruda.com>
# Contributor: 3ED_0 (AUR)
# Maintainer: SanskritFritz (gmail)

pkgname=firehol
pkgver=3.1.6
pkgrel=1
epoch=2
pkgdesc="The iptables stateful packet filtering firewall builder."
url="http://firehol.sourceforge.net"
arch=('any')
license=('GPL')
depends=('iptables' 'gawk' 'iproute' 'iprange' 'ipset' 'traceroute')
backup=('etc/firehol/firehol.conf' 'etc/firehol/fireqos.conf')
source=("https://github.com/firehol/firehol/releases/download/v$pkgver/firehol-$pkgver.tar.xz")

prepare() {
	cd "$pkgname-$pkgver"
	sed -i 's|sbin|bin|' contrib/fireqos.service
	sed -i 's|sbin|bin|' contrib/firehol.service
}

build() {
	cd "$pkgname-$pkgver"

	./configure \
		--prefix=/usr \
		--sbindir=/usr/bin \
		--sysconfdir=/etc \
		--libexecdir=/usr/lib

	make
}

package() {
	cd "$pkgname-$pkgver"

	make install DESTDIR="$pkgdir"

	install -d -m755 "$pkgdir"/usr/lib/systemd/system/
	install -m644 "contrib"/fire{hol,qos}.service "$pkgdir"/usr/lib/systemd/system/

	touch "$pkgdir"/etc/firehol/fire{hol,qos}.conf

}

md5sums=('fe6a48617eae701586057d2e0aba24d5')
