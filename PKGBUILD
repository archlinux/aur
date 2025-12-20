# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=drand
pkgver=2.1.4
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
b2sums=('8b115ef8b8c73c89d7b94f2da787e67991962b09bbab7a33cae5015a648cd2facc9f1bd1f58bb418f5b97ce09abcb7a4b4bca7c6017006622e52f6f4ec541bbf')

prepare() {
   cd $pkgname
   # They forgot to bump version
   sed -i 's/Patch:      3/Patch:      4/' common/version.go
}

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
