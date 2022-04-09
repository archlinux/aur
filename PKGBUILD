# Maintainer: database64128 <free122448@hotmail.com>

_pkgname=swgp-go
pkgname=$_pkgname-git
pkgver=1.0.0.r1.g00b2030
pkgrel=1
pkgdesc="Simple WireGuard proxy with minimal overhead for WireGuard traffic"
arch=('x86_64' 'aarch64')
url="https://github.com/database64128/$_pkgname"
license=('AGPL3')
makedepends=('git' 'go')
provides=("$_pkgname")
conflicts=("$_pkgname")
backup=("etc/$_pkgname/config.json")
source=(
    "$pkgname::git+$url.git"
    "$_pkgname.service"
    'config.json'
)
b2sums=(
    'SKIP'
    '13a0ddcad6138016956c8918873a6722b539367991bcb16530001237a18c0abe4f7a20c7043fb617f9e4cb00d753a5eda3ece16892d5eb478ad5f78b47a46650'
    '6aa121a87edffbb95d350925b6f2edf54af59248cde8d99d332cc6ad912d55998f8ff9f52c626f5c4baeac80e35db952d96a5c90382ce3da4557271d7cff9101'
)

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
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    go build -ldflags='-s -w -linkmode=external' ./cmd/$_pkgname
}

package() {
    install -Dm644 $_pkgname.service "$pkgdir"/usr/lib/systemd/system/$_pkgname.service
    install -d "$pkgdir"/etc/$_pkgname
    install -Dm644 config.json "$pkgdir"/etc/$_pkgname/config.json
    cd $pkgname
    install -Dm755 $_pkgname "$pkgdir"/usr/bin/$_pkgname
}
