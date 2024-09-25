# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=drand
pkgver=2.0.4
pkgrel=2
pkgdesc="A Distributed Randomness Beacon Daemon"
arch=(x86_64)
url=https://github.com/drand/drand
license=('Apache-2.0 OR MIT')
depends=(glibc)
makedepends=(go)
source=($pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/archive/refs/tags/v$pkgver.tar.gz)
b2sums=('f17257fb0fa55bbe22c3ecc9d8a18d9a48c325219a25aca68748ce727b57f1d1b86126b8c1b3810ea351e7f289bf7967f259b04da763f3d23fbd9010acaf9d83')

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
