# Maintainer: Leo <i@setuid0.dev>

pkgname=roadrunner
binname=${pkgname}-binary
pkgver=2.0.1
pkgrel=1
pkgdesc="High-performance PHP application server, load-balancer and process manager written in Golang"
arch=(x86_64)
url="https://roadrunner.dev/"
license=(MIT)
depends=("php>=7.3")
makedepends=("go>=1.16")
source=(
	"$binname-$pkgver.tar.gz::https://github.com/spiral/$binname/archive/v$pkgver.tar.gz"
	"$pkgname-$pkgver.tar.gz::https://github.com/spiral/$pkgname/archive/v$pkgver.tar.gz"
	".rr.yaml.sample-full"
	".rr.yaml.sample-minimal"
	"00-worker-log-level-info.patch"
)
sha256sums=(
	"7b002d60eeebd795a4e7f0c3fa4ac0b8a043ef3fbf3153727a4ce9833ce0141e"
	"6c3d10071548a693be1999b52617ab11ab55e3a6d05db25ee9aeea033afbfd4f"
	SKIP
	SKIP
	SKIP
)
options=("!buildflags")

prepare() {
	export GOPATH="$srcdir"/gopath

	cd "$srcdir/$pkgname-$pkgver"
	patch -p1 < "$srcdir/00-worker-log-level-info.patch"

	cd "$srcdir/$binname-$pkgver"
	go mod edit -replace "github.com/spiral/roadrunner/v2=../roadrunner-$pkgver"
	go mod download
}

build() {
	export GOPATH="$srcdir"/gopath
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"

	cd "$srcdir/$binname-$pkgver"

	CGO_ENABLED=0 go build \
		-trimpath \
		-ldflags "-s\
		 -X github.com/spiral/roadrunner-binary/v2/cli.Version=${pkgver}\
		 -X github.com/spiral/roadrunner-binary/v2/cli.BuildTime=$(date +%FT%T%z)" \
		-o ./rr \
		./main.go
}

package() {
	install -Dt "$pkgdir/usr/bin/" -m755 "$srcdir/$binname-$pkgver/rr"
	install -Dt "$pkgdir/usr/share/$pkgname/" -m644 "$srcdir/.rr.yaml.sample-full"
	install -Dt "$pkgdir/usr/share/$pkgname/" -m644 "$srcdir/.rr.yaml.sample-minimal"
}
