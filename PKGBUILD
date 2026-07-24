# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=drand
pkgver=2.1.7
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
b2sums=('0ec908ecfdd6947211d73cdb68dbfdd62f9f6bf4ae5133a963a6c197c45f7043c1c4838deb7bfcba1b068a675d83affbe00d8ee6f00deb296130275abf5ce94f')

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
