# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=darktile
pkgver=0.0.11
pkgrel=1
pkgdesc="GPU-rendered terminal emulator designed for tiling window managers"
arch=('x86_64')
url="https://github.com/liamg/darktile"
license=('MIT')
depends=('libgl' 'libx11' 'libxcursor' 'libxinerama' 'xorg-xinput')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('8e7bbd6b8ae71d1a73b13e2ea62c93fe4a4bfd108faed39b8600ba48db7767de')

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
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=vendor -modcacherw"

	cd "$pkgname-$pkgver"
	go build -o build -ldflags="-linkmode=external -X github.com/liamg/darktile/internal/app/darktile/version.Version=$pkgver" ./cmd/darktile
}

check() {
	cd "$pkgname-$pkgver"
	go test ./...
}

package() {
	cd "$pkgname-$pkgver"
	install -D "build/$pkgname" -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
