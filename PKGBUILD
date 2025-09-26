# Maintainer: Zorbatron <46525467+Zorbatron@users.noreply.github.com> 
# Contributor: Gabriele Fulgaro <gabriele.fulgaro@gmail.com>
# Contributor: Sergej Pupykin
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

_pkgname="vdeplug4"
pkgname="$_pkgname-git"
pkgver=v4.0.1.r12.a595069
pkgrel=2

pkgdesc="VDE: Virtual Distributed Ethernet. Plug your VM directly to the cloud"
arch=('any')
url="https://github.com/rd235/$_pkgname"
license=('GPL2' 'LGPL' 'custom:BSD')
groups=('virtualsquare')
depends=('s2argv-execs' 'libpcap' 'python' 'wolfssl')
makedepends=('git' 'cmake')
provides=("$_pkgname" 'vde2')
conflicts=("$_pkgname" 'vde2')
source=(
	"git+$url.git"
	dhcpd.conf.sample
	iptables.rules.sample
	vde-config.sample
	vde-connection.sample
)
install=vde2.install
options=(!makeflags)
sha256sums=(
	'SKIP'
	'da0e2766dc63069da929c28126831ad5fdddcc4a04105a21217d78832c7ca1bc'
	'99076d7466cd99673dbe91ef83865187e7868177959b38e125df63eea957f83e'
	'5727c215646333c37b26388146cd3e6b3814b88d60d54051d7da99e00c0aef87'
	'5139110ed6d5d1174bf12971512dac5196d9d07df46dd393d7b1cd083118fe9b'
)

pkgver() {
	git -C $_pkgname describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
	cd $srcdir/$_pkgname
	mkdir -p build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr ..
	make -j $(nproc)
}

package() {
	cd "$srcdir"

	install -D -m 644 ../vde-config.sample $pkgdir/etc/vde/vde-config.sample
	install -D -m 644 ../vde-connection.sample $pkgdir/etc/vde/vde-connection.sample
	install -D -m 644 ../dhcpd.conf.sample $pkgdir/usr/share/vde2/dhcpd.conf.sample
	install -D -m 644 ../iptables.rules.sample $pkgdir/usr/share/vde2/iptables.rules.sample

	cd "$_pkgname/build"
	make DESTDIR="$pkgdir/" install

	cd "$pkgdir/usr/lib"
	ln -s libvdeplug.so.4.0.0 libvdeplug.so.3
	ln -s libvdeplug_mod.so.4.0.0 libvdeplug_mod.so.3
}
