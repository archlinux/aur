# Maintainer: Leo <i@setuid0.dev>

pkgname=roadrunner
epoch=1
pkgver=2023.3.7
pkgrel=1
pkgdesc="High-performance PHP application server, load-balancer and process manager written in Golang"
arch=(x86_64)
url="https://roadrunner.dev/"
license=(MIT)
depends=()
makedepends=("go>=1.21")
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/spiral/$pkgname/archive/v$pkgver.tar.gz"
	"rr.full.sample.yaml"
	"rr.minimal.sample.yaml"
)
sha256sums=(
	'd966ce578287b555658b85d7a0850afae831cc1d0170fd76762154a074a2a38d'
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
		 -X github.com/roadrunner-server/roadrunner/v2023/internal/meta.version=${pkgver}\
		 -X github.com/roadrunner-server/roadrunner/v2023/internal/meta.buildTime=$(date +%FT%T%z)" \
		-o ./roadrunner \
		./cmd/rr
}

check() {
	export GOPATH="$srcdir"/gopath

	cd "$srcdir/$pkgname-$pkgver"
	go test -race -covermode=atomic -coverprofile ./coverage.txt ./...
}

package() {
	install -Dt "$pkgdir/usr/bin/" -m755 "$srcdir/$pkgname-$pkgver/roadrunner"
	install -Dt "$pkgdir/usr/share/$pkgname/" -m644 "$srcdir/rr.minimal.sample.yaml"
	install -Dt "$pkgdir/usr/share/$pkgname/" -m644 "$srcdir/rr.full.sample.yaml"
}
