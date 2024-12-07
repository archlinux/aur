# Maintainer: Leo <i@setuid0.dev>

pkgname=roadrunner
epoch=1
pkgver=2024.3.0
pkgrel=1
pkgdesc="High-performance PHP application server, load-balancer and process manager"
arch=(x86_64)
url="https://roadrunner.dev/"
license=(MIT)
depends=()
makedepends=("go>=1.23")
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/spiral/$pkgname/archive/v$pkgver.tar.gz"
	"rr.full.sample.yaml"
	"rr.minimal.sample.yaml"
)
sha256sums=(
	'f60af569fb262cafe2a9ca4f04ebf6b956a387a689b70f920a9592a83d23005e'
	'SKIP'
	'SKIP'
)
options=("!buildflags")

prepare() {
	export GOPATH="$srcdir"/gopath

	cd "$srcdir/$pkgname-$pkgver"
	go mod download
	go mod verify
}

build() {
	export GOPATH="$srcdir"/gopath
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"

	cd "$srcdir/$pkgname-$pkgver"

	CGO_ENABLED=0 go build \
		-trimpath \
		-ldflags "-s\
		 -X github.com/roadrunner-server/roadrunner/v2024/internal/meta.version=${pkgver}\
		 -X github.com/roadrunner-server/roadrunner/v2024/internal/meta.buildTime=$(date +%FT%T%z)" \
		-o ./roadrunner \
		./cmd/rr
}

package() {
	install -Dt "$pkgdir/usr/bin/" -m755 "$srcdir/$pkgname-$pkgver/roadrunner"
	install -Dt "$pkgdir/usr/share/$pkgname/" -m644 "$srcdir/rr.minimal.sample.yaml"
	install -Dt "$pkgdir/usr/share/$pkgname/" -m644 "$srcdir/rr.full.sample.yaml"
}
