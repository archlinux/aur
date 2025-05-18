# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname=fingerprintx
pkgver=1.1.15
pkgrel=2
pkgdesc="Standalone utility for service discovery on open ports!"
arch=('x86_64')
url="https://github.com/praetorian-inc/fingerprintx"
license=('Apache-2.0')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('5dc1e112b57e38ca60d87f3ecc8c9c0956a1cfebcb9a57272d1f2d8a13e78748')

prepare() {
	cd "$pkgname-$pkgver"
	mkdir -p build
	go mod download
}

build() {
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

	cd "$pkgname-$pkgver"
	go build -v -o build "./cmd/$pkgname"
}

package() {
	cd "$pkgname-$pkgver"
	install -vDm755 -t "$pkgdir/usr/bin" "build/$pkgname"
}
