# Maintainer: Leo <i@setuid0.dev>

_bin_ver=2.6.0
_rr_ver=2.6.0

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
	"$pkgname-binary-$_bin_ver.tar.gz::https://github.com/spiral/$pkgname-binary/archive/v$_bin_ver.tar.gz"
	".rr.yaml.sample-full"
	".rr.yaml.sample-minimal"
)
sha256sums=(
	'dd6a42513252480e749b45fb99b118cfdc01be1ff393820f954c236227ffd191'
	'a951f9e6a5fd56d0003e2ae72c8dffa5c862378efa98dc1419d0737f510e7e68'
	SKIP
	SKIP
)
options=("!buildflags")

prepare() {
	export GOPATH="$srcdir"/gopath

	cd "$srcdir/$pkgname-binary-$_bin_ver"
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

	cd "$srcdir/$pkgname-binary-$_bin_ver"

	CGO_ENABLED=0 go build \
		-trimpath \
		-ldflags "-s\
		 -X github.com/spiral/roadrunner-binary/v2/internal/meta.version=${_bin_ver}\
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

	cd "$srcdir/$pkgname-binary-$_bin_ver"
	go test -race -covermode=atomic -coverprofile ./coverage.txt ./...
}

package() {
	install -Dt "$pkgdir/usr/bin/" -m755 "$srcdir/$pkgname-binary-$_bin_ver/rr"
	install -Dt "$pkgdir/usr/share/$pkgname/" -m644 "$srcdir/.rr.yaml.sample-full"
	install -Dt "$pkgdir/usr/share/$pkgname/" -m644 "$srcdir/.rr.yaml.sample-minimal"
}
