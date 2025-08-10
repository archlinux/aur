# Maintainer: database64128 <free122448@hotmail.com>

pkgname=swgp-go
pkgver=1.8.0
pkgrel=1
pkgdesc="Simple WireGuard proxy with minimal overhead for WireGuard traffic"
arch=('x86_64' 'aarch64')
url="https://github.com/database64128/$pkgname"
license=('AGPL-3.0-or-later')
makedepends=('git' 'go')
backup=("etc/$pkgname/config.json")
source=("$pkgname::git+$url.git#tag=v$pkgver?signed")
b2sums=('98498aa90604ddf2a596451f493185a6fda8ab11f9a89a668cb4d0ab50f24fa2b448a9d3676888f2fb3549e9aa465d3c84c1a0f223dcd4d9a18e7248fca80555')
validpgpkeys=(
    '4DCED15E346E2923B931D6F71CA27546BEDB8B01' # Ian Chen (database64128) <free122448@hotmail.com>
)

build() {
    cd $pkgname
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath"
    go build -ldflags='-s -w -linkmode=external' ./cmd/$pkgname
}

package() {
    cd $pkgname
    install -Dm644 docs/$pkgname.service "$pkgdir"/usr/lib/systemd/system/$pkgname.service
    install -Dm644 docs/$pkgname@.service "$pkgdir"/usr/lib/systemd/system/$pkgname@.service
    install -d "$pkgdir"/etc/$pkgname
    install -Dm644 docs/config.json "$pkgdir"/etc/$pkgname/config.json
    install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}
