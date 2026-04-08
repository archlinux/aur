# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=drand
pkgver=2.1.6
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
b2sums=('4ed9550e1dee9f084b8426f60bfadfbbe3df8b284e84ad7ce3ac2df4a84f1ce2a0707ff5818ce4238a253275634e65cd80045c83e563fa21b482b5f4546d86d2')

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
