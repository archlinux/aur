# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=drand
pkgver=2.1.0
pkgrel=1
pkgdesc="A Distributed Randomness Beacon Daemon"
arch=(x86_64)
url=https://github.com/drand/drand
license=('Apache-2.0 OR MIT')
depends=(glibc)
makedepends=(go)
source=($pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/archive/refs/tags/v$pkgver.tar.gz)
b2sums=('ab4a65baa2dd9170f53fb388ed0dc103052c352acafc2b2e593d45d4f82260dfe1b9deb806b872f4a1f4be5d60e359cbab7cf2f8aa2db14cfe5d0ac077bc95a8')

build() {
    cd $pkgname-$pkgver
    mkdir -p build
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o build ./cmd/drand
}

check() {
    cd $pkgname-$pkgver
    go test -failfast -tags conn_insecure ./...
}

package() {
    cd $pkgname-$pkgver
    install -Dm755 build/drand "$pkgdir"/usr/bin/drand
    install -Dm644 LICENSE-MIT "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
