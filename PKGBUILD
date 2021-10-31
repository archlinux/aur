# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=joker
pkgver=0.17.3
pkgrel=1
pkgdesc="A Clojure interpreter and linter written in Go"
arch=('x86_64')
url="https://github.com/candid82/joker"
license=('EPL')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('69147c3eec1994a20cc1dd100c5b5d780300570266ce39ea9838c6b044df95a6')

build() {
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

	cd "$pkgname-$pkgver"
	go generate ./...
	go vet ./...
	go build
}

check() {
	cd "$pkgname-$pkgver"
	go test
}

package() {
	cd "$pkgname-$pkgver"
	install -D joker -t "$pkgdir/usr/bin/"
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md DEVELOPER.md LIBRARIES.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
