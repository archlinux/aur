# Maintainer: Leo <i@setuid0.dev>

pkgname=roadrunner
binname=${pkgname}-binary
pkgver=2.0.0
pkgrel=2
pkgdesc="High-performance PHP application server, load-balancer and process manager written in Golang"
arch=(x86_64)
url="https://roadrunner.dev/"
license=(MIT)
depends=("php>=7.3")
makedepends=("go>=1.13")
source=(
	"$binname-$pkgver.tar.gz::https://github.com/spiral/$binname/archive/v$pkgver.tar.gz"
	"$pkgname-$pkgver.tar.gz::https://github.com/spiral/$pkgname/archive/v$pkgver.tar.gz"
	".rr.yaml.sample-full"
	".rr.yaml.sample-minimal"
	"00-worker-log-level-info.patch"
)
sha256sums=(
	"2faf5e5176aefcddf15c6ee66a73e182b51edf4aad50ff53155a83b786b5e216"
	"c6dd45569d3d395927d58ffafca7165f417fdc297787e9135c2149344242918e"
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
