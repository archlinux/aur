# Maintainer: Laura Demkowicz-Duffy <dev at demkowiczduffy dot co dot uk>
pkgname=helix-ghost
pkgver=1.0.1
pkgrel=1
pkgdesc="Helix client for GhostText"
arch=('x86_64' 'arm64' 'i386')
url="https://github.com/rahji/helix-ghost"
license=('MIT')
depends=(glibc helix)
makedepends=(go)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('46c70349162c5ed374234716a7677fe0ea6dd01ef7089e27ea4de0a676ef6afe')

build() {
	cd "$pkgname-$pkgver"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

	go build .
}

check() {
	cd "$pkgname-$pkgver"
	go test ./...
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm0755 helix-ghost "$pkgdir/usr/bin/helix-ghost"
	install -Dm0644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
	install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
