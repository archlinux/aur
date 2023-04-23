# Maintainer: Leo <i@setuid0.dev>

pkgname=roadrunner
epoch=1
pkgver=2023.1.1
pkgrel=1
pkgdesc="High-performance PHP application server, load-balancer and process manager written in Golang"
arch=(x86_64)
url="https://roadrunner.dev/"
license=(MIT)
depends=("php>=7.4")
makedepends=("go>=1.20")
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/spiral/$pkgname/archive/v$pkgver.tar.gz"
	"rr.full.sample.yaml"
	"rr.minimal.sample.yaml"
)
sha256sums=(
	'8a90d7d4520297e6480a422197a2f6b0a68a8131e6b4232c8ea34c2b2c6f279d'
	SKIP
	SKIP
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
