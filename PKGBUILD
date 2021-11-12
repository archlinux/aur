# Maintainer: Leo <i@setuid0.dev>

pkgname=roadrunner
pkgver=2.5.6
_rr_ver=2.5.3
pkgrel=1
pkgdesc="High-performance PHP application server, load-balancer and process manager written in Golang"
arch=(x86_64)
url="https://roadrunner.dev/"
license=(MIT)
depends=("php>=7.3")
makedepends=("go>=1.16")
source=(
	"$pkgname-$_rr_ver.tar.gz::https://github.com/spiral/$pkgname/archive/v$_rr_ver.tar.gz"
	"$pkgname-binary-$pkgver.tar.gz::https://github.com/spiral/$pkgname-binary/archive/v$pkgver.tar.gz"
	".rr.yaml.sample-full"
	".rr.yaml.sample-minimal"
)
sha256sums=(
	'f78277368caa00b3fd37589887a16390d41021e15d98946ef45b94f818c3c744'
	'e60db5dac809bbc5225db82184190ba006f49fdc517e5b4203063ba9249b595a'
	SKIP
	SKIP
)
options=("!buildflags")

prepare() {
	export GOPATH="$srcdir"/gopath

	cd "$srcdir/$pkgname-binary-$pkgver"
	go mod edit -replace "github.com/spiral/roadrunner/v2=../roadrunner-$_rr_ver"
	go mod tidy
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
