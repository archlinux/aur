# Maintainer: database64128 <free122448@hotmail.com>

_pkgname=ddns-go
pkgname=cubic-ddns-go
pkgver=1.0.1
pkgrel=1
pkgdesc="DDNS service supporting dynamic updates of A, AAAA, and HTTPS records"
arch=('x86_64' 'aarch64')
url="https://github.com/database64128/$_pkgname"
license=('GPL-3.0-or-later')
makedepends=('go')
provides=("$_pkgname")
conflicts=("$_pkgname")
backup=("etc/$_pkgname/config.json")
source=("$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('c1cb0f45d8b408ce5cd9ae4ac5846c97294b29e391b327a4770c2d4b712f20248ec0e911363fd645e2892eb03e7ce36378de8c1adeb3cdf43ca2d8f6246bb38b')

build() {
    cd "$_pkgname-$pkgver"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath"
    go build -ldflags='-s -w -linkmode=external' ./cmd/$_pkgname
}

package() {
    cd "$_pkgname-$pkgver"
    install -Dm644 docs/$_pkgname.service "$pkgdir"/usr/lib/systemd/system/$_pkgname.service
    install -Dm644 docs/$_pkgname@.service "$pkgdir"/usr/lib/systemd/system/$_pkgname@.service
    install -d "$pkgdir"/etc/$_pkgname
    install -Dm644 docs/config.json "$pkgdir"/etc/$_pkgname/config.json
    install -Dm755 $_pkgname "$pkgdir"/usr/bin/$_pkgname
}
