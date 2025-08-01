# Maintainer: Keiran <keiran@keircn.com>
pkgname=prefine
pkgver=0.2.0
pkgrel=1
pkgdesc="CLI tool designed to optimize various file types commonly found in web development projects"
arch=('x86_64')
url="https://github.com/priory-io/prefine"
license=('MIT')
depends=()
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$pkgname-$pkgver"
    
    export CGO_ENABLED=0
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external"
    export GOPATH="$srcdir/gopath"
    export GO111MODULE=on
    
    go mod download
    go build -ldflags="-w -s -X 'github.com/priory-io/prefine/cmd.Version=v$pkgver'" -o build/$pkgname ./cmd/prefine
}

check() {
    cd "$pkgname-$pkgver"
}

package() {
    cd "$pkgname-$pkgver"
    
    install -Dm755 "build/$pkgname" "$pkgdir/usr/bin/$pkgname"
    
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

