# Maintainer: Oscar Cowdery Lack <oscar.cowderylack@gmail.com>
pkgname=nsc
pkgver=2.8.0
pkgrel=2
pkgdesc="A tool for creating NATS account and user access configurations"
arch=(x86_64)
url="https://github.com/nats-io/nsc"
license=('Apache')
makedepends=(go)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('318d28528bdd36abb929bb75b396cd8d4bee7b32c68a5c0be1786a168cec6ec9')

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
