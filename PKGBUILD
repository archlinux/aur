# Maintainer: database64128 <free122448@hotmail.com>

_pkgname=ddns-go
pkgname=cubic-ddns-go
pkgver=1.0.0
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
b2sums=('acfe84faf8dd1790212837cd550a96ad952f24cf6d4d7963463217a2ef2e007cbc40d8a1086cc678b5bb748a7bf18aebbcf9170ba131032b42439823e68af043')

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
