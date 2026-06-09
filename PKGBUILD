# Maintainer: maxischmaxi <max@jeschek.dev>
pkgname=browser-proxy
pkgver=1.3.0
pkgrel=1
pkgdesc='Registers as your system default browser and routes every URL to the browser of your choice via TOML rules'
arch=('x86_64' 'aarch64')
url='https://github.com/maxischmaxi/browser-proxy'
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4a88aca1294f3cd6d3eafcab547c631e4eb5e0f2d956166a04f07751230ac003')

build() {
	cd "$pkgname-$pkgver"
	# Pure-Go build (no cgo on Linux); version string matches the release tag.
	export CGO_ENABLED=0
	export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'
	go build -ldflags="-s -w -X main.Version=v$pkgver" -o "$pkgname" ./cmd/browser-proxy
}

check() {
	cd "$pkgname-$pkgver"
	export CGO_ENABLED=0
	go test ./...
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
