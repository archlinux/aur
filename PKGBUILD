# Maintainer: database64128 <free122448@hotmail.com>

pkgname=swgp-go
pkgver=1.5.0
pkgrel=1
pkgdesc="Simple WireGuard proxy with minimal overhead for WireGuard traffic"
arch=('x86_64' 'aarch64')
url="https://github.com/database64128/$pkgname"
license=('AGPL3')
makedepends=('go')
backup=("etc/$pkgname/config.json")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('ce6143f1e3f0467d78beddcdabdcf06f6ab74c29bc2f49b2cdda10f6b6e3fa741da6ecd8bc7de3e8eb899378fffc9aa9dd3285af50c828c48424ba969f4e3e14')

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
