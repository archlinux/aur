# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=joker
pkgver=0.17.2
pkgrel=1
pkgdesc="A Clojure interpreter and linter written in Go"
arch=('x86_64')
url="https://github.com/candid82/joker"
license=('EPL')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('f965aeafb51cc6138506bd7a09b360b5834c2750aaaf37c280643e9edbfa7a3a')

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
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

	cd "$pkgname-$pkgver"
	go test
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm 755 joker -t "$pkgdir/usr/bin/"
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md DEVELOPER.md LIBRARIES.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
