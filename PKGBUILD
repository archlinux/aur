# Maintainer: Leo <i@setuid0.dev>

pkgname=roadrunner
pkgver=1.8.3
pkgrel=1
pkgdesc="High-performance PHP application server, load-balancer and process manager written in Golang"
arch=(x86_64)
url="https://roadrunner.dev/"
license=(MIT)
depends=("php>=7.1")
makedepends=("go>=1.13")
source=(
	"https://github.com/spiral/$pkgname/archive/v$pkgver.tar.gz"
	".rr.yaml.sample-full"
	".rr.yaml.sample-minimal"
)
sha256sums=(
	"0438537fab3f20de1225a586715533863f3fe0618c2955efacc93a2228bec463"
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
