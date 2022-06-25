# Maintainer: database64128 <free122448@hotmail.com>

_pkgname=swgp-go
pkgname=$_pkgname-git
pkgver=1.2.0.r4.gc017bb5
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
    "$_pkgname@.service"
    'config.json'
)
b2sums=(
    'SKIP'
    '13a0ddcad6138016956c8918873a6722b539367991bcb16530001237a18c0abe4f7a20c7043fb617f9e4cb00d753a5eda3ece16892d5eb478ad5f78b47a46650'
    '9d15491b51e925332f873ad733574392de9a556bb84d459ef9482dd546a6989609fdb4120a11cdc5a4604e1232efe79603d99f49d5555ae2974665bb0539b238'
    'fa5f5a58a8d79f9e1cc9cc5b2accad363b72dd989af6c14e66c31e0a167a692ff8444654d14e9350e948a4d582bc0909ad83fcf48a1966b11a0550396ce0a94d'
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
    install -Dm644 $_pkgname@.service "$pkgdir"/usr/lib/systemd/system/$_pkgname@.service
    install -d "$pkgdir"/etc/$_pkgname
    install -Dm644 config.json "$pkgdir"/etc/$_pkgname/config.json
    cd $pkgname
    install -Dm755 $_pkgname "$pkgdir"/usr/bin/$_pkgname
}
