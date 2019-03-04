# Maintainer: Jonas Große Sundrup/cherti <aur@letopolis.de>

pkgname=robustirc-bridge
pkgver=1.8
pkgrel=1
pkgdesc='Bridge to robustirc.net-IRC-Network'
arch=(i686 x86_64)
url='https://github.com/robustirc/bridge'
license=('BSD-3-clause')
makedepends=('go')
conflicts=('robustirc-bridge-git')
source=('https://github.com/robustirc/bridge/archive/v1.8.tar.gz')
sha256sums=('55a7f217e981eb4f8e157475c84c4d16b1dda57022178250b57db7b889cf904c')


prepare() {

	# get necessary dependency
	GOPATH="$srcdir" go get github.com/sorcix/irc

	# order everything into correct GOPATH=$srcdir-structure
	mkdir -p $srcdir/src/github.com/robustirc
	mv $srcdir/bridge-$pkgver $srcdir/src/github.com/robustirc/bridge

}

build() {

	cd $srcdir/src/github.com/robustirc/bridge/robustirc-bridge
	GOPATH="$srcdir" go install

}

package() {
	mkdir -p "$pkgdir/usr/bin"
	install -p -m755 "$srcdir/bin/"* "$pkgdir/usr/bin"

	mkdir -p "$pkgdir/usr/lib/systemd/system"
	install -p -m755 "$srcdir/src/github.com/robustirc/bridge/robustirc-bridge.service" "$pkgdir/usr/lib/systemd/system"


	mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 "$srcdir/src/github.com/robustirc/bridge/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	mkdir -p "$pkgdir/usr/share/man/man1"
	install -Dm644 "$srcdir/src/github.com/robustirc/bridge/robustirc-bridge.1" "$pkgdir/usr/share/man/man1"
}
