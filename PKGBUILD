# Maintainer: database64128 <free122448@hotmail.com>

pkgname=swgp-go
pkgver=1.7.0
pkgrel=1
pkgdesc="Simple WireGuard proxy with minimal overhead for WireGuard traffic"
arch=('x86_64' 'aarch64')
url="https://github.com/database64128/$pkgname"
license=('AGPL-3.0-or-later')
makedepends=('git' 'go')
backup=("etc/$pkgname/config.json")
source=("$pkgname::git+$url.git#tag=v$pkgver?signed")
b2sums=('3d188bd6a10e8bdb8db10947b1e0bd3393602cfac0d4cc288232ba316260885d9625218749b8bb51c4d8ae5f6f02274a447b5bf6ef302d44f2b114ddafbdcd6e')
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
