# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=nats-top-git
pkgver=0.6.4.r5.g69634b1
pkgrel=1
pkgdesc="A top-like tool for monitoring NATS servers"
arch=(x86_64 aarch64 armv7h i686)
url="https://github.com/nats-io/nats-top"
license=(MIT)
depends=(glibc)
makedepends=(git go)
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
    git -C "$pkgname" describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
    cd "$pkgname"
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
    cd "$pkgname"
    go build -o build
}

check() {
    cd "$pkgname"
    go test ./...
}

package() {
    cd "$pkgname"
    install -Dm755 build/nats-top -t "$pkgdir/usr/bin/"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
