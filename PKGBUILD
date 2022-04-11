# Maintainer: database64128 <free122448@hotmail.com>

pkgname=swgp-go
pkgver=1.0.1
pkgrel=1
pkgdesc="Simple WireGuard proxy with minimal overhead for WireGuard traffic"
arch=('x86_64' 'aarch64')
url="https://github.com/database64128/$pkgname"
license=('AGPL3')
makedepends=('go')
backup=("etc/$pkgname/config.json")
source=(
    "$url/archive/refs/tags/v$pkgver.tar.gz"
    "$pkgname.service"
    'config.json'
)
b2sums=(
    'd0ac364cff8ee136ab648597ae848335b464a172732226ca41a53e84924483d33e3060a2cbb8fd5caa8f3c133713353eb9a00a7b3b85ee29436025744348d841'
    '13a0ddcad6138016956c8918873a6722b539367991bcb16530001237a18c0abe4f7a20c7043fb617f9e4cb00d753a5eda3ece16892d5eb478ad5f78b47a46650'
    '6aa121a87edffbb95d350925b6f2edf54af59248cde8d99d332cc6ad912d55998f8ff9f52c626f5c4baeac80e35db952d96a5c90382ce3da4557271d7cff9101'
)

build() {
    cd "$pkgname-$pkgver"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    go build -ldflags='-s -w -linkmode=external' ./cmd/$pkgname
}

package() {
    install -Dm644 $pkgname.service "$pkgdir"/usr/lib/systemd/system/$pkgname.service
    install -d "$pkgdir"/etc/$pkgname
    install -Dm644 config.json "$pkgdir"/etc/$pkgname/config.json
    cd "$pkgname-$pkgver"
    install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}
