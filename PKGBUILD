# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=nats-top
pkgver=0.6.5
pkgrel=1
pkgdesc="A top-like tool for monitoring NATS servers"
arch=(x86_64 aarch64 armv7h i686)
url="https://github.com/nats-io/nats-top"
license=(MIT)
depends=(glibc)
makedepends=(go)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('b33a090f1531d58c99659c735e78161231e323df675bdf710c02ab3514bfe1e7')

prepare() {
    cd "$pkgname-$pkgver"
    export GOPATH="$srcdir"
    go mod download -modcacherw
    mkdir -p build
}

build() {
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    cd "$pkgname-$pkgver"
    go build -o build
}

check() {
    cd "$pkgname-$pkgver"
    go test ./...
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 build/nats-top -t "$pkgdir/usr/bin/"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
