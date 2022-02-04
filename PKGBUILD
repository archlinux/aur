# Maintainer: Vyacheslav Konovalov <🦀vk@protonmail.com>

_ver=RC-0.7.1
pkgname=pocket-core
pkgver=0.7.1_rc
pkgrel=1
pkgdesc='Official implementation of the Pocket Network Protocol'
arch=('x86_64')
url='https://www.pokt.network/'
license=('MIT')
makedepends=('go')
source=(
    "https://github.com/pokt-network/pocket-core/archive/refs/tags/$_ver.tar.gz"
    'pocket.service'
    'pocket.sysusers'
    'pocket.tmpfiles'
)
sha512sums=(
    '9bbb69c4d2574868d093b53f44b0b1d65775beba8732d30caceeb3b5c04d3a52517b57336a324e07375d8a2c0404e4bdacb8505cbe6c7fa27eeedd480523f283'
    '5a566112c8b6fa7a9b62d5e9375789258ee7d5e9e9fbd2987490a5e11e97d0d5069490c96a246d26efc0c61a78216835dd297230c36876563081f12fefd4a001'
    '8cd1a098212829477142eb69cc5202cbe08c96c641c426af4498fb8d3c769ba0d77335540443605fd7d91a2f3a986b79a4eeed0a84d0770f12b4cf6d5c7d0f64'
    '6ca773151a8e97bc463758893b312d10311ee88add0a93ba0c0703d02e19b9002b53fe746dd9ef62fcda67e2dfe8e966f5343ce35003999091c9a44878a038a6'
)

build() {
    cd $pkgname-$_ver

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS='-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw'

    go build -o build/ ./...
}

package() {
    install -Dm644 pocket.sysusers "$pkgdir/usr/lib/sysusers.d/pocket.conf"
    install -Dm644 pocket.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/pocket.conf"
    install -Dm644 pocket.service -t "$pkgdir/usr/lib/systemd/system"

    cd $pkgname-$_ver

    install -Dm755 build/pocket_core "$pkgdir/usr/bin/pocket"
    install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname"
}
