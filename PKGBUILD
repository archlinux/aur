# Maintainer: Rob Zolkos <rob@zolkos.com>
pkgname=fizzy-cli
pkgver=2.0.1
pkgrel=1
pkgdesc="CLI for managing Fizzy boards, cards, and tasks"
arch=('x86_64' 'aarch64')
url="https://github.com/robzolkos/fizzy-cli"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/robzolkos/fizzy-cli/archive/v$pkgver.tar.gz")
sha256sums=('4bf5d2b1301844b70736f4b47973c6edb2270dfd86207ff031830cd4b0e42744')

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
