# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=drand-client
_name=go-clients
pkgver=0.2.3
pkgrel=1
pkgdesc="The drand (go) client and gossipsub relay"
arch=(x86_64)
url=https://github.com/drand/go-clients
license=('Apache-2.0 OR MIT')
depends=(glibc)
makedepends=(go)
source=($pkgname-$pkgver.tar.gz::https://github.com/drand/$_name/archive/refs/tags/v$pkgver.tar.gz)
b2sums=('d0bb7b1c5b7ff7cc329c9492f60c3d6b29c14ee6b162f0e0a90f0ae3ef64f0186e366345319df61069d599ff16782db719d8dc7c7da41062c084d7bd6c29175b')

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
