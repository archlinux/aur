# Maintainer: gaio <gavasc@proton.me>
pkgname=tiger-tui
pkgver=0.1.5
pkgrel=1
pkgdesc="Timer, alarm and stopwatch TUI for the terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/gavasc/tiger"
license=('MIT')
depends=('libnotify' 'ffmpeg')
optdepends=('libpulse: fallback audio if ffmpeg is unavailable')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('a2474047e6c11f77c1bde18038eb4bd27b937e50d605153a42107d97a28bf80f')

build() {
    cd "tiger-$pkgver"
    export CGO_ENABLED=0
    local ldflags="-s -w -X main.version=$pkgver"
    go build -trimpath -mod=readonly -ldflags="$ldflags" -o tiger  ./cmd/tiger
    go build -trimpath -mod=readonly -ldflags="$ldflags" -o tigerd ./cmd/tigerd
}

package() {
    cd "tiger-$pkgver"
    install -Dm755 tiger  "$pkgdir/usr/bin/tiger"
    install -Dm755 tigerd "$pkgdir/usr/bin/tigerd"
    install -Dm644 tigerd.service \
        "$pkgdir/usr/lib/systemd/user/tigerd.service"
    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    # Waybar module reference files.
    install -Dm644 contrib/waybar/tiger-module.jsonc \
        "$pkgdir/usr/share/tiger/waybar/tiger-module.jsonc"
    install -Dm644 contrib/waybar/tiger.css \
        "$pkgdir/usr/share/tiger/waybar/tiger.css"
}
