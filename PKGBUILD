# Maintainer: database64128 <free122448@hotmail.com>

pkgname=swgp-go
pkgver=1.1.0
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
    'e5debf655565c6cf010cc6ac35e4dab2509bbbcb91ce1d8ea3ab7cea8ef0a94c5e94e61da772fa8313240c1e347ece4aed8d08d40890302688f048f786e959f5'
    '13a0ddcad6138016956c8918873a6722b539367991bcb16530001237a18c0abe4f7a20c7043fb617f9e4cb00d753a5eda3ece16892d5eb478ad5f78b47a46650'
    '6b8c7436b99dcdcfe706230cd1d30cbdeb3b70cf4d6815400a35c8a0c728edfb2ce5908057d7a4e0652daf2e161f8382b6035336bc43c27c23fbc0a369f769f1'
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
