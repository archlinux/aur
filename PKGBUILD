# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=drand-client
_name=go-clients
pkgver=0.3.1
pkgrel=1
pkgdesc="The drand (go) client and gossipsub relay"
arch=(x86_64)
url=https://github.com/drand/go-clients
license=('Apache-2.0 OR MIT')
depends=(glibc)
makedepends=(go)
source=($pkgname-$pkgver.tar.gz::https://github.com/drand/$_name/archive/refs/tags/v$pkgver.tar.gz)
b2sums=('02681fcf1aed9b1d84f161fbfbf0b089ae3e0d5bcf2aa343cf778421864687ef82dcb8390427795ba4ce9c567583e80f2aa3b5ec8e4cdf2562e0415885056c91')

build() {
    cd $_name-$pkgver
    mkdir -p build
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o drand-cli ./main.go
    go build -o drand-relay-gossip ./gossip-relay/main.go
}

package() {
    cd $_name-$pkgver
    install -Dm755 drand-cli "$pkgdir"/usr/bin/drand-cli
    install -Dm755 drand-relay-gossip "$pkgdir"/usr/bin/drand-relay-gossip
    install -Dm644 LICENSE-MIT "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
