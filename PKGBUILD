# Maintainer: database64128 <free122448@hotmail.com>

pkgname=shadowsocks-go
pkgver=1.10.0
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
b2sums=('c9f9dd48fe85d03443d71d45d6eb96e1463d75d30c2b6cf8783d3557e0976ab63e52dc024253b18eb14ddf971102cb65e990d2b191ef8c2419105a83efd1edaf')

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
