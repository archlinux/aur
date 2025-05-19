# Maintainer: database64128 <free122448@hotmail.com>

_pkgname=swgp-go
pkgname=$_pkgname-git
pkgver=1.7.0.r39.gd5b7900
pkgrel=1
pkgdesc="Simple WireGuard proxy with minimal overhead for WireGuard traffic"
arch=('x86_64' 'aarch64')
url="https://github.com/database64128/$_pkgname"
license=('AGPL-3.0-or-later')
makedepends=('git' 'go')
provides=("$_pkgname")
conflicts=("$_pkgname")
backup=("etc/$_pkgname/config.json")
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
    install -Dm755 $_pkgname "$pkgdir"/usr/bin/$_pkgname
}
