# Maintainer: Leo <i@hardrain980.com>

pkgname=roadrunner
epoch=1
pkgver=2025.1.15
pkgrel=1
pkgdesc="High-performance PHP application server, process manager written in Go and powered with plugins"
arch=(x86_64)
url="https://roadrunner.dev/"
license=(MIT)
makedepends=("go>=1.26.1")
source=("roadrunner-$pkgver.tar.gz::https://github.com/roadrunner-server/roadrunner/archive/v$pkgver.tar.gz")
sha256sums=('32e0196ae551b6ad2abf50cbfc961f91e9dd4134bd177b0f7aa03dada9e41979')
options=("!buildflags")

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	go mod download
	go mod verify
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	CGO_ENABLED=0 go build \
		-trimpath \
		-ldflags "-s \
		-X github.com/roadrunner-server/roadrunner/v2025/internal/meta.version=$pkgver \
		-X github.com/roadrunner-server/roadrunner/v2025/internal/meta.buildTime=$(date +%FT%T%z)" \
		-o ./roadrunner \
		./cmd/rr
}

package() {
	install -Dm0755 "$srcdir/$pkgname-$pkgver/roadrunner" -t "$pkgdir/usr/bin/"
}
