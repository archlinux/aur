# Maintainer: Leo <i@setuid0.dev>

pkgname=roadrunner
pkgver=1.9.0
pkgrel=1
pkgdesc="High-performance PHP application server, load-balancer and process manager written in Golang"
arch=(x86_64)
url="https://roadrunner.dev/"
license=(MIT)
depends=("php>=7.3")
makedepends=("go>=1.13")
source=(
	"https://github.com/spiral/$pkgname/archive/v$pkgver.tar.gz"
	".rr.yaml.sample-full"
	".rr.yaml.sample-minimal"
)
sha256sums=(
	"ee306cce2132c8f0b0dbd3a085084194f7c8659ae50a87ea06c160d4f2c716c4"
	SKIP
	SKIP
)
options=("!buildflags")

build() {
	export GOPATH="$srcdir"/gopath
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	cd "$pkgname-$pkgver"
	go mod download -x
	make
}

check() {
	export GOPATH="$srcdir"/gopath
	cd "$pkgname-$pkgver"
	make test
}

package() {
	cd "$pkgname-$pkgver"
	install -Dt "$pkgdir/usr/bin/" -m755 rr
	install -Dt "$pkgdir/usr/share/$pkgname/" -m644 "$srcdir/.rr.yaml.sample-full"
	install -Dt "$pkgdir/usr/share/$pkgname/" -m644 "$srcdir/.rr.yaml.sample-minimal"
}
