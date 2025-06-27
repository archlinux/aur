# Maintainer: Brian Thompson <brianrobt at pm.me>
# Contributor: éclairevoyant
# Contributor: matt kasun <matt at netmaker dot io>

pkgname=netclient
pkgver=1.0.0
pkgrel=1
pkgdesc="Platform for modern, blazing fast wireguard virtual networks"
arch=(x86_64)
url='https://github.com/gravitl/netclient'
license=(Apache)
depends=(glibc)
makedepends=(go)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('9626cdc0daa565b7c55a2e59d040dd19bd609463e845b066b7416cc63957401a0466045f178848e428e6c825b136bcd763b5d983371e875e4e92e703a2e88200')

build() {
	cd $pkgname-$pkgver
	CGO_ENABLED=0

	go build \
		-trimpath \
		-buildmode=pie \
		-mod=readonly \
		-modcacherw \
		-ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
		-tags headless \
		.
}

package() {
	cd $pkgname-$pkgver
	install -Dm755 netclient -t "$pkgdir/usr/bin/"
	install -Dm644 build/netclient.service -t "$pkgdir/usr/lib/systemd/system/"
}