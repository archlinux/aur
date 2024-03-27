pkgname=bitmagnet-git
pkgver=v0.7.14.r2.ge9e19a5
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
            '20f4a744e7b5f8549a66713bee5fcb65fcee58647370b2107adbc0f0bfc000c9'
            '3582219a0e0f932d97549f44cbe4c1f330d7edd58cc8fd88bb6912a655a7379f'
            '4ca44b64e567d5220843eaf7dcae90095806f644c561ed74ce01cd0143b00f51'
            '6289a984a94570fd25a0330646caabc20e6cb871d1b141d27cc98d6781d6b35a')

pkgver() {
    cd "$srcdir/bitmagnet"
    git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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
