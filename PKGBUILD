# Maintainer: Atila de Freitas <atiladefreitas@users.noreply.github.com>
pkgname=tical
pkgver=0.2.1
pkgrel=1
pkgdesc="Minimalist TUI calculator with mouse & keyboard control and a Tokyo Night theme"
arch=('x86_64')
url="https://github.com/atiladefreitas/tical"
license=('MIT')
makedepends=('go')
optdepends=(
	'wl-clipboard: copy results to the clipboard on Wayland'
	'xclip: copy results to the clipboard on Xorg'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('b2f54022cd841dd32aae6ac9b5f999ff9418b523edc653fb3d2ba0e2b01c4c2c')

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
