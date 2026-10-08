# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=drand
pkgver=2.1.8
pkgrel=1
pkgdesc="A Distributed Randomness Beacon Daemon"
arch=(x86_64)
url=https://github.com/drand/drand
license=('Apache-2.0 OR MIT')
depends=(glibc)
makedepends=(
    git
    go
)
source=($pkgname::git+https://github.com/$pkgname/$pkgname.git#tag=v$pkgver)
b2sums=('1724ee48a96e29158b3f65a25dc9c71c0e8b583dc1a9f39f6dad53ace727555582ce8f35c8fa1f0746b70ae2065f876a521f0698f111820a53dd4c9741b76900')

build() {
    cd $pkgname
    mkdir -p build
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o build ./cmd/drand
}

check() {
    cd $pkgname
    # Unit tests
    go test -failfast -tags conn_insecure ./...
    #go test -failfast -tags conn_insecure,memdb ./...
    #go test -failfast -tags conn_insecure,postgres ./...

    # Integration tests
    go test -failfast -tags conn_insecure,integration ./demo/
    #go test -failfast -tags conn_insecure,integration,memdb ./demo/
    #go test -failfast -tags conn_insecure,integration,postgres ./demo/
}

package() {
    cd $pkgname
    install -Dm755 build/drand "$pkgdir"/usr/bin/drand
    install -Dm644 LICENSE-MIT "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
