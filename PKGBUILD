# Maintainer: Iván Zaera Avellón <ivan.zaera@posteo.net>
pkgname=killer-vpn
pkgver=0.2.0
pkgrel=2
pkgdesc='OpenVPN and WireGuard CLI helper'
arch=('pentium4' 'x86_64')
url='https://codeberg.org/ivan.zaera/killer-vpn'
license=('GPL-3.0-or-later')
depends=(
	'openvpn'
	'systemd'
	'ufw'
	'wireguard-tools'
)
makedepends=(
	'coreutils'
	'rust'
	'scdoc'
)
backup=(
	'etc/kvpn/config.toml'
)
install='install.sh'

source=(
	"$pkgname-$pkgver.tar.gz::https://codeberg.org/ivan.zaera/$pkgname/archive/$pkgver.tar.gz"
)
sha256sums=("579779450b9d7ebcf77ca4238f853b0841ab3093bb78311b15d4ccd0d2ba95d8")

build() {
	cd $srcdir/$pkgname
	# make clean
	make MODE=release build
}

check() {
	cd $srcdir/$pkgname
	make lint
	make test
}

package() {
	cd $srcdir/$pkgname

	cp -arv arch/root/* $pkgdir

	mkdir -p $pkgdir/usr/bin
	cp -arv rust/target/release/kvpn $pkgdir/usr/bin/kvpn

	mkdir -p $pkgdir/usr/share/man/man8
	cp -arv man/build/kvpn.8.gz $pkgdir/usr/share/man/man8

	mkdir -p $pkgdir/usr/share/bash-completion/completions
	cp -arv bash/kvpn-completion.bash $pkgdir/usr/share/bash-completion/completions/kvpn
}
