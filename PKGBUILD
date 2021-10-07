# Maintainer: Thorben Günther <echo YWRtaW5AeGVucm94Lm5ldAo= | base64 -d>

pkgname=navidrome
pkgver=0.46.0
pkgrel=1
pkgdesc='Modern Music Server and Streamer compatible with Subsonic/Airsonic'
arch=('x86_64')
url='https://www.navidrome.org'
license=('GPL3')
depends=('ffmpeg' 'nodejs' 'taglib')
makedepends=('git' 'go' 'npm')
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/navidrome/navidrome/archive/refs/tags/v$pkgver.tar.gz"
    "navidrome.service"
    "navidrome.toml"
    "sysusers.conf"
)
sha256sums=('662c1a6d31cafd58c6d1d015cd44f650bfc8dc10f12cc4407409f2d4a9c83d3c'
            '790cdabdffba7163a92e22572f4a0810081c9617338b8c28d3eb8d0a7edb8ae1'
            '23e62c707f3518f917e578979407cb26af2fd021fe88e580b920ccd05458ce13'
            'ee74a732f807e314f97e22b907882d16d125512d6ee23a36251fde2b3b7e608c')
backup=('etc/navidrome/navidrome.toml')

build() {
    # NOTE: Update with new release; git rev-parse --short HEAD
    local gitSha="8bbb878b"

    cd "$srcdir/$pkgname-$pkgver"

    make setup
    make buildjs

    export CGO_LDFLAGS="${LDFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -ldflags="-X github.com/navidrome/navidrome/consts.gitSha=$gitSha -X github.com/navidrome/navidrome/consts.gitTag=v$pkgver" -tags=netgo
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm755 navidrome "$pkgdir"/usr/bin/navidrome
    install -Dm0644 ../navidrome.service "$pkgdir"/usr/lib/systemd/system/navidrome.service
    install -Dm0644 ../navidrome.toml "$pkgdir"/etc/navidrome/navidrome.toml
    install -Dm0644 ../sysusers.conf "$pkgdir"/usr/lib/sysusers.d/navidrome.conf
}
