# Maintainer: Brian Thompson <brianrobt at pm.me>
# Contributor: éclairevoyant
# Contributor: matt kasun <matt at netmaker dot io>

pkgname=netclient
pkgver=1.1.0
pkgrel=1
pkgdesc="Platform for modern, blazing fast wireguard virtual networks"
arch=(x86_64)
url='https://github.com/gravitl/netclient'
license=(Apache)
depends=(glibc)
makedepends=(go)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('528475ff3eb08fc61fe330a6fee89e099e3e0de81ae0f1a6056f1cc16e69d4a5e2bda4f32da287f4755088f4f3cd86774ccb7b82c49c72a4b2e2d09604e7ca71')

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