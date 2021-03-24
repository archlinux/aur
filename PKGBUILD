# Maintainer: Leo <i@setuid0.dev>

pkgname=roadrunner
binname=${pkgname}-binary
pkgver=2.0.2
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
	"03-rr-log-output.patch"
	"03-rr-binary-log-output.patch"
)
sha256sums=(
	"2954b1378757598f2e3ce819f91892a5c89837a5a08107fdd6f81effcba947e6"
	"fa88e2c87966df507a2d53d5199c8e27e3ea4bfcc5d9267e21d96fe025f7da15"
	SKIP
	SKIP
	SKIP
	SKIP
	SKIP
)
options=("!buildflags")

prepare() {
	export GOPATH="$srcdir"/gopath

	cd "$srcdir/$pkgname-$pkgver"
	patch -p1 < "$srcdir/00-worker-log-level-info.patch"
	patch -p1 < "$srcdir/03-rr-log-output.patch"

	cd "$srcdir/$binname-$pkgver"
	patch -p1 <"$srcdir/03-rr-binary-log-output.patch"
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
