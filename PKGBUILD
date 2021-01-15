# Contributor: Jakob Gruber <jakob.gruber@gmail.com>
# Contributor: Geoffroy Carrier <geoffroy.carrier@koon.fr>
# Contributor: Filip Dvorak <fila@pruda.com>
# Contributor: 3ED_0 (AUR)
# Maintainer: SanskritFritz (gmail)

pkgname=firehol
pkgver=3.1.7
pkgrel=3
epoch=2
pkgdesc="The iptables stateful packet filtering firewall builder."
url="http://firehol.sourceforge.net"
arch=('any')
license=('GPL')
depends=('iptables' 'gawk' 'iproute' 'iprange' 'ipset' 'traceroute' 'procps-ng')
backup=('etc/firehol/firehol.conf' 'etc/firehol/fireqos.conf')
source=("https://github.com/firehol/firehol/releases/download/v$pkgver/firehol-$pkgver.tar.xz")

prepare() {
	cd "$pkgname-$pkgver"
	sed -i 's|sbin|bin|' contrib/fireqos.service
	sed -i 's|sbin|bin|' contrib/firehol.service
}

build() {
	cd "$pkgname-$pkgver"

	PING6="/usr/bin/ping -6" ./configure \
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

md5sums=('37b93db8bc5aeef29f93e347ea95af9e')
