# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=drand-client
_name=go-clients
pkgver=0.2.2
pkgrel=1
pkgdesc="The drand (go) client and gossipsub relay"
arch=(x86_64)
url=https://github.com/drand/go-clients
license=('Apache-2.0 OR MIT')
depends=(glibc)
makedepends=(go)
source=($pkgname-$pkgver.tar.gz::https://github.com/drand/$_name/archive/refs/tags/v$pkgver.tar.gz)
b2sums=('1b1c7ff34763db5e0721e5963463cf4088078b49695a580878a31f76c41dc5571855ac338cc91e67ec85cff8655bb4b69b0f9f456eae5dcb455505bf023cdaa7')

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
