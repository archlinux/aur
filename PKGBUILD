# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=joker
pkgver=1.10.0
pkgrel=1
pkgdesc="Small Clojure interpreter, linter, and formatter"
arch=('x86_64' 'aarch64')
url="https://github.com/candid82/joker"
license=('EPL-1.0')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('cdb2878f1a6b46fe0ed54dc4296dfae0e4ac9a3fa1b7e842e12b8b5b703f3949')

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
