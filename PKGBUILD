# Maintainer: Rob Zolkos <rob@zolkos.com>
pkgname=basecamp-cli
pkgver=0.2.0
pkgrel=1
pkgdesc="CLI for interacting with Basecamp projects and card tables"
arch=('x86_64' 'aarch64')
url="https://github.com/robzolkos/basecamp-cli"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/robzolkos/basecamp-cli/archive/v$pkgver.tar.gz")
sha256sums=('29947f58b960d05836f8a6bc7feb0d1741538014825deb0163036b19e3e0163e')
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
