# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=drand
pkgver=2.1.3
pkgrel=1
pkgdesc="A Distributed Randomness Beacon Daemon"
arch=(x86_64)
url=https://github.com/drand/drand
license=('Apache-2.0 OR MIT')
depends=(glibc)
makedepends=(go)
source=($pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/archive/refs/tags/v$pkgver.tar.gz)
b2sums=('5641f1be902810d20c6e35adf4b6fb4837092e19fd078876f78c6b3c3faea2a0c8015fe5402618dd44bcbb9fe489ec58b4665861a189a15e084c89393c847bcf')

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
