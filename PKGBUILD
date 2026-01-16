# Maintainer: Rob Zolkos <rob@zolkos.com>
pkgname=fizzy-cli
pkgver=2.1.0
pkgrel=1
pkgdesc="CLI for managing Fizzy boards, cards, and tasks"
arch=('x86_64' 'aarch64')
url="https://github.com/robzolkos/fizzy-cli"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/robzolkos/fizzy-cli/archive/v$pkgver.tar.gz")
sha256sums=('166a18819a8f25211f6d1a75f3d872c1dedd1844e38f44b3b1a7fcd2a9105e54')
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
