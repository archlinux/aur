# Maintainer: hexchain <arch at hexchain dot org>

_name=DNS-collector
pkgname=dns-collector
pkgver=2.2.3
pkgrel=1
pkgdesc="Ingestor, aggregator and analyzer for your DNS traffic"
url="https://github.com/dmachard/dns-collector"
replaces=('go-dnscollector')
license=('MIT')
arch=('x86_64')
depends=('glibc')
makedepends=('go')
options=(!debug)
backup=(etc/go-dnscollector/config.yml)
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/dmachard/dns-collector/archive/refs/tags/v$pkgver.tar.gz"
    go-dnscollector.service
)
b2sums=('0c1f6358f7f06f489d3bf97dbbe18b64dcf266ce7213aa73c0a1e7a9d1be661f7929b468e2351ec2d5c6d82293aff4d9b80d54af0371f079a1f8a1e81c8a82dc'
        'fbe5c63e637d832b94ee5b35732df8d1fafa9f790062820504108ebaa8b0be4f52d864478cfeb42d1db52058e98c912d6690635a3604ba16adb03a6f6ac92062')

prepare() {
    mkdir -p "$srcdir/build"
    export GOPATH="$srcdir/build"
    export GOFLAGS="-mod=readonly -modcacherw"

    cd "$srcdir/$_name-$pkgver"
    go mod download
}

build() {
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOPATH="$srcdir/build"
    export GOLDFLAGS="-linkmode=external -extldflags \"${LDFLAGS}\" -X main.Version=$pkgver"
    export GOFLAGS="-buildmode=pie -mod=readonly -modcacherw"

    cd "$srcdir/$_name-$pkgver"
    go build -v -ldflags="$GOLDFLAGS" -o go-dnscollector .
}

package() {
    cd "$srcdir/$_name-$pkgver"
    install -Dm755 "go-dnscollector" -t "$pkgdir/usr/bin/"
    install -Dm644 "config.yml" -t "$pkgdir/etc/go-dnscollector/"
    install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 "$srcdir/go-dnscollector.service" -t "$pkgdir/usr/lib/systemd/system/"
}
