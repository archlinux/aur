# Maintainer: éclairevoyant
# Contributor: matt kasun <matt at netmaker dot io>

pkgname=netclient
pkgver=0.22.0
pkgrel=1
pkgdesc="Platform for modern, blazing fast wireguard virtual networks"
arch=(x86_64)
url='https://github.com/gravitl/netclient'
license=(Apache)
depends=(glibc)
makedepends=(go)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('55a2b3c0201c3933332d07f5618124a6fd37babadebbf37ef235104bfdd53631a573dee42b7bafa7df6c00bbfc548aa7a8a991b73b426d0194a9297bd2489260')

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
