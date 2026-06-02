# Maintainer: Atila de Freitas <atiladefreitas@users.noreply.github.com>
pkgname=tical
pkgver=0.1.0
pkgrel=1
pkgdesc="Minimalist TUI calculator with mouse & keyboard control and a Tokyo Night theme"
arch=('x86_64')
url="https://github.com/atiladefreitas/tical"
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('b6232dd54a0157f8bc437a16c1f58c6bda1d1abf018a805a1216725a28989fd2')

prepare() {
	cd "$pkgname-$pkgver"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	go mod download
}

build() {
	cd "$pkgname-$pkgver"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build -o "$pkgname" .
}

check() {
	cd "$pkgname-$pkgver"
	go test ./...
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
