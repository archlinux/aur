pkgname=bitmagnet-git
pkgver=v0.5.1
pkgrel=1
pkgdesc='A self-hosted BitTorrent indexer, DHT crawler, content classifier and torrent search engine with web UI, GraphQL API and Servarr stack integration.'
arch=('any')
url="https://bitmagnet.io/"
license=("MIT")
depends=('glibc')
makedepends=('git' 'go')
optdepends=("postgresql: database"
            "redis: cache"
            "prometheus: metrics"
            "loki: logs"
            "grafana: dashboards"
            "pyroscope: profiling")
provides=("bitmagnet=${pkgver}")
backup=("etc/bitmagnet/config.yml")
source=('git+https://github.com/bitmagnet-io/bitmagnet'
        'config.yml'
        'bitmagnet.service'
        'dirs.conf'
        'user.conf')
sha256sums=('SKIP'
            '8c664222a5176e15c4db3fdbcb7b39d8c8efd86698f64dc37f8eb877af67e965'
            'b8fe373d25c857f312cc4a88c4056065a9df39c5a2b3e560fd879723864c5b8f'
            '5f80125347060d22175732fa0304df425178ae54282ccf2a3ce9e22a970b60ae'
            '6289a984a94570fd25a0330646caabc20e6cb871d1b141d27cc98d6781d6b35a')

pkgver() {
    cd "$srcdir/bitmagnet"
    git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/bitmagnet"
    sed -i 's|\./config\.yml|/etc/bitmagnet/config.yml|' internal/boilerplate/config/configfx/module.go
}

build() {
    cd "$srcdir/bitmagnet"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"

    go build -buildmode=pie -mod=readonly -trimpath -ldflags "-X github.com/bitmagnet-io/bitmagnet/internal/version.GitTag=$pkgver"
}

package() {
    cd "$srcdir/bitmagnet"

    install -Dm755 -t "$pkgdir/usr/bin" bitmagnet
    install -Dm640 -t "$pkgdir/etc/bitmagnet" "$srcdir/config.yml"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

    install -D -t "$pkgdir/usr/lib/systemd/system/" "$srcdir/bitmagnet.service"
    install -D "$srcdir/user.conf" "$pkgdir/usr/lib/sysusers.d/bitmagnet.conf"
    install -D "$srcdir/dirs.conf" "$pkgdir/usr/lib/tmpfiles.d/bitmagnet.conf"

    mkdir -p "$pkgdir/usr/share/$pkgname" "$pkgdir/usr/share/$pkgname/doc"
    cp -R "observability" "$pkgdir/usr/share/$pkgname/"
    #cp -R "bitmagnet.io/"* "$pkgdir/usr/share/$pkgname/doc/"

    find "$pkgdir/etc/bitmagnet" -type f -exec chmod 640 {} + -o -type d -exec chmod 2750 {} +
}
