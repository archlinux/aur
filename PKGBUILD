# Maintainer: Oscar Cowdery Lack <oscar.cowderylack@gmail.com>
pkgname=nsc
pkgver=2.8.5
pkgrel=1
pkgdesc="A tool for creating NATS account and user access configurations"
arch=(x86_64)
url="https://github.com/nats-io/nsc"
license=('Apache')
makedepends=(go)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b1318fd86fd133a355a887dbda23b8d6d3d5c072695a432c9f23ef0b2a9fa94d')

build() {
    cd "$pkgname-$pkgver"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    # disable self-updates
    sed -i 's|github = "nats-io/nsc"|github = ""|' cmd/defaults.go

    go build -ldflags="-X main.version=${pkgver}" .
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 ./$pkgname "$pkgdir"/usr/bin/$pkgname
}
