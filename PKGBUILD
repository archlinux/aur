# Maintainer: Leo <i@setuid0.dev>

pkgname=roadrunner
_dirname=${pkgname}-binary
pkgver=2.0.0
pkgrel=1
pkgdesc="High-performance PHP application server, load-balancer and process manager written in Golang"
arch=(x86_64)
url="https://roadrunner.dev/"
license=(MIT)
depends=("php>=7.3")
makedepends=("go>=1.13")
source=(
	"https://github.com/spiral/$_dirname/archive/v$pkgver.tar.gz"
	".rr.yaml.sample-full"
	".rr.yaml.sample-minimal"
)
sha256sums=(
	"2faf5e5176aefcddf15c6ee66a73e182b51edf4aad50ff53155a83b786b5e216"
	SKIP
	SKIP
)
options=("!buildflags")

prepare() {
	export GOPATH="$srcdir"/gopath
	cd "$_dirname-$pkgver"
	go mod download
}

build() {
	export GOPATH="$srcdir"/gopath
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	cd "$_dirname-$pkgver"
	CGO_ENABLED=0 go build \
		-trimpath \
		-ldflags "-s\
		 -X github.com/spiral/roadrunner-binary/v2/cli.Version=${pkgver}\
		 -X github.com/spiral/roadrunner-binary/v2/cli.BuildTime=$(date +%FT%T%z)" \
		-o ./rr \
		./main.go
}

package() {
	cd "$_dirname-$pkgver"
	install -Dt "$pkgdir/usr/bin/" -m755 rr
	install -Dt "$pkgdir/usr/share/$pkgname/" -m644 "$srcdir/.rr.yaml.sample-full"
	install -Dt "$pkgdir/usr/share/$pkgname/" -m644 "$srcdir/.rr.yaml.sample-minimal"
}
