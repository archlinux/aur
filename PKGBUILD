# Maintainer: Leo <i@setuid0.dev>

_rr_ver=2.7.1
_binary_ver=2.7.0
_plugins_ver=2.7.1

pkgname=roadrunner
pkgver=$_rr_ver
pkgrel=1
pkgdesc="High-performance PHP application server, load-balancer and process manager written in Golang"
arch=(x86_64)
url="https://roadrunner.dev/"
license=(MIT)
depends=("php>=7.3")
makedepends=("go>=1.16" "composer")
source=(
	"$pkgname-$_rr_ver.tar.gz::https://github.com/spiral/$pkgname/archive/v$_rr_ver.tar.gz"
	"$pkgname-binary-$_binary_ver.tar.gz::https://github.com/spiral/$pkgname-binary/archive/v$_binary_ver.tar.gz"
	"$pkgname-plugins-$_plugins_ver.tar.gz::https://github.com/spiral/$pkgname-plugins/archive/v$_plugins_ver.tar.gz"
	".rr.yaml.sample-full"
	".rr.yaml.sample-minimal"
)
sha256sums=(
	'ad6a4bbcbf5731d552f36a5b4637035199c2c570d0a1c500ee2abbc13b60347a'
	'b4b96126d5098dfb3f5adfed0e0a65cb3fb83237d7fda3af13e4fbb8c0004363'
	'2ee53609c79a0dad9409acbbdfc8fb9f6bd70c40783319304d693c5ae2026c11'
	SKIP
	SKIP
)
options=("!buildflags")

prepare() {
	export GOPATH="$srcdir"/gopath

	cd "$srcdir/$pkgname-binary-$_binary_ver"
	go mod edit -replace "github.com/spiral/roadrunner/v2=../roadrunner-$_rr_ver"
	go mod edit -replace "github.com/spiral/roadrunner-plugins/v2=../roadrunner-plugins-$_plugins_ver"
	go mod tidy
	go mod download
}

build() {
	export GOPATH="$srcdir"/gopath
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"

	cd "$srcdir/$pkgname-binary-$_binary_ver"

	CGO_ENABLED=0 go build \
		-trimpath \
		-ldflags "-s\
		 -X github.com/spiral/roadrunner-binary/v2/internal/meta.version=${_rr_ver}\
		 -X github.com/spiral/roadrunner-binary/v2/internal/meta.buildTime=$(date +%FT%T%z)" \
		-o ./rr \
		./cmd/rr
}

check() {
	cd "$srcdir/$pkgname-$_rr_ver/tests"
	composer update --prefer-dist --no-progress --ansi

	cd "$srcdir/$pkgname-$_rr_ver"
	rm -rf coverage-ci
	mkdir ./coverage-ci
	go test -race -covermode=atomic -coverprofile ./coverage.txt ./...

	cd "$srcdir/$pkgname-binary-$_binary_ver"
	go test -race -covermode=atomic -coverprofile ./coverage.txt ./...
}

package() {
	install -Dt "$pkgdir/usr/bin/" -m755 "$srcdir/$pkgname-binary-$_binary_ver/rr"
	install -Dt "$pkgdir/usr/share/$pkgname/" -m644 "$srcdir/.rr.yaml.sample-full"
	install -Dt "$pkgdir/usr/share/$pkgname/" -m644 "$srcdir/.rr.yaml.sample-minimal"
}
