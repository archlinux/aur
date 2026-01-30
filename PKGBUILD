# Maintainer: Rob Zolkos <rob@zolkos.com>
pkgname=basecamp-cli
pkgver=0.1.0
pkgrel=1
pkgdesc="CLI for interacting with Basecamp projects and card tables"
arch=('x86_64' 'aarch64')
url="https://github.com/robzolkos/basecamp-cli"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/robzolkos/basecamp-cli/archive/v$pkgver.tar.gz")
sha256sums=('a808ce705539464e826eb01c194e503e7a344be197f8487d5b5d5579f65c01f7')
options=('!debug')

build() {
    cd "$pkgname-$pkgver"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    go build -ldflags "-s -w -X main.version=${pkgver}" -o basecamp ./cmd/basecamp
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 basecamp "$pkgdir/usr/bin/basecamp"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
