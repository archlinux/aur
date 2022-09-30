# Maintainer: database64128 <free122448@hotmail.com>

pkgname=shadowsocks-go
pkgver=1.3.1
pkgrel=1
pkgdesc="A versatile and efficient proxy platform for secure communications"
arch=('x86_64' 'aarch64')
url="https://github.com/database64128/$pkgname"
license=('AGPL3')
makedepends=('go')
optdepends=(
    'shadowsocks-go-domain-sets: commonly used domain sets'
    'shadowsocks-go-geolite2-country: MaxMind GeoLite2 country database'
)
backup=(
    "etc/$pkgname/config.json"
    "etc/$pkgname/server.json"
    "etc/$pkgname/client.json"
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('d7faeed7cf4efaf1af40edbd89aec95be78e42c24e71cc5c588a112deece3eb4c23998c2d100b95e5ea6ac8072e7197aa5f67bc8e3c571a7d06c66f134b519bf')

build() {
    cd "$pkgname-$pkgver"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath"
    go build -ldflags='-s -w -linkmode=external' ./cmd/$pkgname
    go build -ldflags='-s -w -linkmode=external' ./cmd/$pkgname-domain-set-converter
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm644 docs/$pkgname.service "$pkgdir"/usr/lib/systemd/system/$pkgname.service
    install -Dm644 docs/$pkgname@.service "$pkgdir"/usr/lib/systemd/system/$pkgname@.service
    install -d "$pkgdir"/etc/$pkgname
    install -Dm644 docs/config.json "$pkgdir"/etc/$pkgname/config.json
    install -Dm644 docs/server.json "$pkgdir"/etc/$pkgname/server.json
    install -Dm644 docs/client.json "$pkgdir"/etc/$pkgname/client.json
    install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
    install -Dm755 $pkgname-domain-set-converter "$pkgdir"/usr/bin/$pkgname-domain-set-converter
}
