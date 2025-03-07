# Maintainer: Leo <i@setuid0.dev>

pkgname=roadrunner
epoch=1
pkgver=2024.3.5
pkgrel=1
pkgdesc="High-performance PHP application server, load-balancer and process manager"
arch=(x86_64)
url="https://roadrunner.dev/"
license=(MIT)
depends=()
makedepends=("go>=1.24")
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/spiral/$pkgname/archive/v$pkgver.tar.gz"
	'rr.full.sample.yaml'
	'rr.minimal.sample.yaml'
)
sha256sums=(
	'77feb394b0ca622b18bc2933edb275c6f4b7e9effc04926e6d1ad2949780da50'
	'SKIP'
	'SKIP'
)
options=("!buildflags")

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	go mod download
	go mod verify
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	CGO_ENABLED=0 go build \
		-trimpath \
		-ldflags "-s\
		 -X github.com/roadrunner-server/roadrunner/v2024/internal/meta.version=${pkgver}\
		 -X github.com/roadrunner-server/roadrunner/v2024/internal/meta.buildTime=$(date +%FT%T%z)" \
		-o ./roadrunner \
		./cmd/rr
}

package() {
	install -Dt "$pkgdir/usr/bin/" -m755 "$srcdir/$pkgname-$pkgver/roadrunner"
	install -Dt "$pkgdir/usr/share/$pkgname/" -m644 "$srcdir/rr.minimal.sample.yaml"
	install -Dt "$pkgdir/usr/share/$pkgname/" -m644 "$srcdir/rr.full.sample.yaml"
}
