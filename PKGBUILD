# Maintainer: Rob Zolkos <rob@zolkos.com>
pkgname=rollbar-cli
pkgver=0.2.0
pkgrel=1
pkgdesc="CLI for reading and listing Rollbar items and occurrences"
arch=('x86_64' 'aarch64')
url="https://github.com/robzolkos/rollbar-cli"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/robzolkos/rollbar-cli/archive/v$pkgver.tar.gz")
sha256sums=('62534e916405cc294232a42c54c4c0edb6d87c3f178804c6eef05cab832c8534')
options=('!debug')

build() {
    cd "$pkgname-$pkgver"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    go build -ldflags "-s -w -X main.version=${pkgver}" -o rollbar ./cmd/rollbar
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 rollbar "$pkgdir/usr/bin/rollbar"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
