# Maintainer: database64128 <free122448@hotmail.com>

pkgname=shadowsocks-go
pkgver=1.15.0
pkgrel=1
pkgdesc="A versatile and efficient proxy platform for secure communications"
arch=('x86_64' 'aarch64')
url="https://github.com/database64128/$pkgname"
license=('AGPL-3.0-or-later')
makedepends=('git' 'go')
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
source=("$pkgname::git+$url.git#tag=v$pkgver?signed")
b2sums=('2dca863238a4d806b79120c03e40246e158c381775d41c99969c4e86520651ed4b7dfa0989a518797b3d92906c6f25e247359653aaacfcc1cc62cb457289151f')
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
    go build -ldflags='-s -w -linkmode=external' ./cmd/$pkgname-domain-set-converter
}

package() {
    cd $pkgname
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
