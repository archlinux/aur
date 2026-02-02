# Maintainer: Rob Zolkos <rob@zolkos.com>
pkgname=appsignal-cli
pkgver=0.2.0
pkgrel=1
pkgdesc="CLI for AppSignal error monitoring"
arch=('x86_64' 'aarch64')
url="https://github.com/robzolkos/appsignal-cli"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/robzolkos/appsignal-cli/archive/v$pkgver.tar.gz")
sha256sums=('382ff78558aaa5031e14940957c25bd9a4a1fb1efd56e97f3b6159e4c2531c32')
options=('!debug')

build() {
    cd "$pkgname-$pkgver"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    go build -ldflags "-s -w -X main.version=${pkgver}" -o appsignal-cli ./cmd/appsignal
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 appsignal-cli "$pkgdir/usr/bin/appsignal-cli"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
