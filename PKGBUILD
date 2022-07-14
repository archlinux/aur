# Maintainer: database64128 <free122448@hotmail.com>

pkgname=swgp-go
pkgver=1.2.1
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
    '520e7178007c689f70f53984866bb440ac6d661ab4bede3eeba7ac224eb58d7b8b006807c1606a837f86b7f8d04b16534bdc93c5eb55aab98dacd50e65db955f'
    '13a0ddcad6138016956c8918873a6722b539367991bcb16530001237a18c0abe4f7a20c7043fb617f9e4cb00d753a5eda3ece16892d5eb478ad5f78b47a46650'
    '9d15491b51e925332f873ad733574392de9a556bb84d459ef9482dd546a6989609fdb4120a11cdc5a4604e1232efe79603d99f49d5555ae2974665bb0539b238'
    'c18ae84ded3a0f1f60961f8de1dbfe7f270404a9c3f21640861434b3e27f711f50fbd4726cdea893e499c6d55f1721f635a1e2d9831294bc688fad48fb55d7a6'
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
