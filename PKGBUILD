# Maintainer: database64128 <free122448@hotmail.com>

_pkgname=shadowsocks-go
pkgname=$_pkgname-git
pkgver=1.15.0.r23.gd8f0815
pkgrel=1
pkgdesc="A versatile and efficient proxy platform for secure communications"
arch=('x86_64' 'aarch64')
url="https://github.com/database64128/$_pkgname"
license=('AGPL-3.0-or-later')
makedepends=('git' 'go')
optdepends=(
    'shadowsocks-go-domain-sets: commonly used domain sets'
    'shadowsocks-go-geolite2-country: MaxMind GeoLite2 country database'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
backup=(
    "etc/$_pkgname/config.json"
    "etc/$_pkgname/server.json"
    "etc/$_pkgname/client.json"
    "etc/$_pkgname/upsks.json"
)
source=("$_pkgname::git+$url.git")
b2sums=('SKIP')

pkgver() {
    cd $_pkgname
    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd $_pkgname
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath"
    go build -ldflags='-s -w -linkmode=external' ./cmd/$_pkgname
}

package() {
    cd $_pkgname
    install -Dm644 docs/$_pkgname.service "$pkgdir"/usr/lib/systemd/system/$_pkgname.service
    install -Dm644 docs/$_pkgname@.service "$pkgdir"/usr/lib/systemd/system/$_pkgname@.service
    install -d "$pkgdir"/etc/$_pkgname
    install -Dm644 docs/config.json "$pkgdir"/etc/$_pkgname/config.json
    install -Dm644 docs/server.json "$pkgdir"/etc/$_pkgname/server.json
    install -Dm644 docs/client.json "$pkgdir"/etc/$_pkgname/client.json
    install -Dm644 docs/upsks.json "$pkgdir"/etc/$_pkgname/upsks.json
    install -Dm755 $_pkgname "$pkgdir"/usr/bin/$_pkgname
    ln -rs "$pkgdir"/usr/bin/$_pkgname "$pkgdir"/usr/bin/$_pkgname-domain-set-converter
}
