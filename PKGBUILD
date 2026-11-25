# Maintainer: Oscar Cowdery Lack <oscar.cowderylack@gmail.com>
pkgname=nsc
pkgver=2.15.1
pkgrel=1
pkgdesc="A tool for creating NATS account and user access configurations"
arch=(x86_64)
url="https://github.com/nats-io/nsc"
license=('Apache-2.0')
makedepends=(git go)
source=("$pkgname::git+$url#tag=v$pkgver")
sha256sums=('e3c3a88183e0ed9098a699dbc51b87c8d68cc71afc64a5d71d8bcc622d192793')

build() {
    cd "$pkgname"
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
    cd "$pkgname"
    install -Dm755 ./$pkgname "$pkgdir"/usr/bin/$pkgname
}
