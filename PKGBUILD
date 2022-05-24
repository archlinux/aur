# Maintainer: database64128 <free122448@hotmail.com>

pkgname=swgp-go
pkgver=1.1.1
pkgrel=1
pkgdesc="Simple WireGuard proxy with minimal overhead for WireGuard traffic"
arch=('x86_64' 'aarch64')
url="https://github.com/database64128/$pkgname"
license=('AGPL3')
makedepends=('go')
backup=("etc/$pkgname/config.json")
source=(
    "$url/archive/refs/tags/v$pkgver.tar.gz"
    "$pkgname.service"
    "$pkgname@.service"
    'config.json'
)
b2sums=(
    '698d3c94dc98d8c3046b62cfc9b09d0ee0c5e9aa936f275449e622dfb43f8e4ab39f40f311310b613af2fe938794b8f8e6bc00dbc9b0580369b90cdb5a77c5ac'
    '13a0ddcad6138016956c8918873a6722b539367991bcb16530001237a18c0abe4f7a20c7043fb617f9e4cb00d753a5eda3ece16892d5eb478ad5f78b47a46650'
    '9d15491b51e925332f873ad733574392de9a556bb84d459ef9482dd546a6989609fdb4120a11cdc5a4604e1232efe79603d99f49d5555ae2974665bb0539b238'
    '6b8c7436b99dcdcfe706230cd1d30cbdeb3b70cf4d6815400a35c8a0c728edfb2ce5908057d7a4e0652daf2e161f8382b6035336bc43c27c23fbc0a369f769f1'
)

build() {
    cd "$pkgname-$pkgver"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    go build -ldflags='-s -w -linkmode=external' ./cmd/$pkgname
}

package() {
    install -Dm644 $pkgname.service "$pkgdir"/usr/lib/systemd/system/$pkgname.service
    install -Dm644 $pkgname@.service "$pkgdir"/usr/lib/systemd/system/$pkgname@.service
    install -d "$pkgdir"/etc/$pkgname
    install -Dm644 config.json "$pkgdir"/etc/$pkgname/config.json
    cd "$pkgname-$pkgver"
    install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}
