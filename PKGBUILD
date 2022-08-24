# Maintainer: Vyacheslav Konovalov <🦀vk@protonmail.com>

_tag=RC-0.9.0
pkgname=pocket-core
pkgver=0.9.0_rc
pkgrel=1
pkgdesc='Official implementation of the Pocket Network Protocol'
arch=('x86_64')
url='https://www.pokt.network/'
license=('MIT')
makedepends=('go')
source=(
    "https://github.com/pokt-network/pocket-core/archive/refs/tags/$_tag.tar.gz"
    'pocket.service'
    'pocket.sysusers'
    'pocket.tmpfiles'
)
sha512sums=(
    '44df2a48c041f8150234ec79f81df6d2a6fe4ef98737e20ff11f35370082d1c8fa7dd3dd885dcb31537615cc6a14201c3dc7d78ac290ef615cd0ecb659d1592d'
    '5a566112c8b6fa7a9b62d5e9375789258ee7d5e9e9fbd2987490a5e11e97d0d5069490c96a246d26efc0c61a78216835dd297230c36876563081f12fefd4a001'
    'c20438004fc5e1f178bc85422202043083615ce77772c5af46e50ddb58890374202f269f5ab51baa692f3d0b82febde452ea8150f10e5e6edb1e5117dab1affc'
    '6ca773151a8e97bc463758893b312d10311ee88add0a93ba0c0703d02e19b9002b53fe746dd9ef62fcda67e2dfe8e966f5343ce35003999091c9a44878a038a6'
)

build() {
    cd $pkgname-$_tag

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

    cd $pkgname-$_tag

    install -Dm755 build/pocket_core "$pkgdir/usr/bin/pocket"
    install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname"
}
