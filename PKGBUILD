# Contributor: Jakob Gruber <jakob.gruber@gmail.com>
# Contributor: Geoffroy Carrier <geoffroy.carrier@koon.fr>
# Contributor: Filip Dvorak <fila@pruda.com>
# Contributor: 3ED_0 (AUR)
# Maintainer: SanskritFritz (gmail)

pkgname=firehol-git
_gitname=firehol
pkgver=v3.1.7.r1.g52549e0
pkgrel=1
epoch=1
pkgdesc="The iptables stateful packet filtering firewall builder."
url="http://firehol.org/"
arch=('any')
license=('GPL')
depends=('iptables' 'gawk' 'iproute' 'iprange' 'ipset' 'traceroute' 'procps-ng')
makedepends=('git' 'dblatex' 'pandoc')
provides=('firehol')
conflicts=('firehol')
backup=('etc/firehol/firehol.conf' 'etc/firehol/fireqos.conf')
source=("$_gitname::git+https://github.com/firehol/firehol")

pkgver() {
	cd "$_gitname"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$_gitname"
	sed -i 's|sbin|bin|' contrib/fireqos.service
	sed -i 's|sbin|bin|' contrib/firehol.service
}

build() {
	cd "$_gitname"

	./autogen.sh
	PING6="/usr/bin/ping -6" ./configure \
		--enable-maintainer-mode \
		--prefix="/usr" \
		--sysconfdir="/etc" \
		--sbindir="/usr/bin" \
		--libexecdir="/usr/lib"

	# Documents are created in certain order
	# thus parallel processing must be disabled:
	MAKEFLAGS="-j1" make
}

package() {
	cd "$_gitname"

	make install DESTDIR="$pkgdir"

	install -d -m755 "$pkgdir"/usr/lib/systemd/system/
	install -m644 "contrib"/fire{hol,qos}.service "$pkgdir"/usr/lib/systemd/system/

	touch "$pkgdir"/etc/firehol/fire{hol,qos}.conf

}

md5sums=('SKIP')
