# Maintainer: Oscar Cowdery Lack <oscar.cowderylack@gmail.com>
pkgname=nsc
pkgver=2.10.0
pkgrel=1
pkgdesc="A tool for creating NATS account and user access configurations"
arch=(x86_64)
url="https://github.com/nats-io/nsc"
license=('Apache-2.0')
makedepends=(git go)
source=("$pkgname::git+$url#tag=v$pkgver")
sha256sums=('fbdb2c481644cea20c6dea40fa89ea11228aff92063d49e0751fc3ce58da536b')

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
