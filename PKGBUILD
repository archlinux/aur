# Maintainer: Gabriele Fulgaro <gabriele.fulgaro@gmail.com>
# Contributor: Sergej Pupykin
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

_pkgname="vdeplug4"
_pkgname2="vde2"

pkgname="$_pkgname-git"
pkgver=r44.7ebdc73
pkgrel=2
pkgdesc="VDE: Virtual Distributed Ethernet. Plug your VM directly to the cloud"
arch=('any')
url="https://github.com/rd235/$_pkgname"
license=('GPL2' 'LGPL' 'CUSTOM')
groups=('view-os')
depends=('s2argv-execs' 'libpcap' 'openssl')
makedepends=('python' 's2argv-execs' 'libpcap' 'openssl')
provides=("$_pkgname" "$_pkgname2")
conflicts=("$_pkgname" "$_pkgname2")
replaces=("$_pkgname2")
source=(
	"git+$url.git"
	"git+https://github.com/virtualsquare/vde-2.git"
	dhcpd.conf.sample
	iptables.rules.sample
	vde-config.sample
	vde-connection.sample
)
install=vde2.install
sha256sums=(
	'SKIP'
	'SKIP'
	'da0e2766dc63069da929c28126831ad5fdddcc4a04105a21217d78832c7ca1bc'
	'99076d7466cd99673dbe91ef83865187e7868177959b38e125df63eea957f83e'
	'5727c215646333c37b26388146cd3e6b3814b88d60d54051d7da99e00c0aef87'
	'5139110ed6d5d1174bf12971512dac5196d9d07df46dd393d7b1cd083118fe9b'
)

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "vde-2"
	autoreconf -if
	libtoolize
	autoreconf -if
	./configure --prefix=/usr --sbindir=/usr/bin --sysconfdir=/etc --libexecdir=/usr/lib/vde2 --enable-experimental
	make

	cd "../$_pkgname"
	autoreconf -i
	./configure --prefix="/usr"
	make
}

package() {
	cd "vde-2"
	make prefix="$pkgdir"/usr sysconfdir="$pkgdir"/etc sbindir="$pkgdir"/usr/bin libexecdir="$pkgdir"/usr/lib/vde2 install
	install -D -m 644 ../vde-config.sample $pkgdir/etc/vde/vde-config.sample
	install -D -m 644 ../vde-connection.sample $pkgdir/etc/vde/vde-connection.sample
	install -D -m 644 ../dhcpd.conf.sample $pkgdir/usr/share/vde2/dhcpd.conf.sample
	install -D -m 644 ../iptables.rules.sample $pkgdir/usr/share/vde2/iptables.rules.sample
	# install slirp license
	install -D -m 644 COPYING.slirpvde $pkgdir/usr/share/licenses/vde2/COPYING.slirpvde

	cd "../$_pkgname"
	make DESTDIR="$pkgdir/" install
}
