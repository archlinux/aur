# Maintainer: Rob Zolkos <rob@zolkos.com>
pkgname=appsignal-cli
pkgver=0.1.0
pkgrel=1
pkgdesc="CLI for AppSignal error monitoring"
arch=('x86_64' 'aarch64')
url="https://github.com/robzolkos/appsignal-cli"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/robzolkos/appsignal-cli/archive/v$pkgver.tar.gz")
sha256sums=('273a09abdb53be0e1949dd959fd3532cb3d58ad5c9054b3316d87df2481924ad')
options=('!debug')

build() {
    cd "$pkgname-$pkgver"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    go build -ldflags "-s -w -X main.version=${pkgver}" -o appsignal ./cmd/appsignal
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 appsignal "$pkgdir/usr/bin/appsignal"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
