# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=joker
pkgver=1.7.2
pkgrel=1
pkgdesc="Small Clojure interpreter, linter, and formatter"
arch=('x86_64')
url="https://github.com/candid82/joker"
license=('EPL-1.0')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('5946755e194e44dbf4b79e35d47b4f17be03804fe6a9633f1c0a279f22183c16')

prepare() {
    export GOPATH="$srcdir"
    cd "$pkgname-$pkgver"
    go mod download -modcacherw
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
