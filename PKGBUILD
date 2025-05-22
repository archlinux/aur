# Maintainer: éclairevoyant
# Contributor: matt kasun <matt at netmaker dot io>

pkgname=netclient
pkgver=0.90.0
pkgrel=1
pkgdesc="Platform for modern, blazing fast wireguard virtual networks"
arch=(x86_64)
url='https://github.com/gravitl/netclient'
license=(Apache)
depends=(glibc)
makedepends=(go)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('89d7fb05b5c0dc30a6631731cf031df46db638d94cef1615f4ea4a9b32e063c2e26f3ddd403e2c5116f39836c6e1d13f2070e4355b1afad5752bd18e6cd18e39')

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
