# Maintainer: Rob Zolkos <rob@zolkos.com>
pkgname=fizzy-cli
pkgver=2.0.8
pkgrel=1
pkgdesc="CLI for managing Fizzy boards, cards, and tasks"
arch=('x86_64' 'aarch64')
url="https://github.com/robzolkos/fizzy-cli"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/robzolkos/fizzy-cli/archive/v$pkgver.tar.gz")
sha256sums=('dab35d822916f0cb59dabee8ab89e4a8b5d547cc1e28a3bf5879b59ff11871f0')
options=('!debug')

build() {
    cd "$pkgname-$pkgver"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    go build -ldflags "-s -w -X main.version=${pkgver}" -o fizzy ./cmd/fizzy
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 fizzy "$pkgdir/usr/bin/fizzy"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
