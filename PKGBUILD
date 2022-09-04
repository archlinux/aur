# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=joker
pkgver=1.0.1
pkgrel=1
pkgdesc="Small Clojure interpreter, linter, and formatter"
arch=('x86_64')
url="https://github.com/candid82/joker"
license=('EPL')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('ba2b050214b3eec0d9674406f46e387368b93163b306ee94c228d30ea1e21cc9')

prepare() {
	cd "$pkgname-$pkgver"
	go mod download
}

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
	go test ./...
}

package() {
	cd "$pkgname-$pkgver"
	install -D joker -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
