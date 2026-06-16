# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Ray Del Rosario <michael@raydelrosario.com>

pkgname=litmusctl
pkgver=1.26.0
pkgrel=1
pkgdesc="CLI tool to manage litmuschaos's agent plane"
url=https://github.com/litmuschaos/litmusctl
arch=(x86_64 aarch64)
license=(Apache-2.0)
makedepends=(go)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('6f38b7d186dbf2553bef95756fc70a994ed7b30c5a844c71ddea7124402234c3')

prepare() {
    export GOPATH="$srcdir"
    cd "$pkgname-$pkgver"
    mkdir -p build
    go mod download -modcacherw
}

build() {
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    cd "$pkgname-$pkgver"
    go build -o build -ldflags="-linkmode=external -X main.CLIVersion=$pkgver"
}

check() {
    cd "$pkgname-$pkgver"
    go test ./...
}

package() {
    depends=(kubectl)
    cd "$pkgname-$pkgver"
    install -D "build/$pkgname" -t "$pkgdir/usr/bin/"
    install -Dm644 Usage_0.23.0.md "$pkgdir/usr/share/doc/$pkgname/USAGE.md"
    install -Dm644 Usage_interactive.md "$pkgdir/usr/share/doc/$pkgname/USAGE_INTERACTIVE.md"
}
