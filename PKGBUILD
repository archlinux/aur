# Maintainer: database64128 <free122448@hotmail.com>

_pkgname=opdt-go
pkgname=$_pkgname-git
pkgver=1.0.0.r0.gb2f0ef9
pkgrel=1
pkgdesc="Discover the actual outgoing address and port when behind a NAT"
arch=('x86_64' 'aarch64')
url="https://github.com/database64128/$_pkgname"
license=('AGPL3')
makedepends=('git' 'go')
provides=("$_pkgname")
conflicts=("$_pkgname")
backup=("etc/$_pkgname/config.json")
source=("$pkgname::git+$url.git")
b2sums=('SKIP')

pkgver() {
    cd $pkgname
    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd $pkgname
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath"
    go build -ldflags='-s -w -linkmode=external' ./cmd/$_pkgname
}

package() {
    cd $pkgname
    install -Dm644 docs/$_pkgname.service "$pkgdir"/usr/lib/systemd/system/$_pkgname.service
    install -Dm644 docs/$_pkgname@.service "$pkgdir"/usr/lib/systemd/system/$_pkgname@.service
    install -d "$pkgdir"/etc/$_pkgname
    install -Dm644 docs/config.json "$pkgdir"/etc/$_pkgname/config.json
    install -Dm755 $_pkgname "$pkgdir"/usr/bin/$_pkgname
}
