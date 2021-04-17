# Maintainer: Leo <i@setuid0.dev>

pkgname=roadrunner
pkgver=2.0.4
pkgrel=4
pkgdesc="High-performance PHP application server, load-balancer and process manager written in Golang"
arch=(x86_64)
url="https://roadrunner.dev/"
license=(MIT)
depends=()
makedepends=("go>=1.16")
source=(
	"$pkgname-binary-$pkgver.tar.gz::https://github.com/spiral/$pkgname-binary/archive/v$pkgver.tar.gz"
	"$pkgname-$pkgver.tar.gz::https://github.com/spiral/$pkgname/archive/v$pkgver.tar.gz"
	".rr.yaml.sample-full"
	".rr.yaml.sample-minimal"
)
sha256sums=(
	"2625a698a7a6f2ada05ca1333066923eca1cf1503ceb1e045138adb2d12561cf"
	"14ab387b378fd7909f5dc6e8be22442ca14fb5353ae1ef55ab70dea0381a5fd3"
	SKIP
	SKIP
)
options=("!buildflags")

prepare() {
	export GOPATH="$srcdir"/gopath

	cd "$srcdir/$pkgname-binary-$pkgver"
	go mod edit -replace "github.com/spiral/roadrunner/v2=../roadrunner-$pkgver"
	go mod download
}

build() {
	export GOPATH="$srcdir"/gopath
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"

	cd "$srcdir/$pkgname-binary-$pkgver"

	CGO_ENABLED=0 go build \
		-trimpath \
		-ldflags "-s\
		 -X github.com/spiral/roadrunner-binary/v2/internal/meta.version=${pkgver}\
		 -X github.com/spiral/roadrunner-binary/v2/internal/meta.buildTime=$(date +%FT%T%z)" \
		-o ./rr \
		./cmd/rr
}

check() {
	cd "$srcdir/$pkgname-binary-$pkgver"

	go test -race -covermode=atomic -coverprofile ./coverage.txt ./...
}

package() {
	install -Dt "$pkgdir/usr/bin/" -m755 "$srcdir/$pkgname-binary-$pkgver/rr"
	install -Dt "$pkgdir/usr/share/$pkgname/" -m644 "$srcdir/.rr.yaml.sample-full"
	install -Dt "$pkgdir/usr/share/$pkgname/" -m644 "$srcdir/.rr.yaml.sample-minimal"
}
