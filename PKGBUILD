# Maintainer: Hein (Warky Devs) <hein@warky.dev>
pkgname=relspec
pkgver=1.0.90
pkgrel=1
pkgdesc="RelSpec is a comprehensive database relations management tool that reads, transforms, and writes database table specifications across multiple formats and ORMs."
arch=('x86_64' 'aarch64')
url="https://git.warky.dev/wdevs/relspecgo"
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.zip::$url/releases/download/v$pkgver/relspec-v$pkgver-source.zip")
sha256sums=('a040121d75a4b5b9cd67b3df12981f9601ec0d56b9a4475c30d0f3fbcc5c2cda')

build() {
    cd "$pkgname-$pkgver"
    export CGO_ENABLED=0
    go build \
        -trimpath \
        -ldflags "-X 'git.warky.dev/wdevs/relspecgo/pkg/buildinfo.Version=v$pkgver' -X 'git.warky.dev/wdevs/relspecgo/pkg/buildinfo.BuildDate=$(date -u +"%Y-%m-%d %H:%M:%S UTC")'" \
        -o "$pkgname" ./cmd/relspec
}

check() {
    cd "$pkgname-$pkgver"
    go test ./...
}

package() {
    cd "$pkgname-$pkgver"

    # Binary
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"

    # Default config dir
    install -dm755 "$pkgdir/etc/relspec"
}
