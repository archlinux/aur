# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=darktile
pkgver=0.0.10
pkgrel=1
pkgdesc="A GPU-rendered terminal emulator designed for tiling window managers"
arch=('x86_64')
url="https://github.com/liamg/darktile"
license=('MIT')
depends=('libgl' 'libx11' 'libxcursor' 'libxinerama' 'xorg-xinput')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('781aef00959abc0047df0eb627c73f012a709f23c2642c34b7a282f485d6e19c')

prepare() {
	cd "$pkgname-$pkgver"
	mkdir -p build
}

build() {
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

	cd "$pkgname-$pkgver"
	go build -o build -ldflags="-linkmode=external -X github.com/liamg/darktile/internal/app/darktile/version.Version=$pkgver" ./cmd/darktile
}

check() {
	cd "$pkgname-$pkgver"
	go test ./...
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm 755 build/darktile -t "$pkgdir/usr/bin/"
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
