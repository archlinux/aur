# Maintainer: database64128 <free122448@hotmail.com>

pkgname=shadowsocks-go
pkgver=1.8.0
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
    "etc/$pkgname/upsks.json"
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('86de0804bcb8b6b120f2d3ef6d4717fd3fbbb6b56cf4d105cd2621a0720fd3905fef824d36168e01c27202eed536cca4226fcaed0ff8e2ddb773ae85c79d9b09')

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
    install -Dm644 docs/upsks.json "$pkgdir"/etc/$pkgname/upsks.json
    install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
    install -Dm755 $pkgname-domain-set-converter "$pkgdir"/usr/bin/$pkgname-domain-set-converter
}
