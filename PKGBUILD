# Maintainer: Leo <i@setuid0.dev>

_rr_ver=2.6.0
_binary_ver=2.6.1
_plugins_ver=2.6.1

pkgname=roadrunner
pkgver=$_rr_ver
pkgrel=2
pkgdesc="High-performance PHP application server, load-balancer and process manager written in Golang"
arch=(x86_64)
url="https://roadrunner.dev/"
license=(MIT)
depends=("php>=7.3")
makedepends=("go>=1.16" "composer")
source=(
	"$pkgname-$_rr_ver.tar.gz::https://github.com/spiral/$pkgname/archive/v$_rr_ver.tar.gz"
	"$pkgname-binary-$_binary_ver.tar.gz::https://github.com/spiral/$pkgname-binary/archive/v$_binary_ver.tar.gz"
	"$pkgname-plugins-$_plugins_ver.tar.gz::https://github.com/spiral/$pkgname-plugins/archive/v$_binary_ver.tar.gz"
	".rr.yaml.sample-full"
	".rr.yaml.sample-minimal"
)
sha256sums=(
	'dd6a42513252480e749b45fb99b118cfdc01be1ff393820f954c236227ffd191'
	'74882ab87a96a452595469297a0bdcaa5c4e39a943a93af2140c7224501b3b76'
	'97490ee73fc86e227dbc3217642109255e114e64c1a2323e37a7282b2a79677b'
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
