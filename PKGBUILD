# Maintainer: DDoSolitary <DDoSolitary@gmail.com>
pkgname=go-tun2socks
pkgver=1.16.7
pkgrel=1
pkgdesc="A tun2socks implementation written in Go."
arch=(x86_64)
url=https://github.com/eycorsican/go-tun2socks
license=(MIT)
makedepends=(go)
source=(
	$pkgname-$pkgver.tar.gz::https://github.com/eycorsican/go-tun2socks/archive/v1.16.7.tar.gz
	build-flags.patch
	go-tun2socks.service
	go-tun2socks.conf
	go-tun2socks-setup
)
sha512sums=(
	3bf6f1b76b90d8fa8c75547d8659435054d2798dd97669b4cdccde72f75253baa1fb40442d82d480636a468c5b2234e5eddb4892e2e3c35069d3349f3991af16
	72a04943aa4e0cb8241c63a26d30c88cdbedf12b49f5f1c93dc97b1cb4f621c8e59736107d729f7244ab2a2c0fc926874bd19bed20e2afafabd7db8ac767e21b
	e886723a3fe098e514c22a942cef6f2eae060713b40c4c95fbd26147bf87b11ca75c15e6da44ec19ebabd4f2f39abd1f2aeb1494c235d62ee17dac63ca466adb
	3c878b5004f4aed59635d832b22199c2550abb46b4ede49221d904a37f0e1088cb976d4d73966c7d2826b5b86b352937d37824f1e76ce461eed1ca8ce9ca6521
	48866fe1daebaad2575cee74d43c74274a1a879d821d4b4aed08215dd1642e0a76f3a865d0e0ea6675c630b81f3a7d907edfa6112c957a47245da5e116f1fabc
)
gosrcdir=gopath/src/github.com/eycorsican
prepare() {
	cd "$srcdir"
	mkdir -p $gosrcdir
	ln -rTsf $pkgname-$pkgver $gosrcdir/$pkgname
	export GOPATH="$PWD/gopath"
	cd $gosrcdir/$pkgname
	patch -Np1 -i "$srcdir/build-flags.patch"
	go get -d -v ./...
}
build() {
	cd "$srcdir/$gosrcdir/$pkgname"
	make VERSION=v$pkgver
}
package() {
	cd "$srcdir"
	install -Dm755 $gosrcdir/$pkgname/build/tun2socks "$pkgdir/usr/bin/go-tun2socks"
	install -Dm644 go-tun2socks.service "$pkgdir/usr/lib/systemd/system/go-tun2socks.service"
	install -Dm644 go-tun2socks.conf "$pkgdir/etc/systemd/system/go-tun2socks.service.d/go-tun2socks.conf"
	install -Dm755 go-tun2socks-setup "$pkgdir/usr/lib/systemd/scripts/go-tun2socks-setup"
}
