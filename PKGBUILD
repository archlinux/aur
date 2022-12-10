# Maintainer: database64128 <free122448@hotmail.com>

pkgname=opdt-go
pkgver=1.0.0
pkgrel=1
pkgdesc="Discover the actual outgoing address and port when behind a NAT"
arch=('x86_64' 'aarch64')
url="https://github.com/database64128/$pkgname"
license=('AGPL3')
makedepends=('go')
backup=("etc/$pkgname/config.json")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('495ccbd73f2ffa29c9051d6a2a352f67e97a5da57876f519f77b92537c9c79d91837e05417d41da9facbd11ea94bc107fef1b4d3978bd6a5f91d13cd4c20d730')

build() {
    cd "$pkgname-$pkgver"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath"
    go build -ldflags='-s -w -linkmode=external' ./cmd/$pkgname
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm644 docs/$pkgname.service "$pkgdir"/usr/lib/systemd/system/$pkgname.service
    install -Dm644 docs/$pkgname@.service "$pkgdir"/usr/lib/systemd/system/$pkgname@.service
    install -d "$pkgdir"/etc/$pkgname
    install -Dm644 docs/config.json "$pkgdir"/etc/$pkgname/config.json
    install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}
