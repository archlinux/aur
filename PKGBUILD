# Maintainer: hexchain <arch at hexchain dot org>

pkgname=go-dnscollector
pkgver=0.35.0
pkgrel=1
pkgdesc="Ingestor, aggregator and analyzer for your DNS traffic"
url="https://github.com/dmachard/go-dnscollector"
license=('MIT')
arch=('x86_64')
depends=('glibc')
makedepends=('go')
backup=(etc/go-dnscollector/config.yml)
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/dmachard/go-dnscollector/archive/refs/tags/v$pkgver.tar.gz"
    go-dnscollector.service
)

prepare() {
    mkdir -p "$srcdir/build"
    export GOPATH="$srcdir/build"
    export GOFLAGS="-buildmode=pie -mod=readonly -modcacherw"

    cd "$srcdir/go-dnscollector-$pkgver"
    go mod download
}

build() {
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOPATH="$srcdir"
    export GOLDFLAGS="-linkmode=external -compressdwarf=false -X main.Version=$pkgver"
    export GOFLAGS="-buildmode=pie -mod=readonly -modcacherw"

    cd "$srcdir/go-dnscollector-$pkgver"
    go build -v -ldflags="$GOLDFLAGS" -o go-dnscollector .
}

package() {
    cd "$srcdir/go-dnscollector-$pkgver"
    install -Dm755 "go-dnscollector" -t "$pkgdir/usr/bin/"
    install -Dm644 "config.yml" -t "$pkgdir/etc/go-dnscollector/"
    install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 "$srcdir/go-dnscollector.service" -t "$pkgdir/usr/lib/systemd/system/"
}
sha256sums=('337ad7453f3a53e135090ba4cb7f542fec6babb00965932dcac6965c7349e329'
            'f3bfd87c877a69f61a5df1eaa82377a57cff84cb63f6e410408f25b7461f6e07')
