# Maintainer: hexchain <arch at hexchain dot org>

pkgname=go-dnscollector
pkgver=0.39.0
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
b2sums=('aa7721fe19215ed2e78a745b14667114741fc02cecbab08cbafd4b94e453152d745b3b3f860cb8b5f096e0e0b0dbff24e044468724cb3ad669197708db20a8d5'
        'fbe5c63e637d832b94ee5b35732df8d1fafa9f790062820504108ebaa8b0be4f52d864478cfeb42d1db52058e98c912d6690635a3604ba16adb03a6f6ac92062')

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
