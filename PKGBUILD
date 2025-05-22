# Maintainer: database64128 <free122448@hotmail.com>

pkgname=shadowsocks-go
pkgver=1.14.0
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
b2sums=('9e72b16ef3c77812c3243912b93dc50cb13788866860405ad8446922599a20422a44e1c9966619e02d7623c68050f5e2e4c744f26c4670bce11bb9e6b0de7de8')
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
