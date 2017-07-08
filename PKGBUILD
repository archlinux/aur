# Maintainer: cherti <aur@letopolis.de>

pkgname=robustirc-bridge
pkgver=1.7.1
pkgrel=1
pkgdesc='Bridge to robustirc.net-IRC-Network'
arch=(i686 x86_64)
url='https://github.com/robustirc/bridge'
license=('BSD-3-clause')
makedepends=('go')
conflicts=('robustirc-bridge-git')
source=('https://github.com/robustirc/bridge/archive/v1.7.1.tar.gz')
sha256sums=('68cfadb639c484ed35db2b0c5d6fff85a4ad567a8e67468b758c2c0523db04d1')
md5sums=('adc494b55d83df8a580b820206f00af4')


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
