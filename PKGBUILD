# Maintainer: OminduD <omindudulneth@outlook.com>
pkgname=arch-sandbox
pkgver=1.0.0
pkgrel=1
pkgdesc="CLI tool to create isolated Arch Linux sandboxes"
arch=('x86_64')
url="https://github.com/OminduD/arch-sandbox"
license=('MIT')
depends=('systemd' 'zstd')
makedepends=('go' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/OminduD/arch-sandbox/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9073feb2828eed0e9973868e16e8c0c37e976b47282baed86a46b78c50de3ae4')

prepare() {
    cd "$pkgname-$pkgver"
    export GOPATH="$srcdir/gopath"
    mkdir -p "$GOPATH"
    go mod init github.com/OminduD/arch-sandbox 2>/dev/null || true
    go mod tidy
    go mod vendor
}

build() {
    cd "$pkgname-$pkgver"
    export GOPATH="$srcdir/gopath"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o "$pkgname" .
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}