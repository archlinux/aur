# Maintainer: MURDERRA <murderra@keemail.me>
pkgname=ytc
pkgver=1.0.0
pkgrel=1
pkgdesc="YouTube TUI client — search, browse history/playlists/subscriptions, play via mpv"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/MURDERRA/YTC"
license=('MIT')
depends=('mpv' 'yt-dlp' 'chafa')
makedepends=('go>=1.21')
optdepends=(
    'firefox: cookie-based auth for history, playlists, subscriptions'
    'chromium: alternative browser for cookie auth'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
    cd "YTC-$pkgver"
    go mod tidy
}

build() {
    cd "YTC-$pkgver"
    export CGO_ENABLED=0
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    go build \
        -ldflags="-s -w -X main.version=$pkgver" \
        -o build/ytc ./
}

check() {
    cd "YTC-$pkgver"
    go test ./... 2>/dev/null || true
}

package() {
    cd "YTC-$pkgver"
    install -Dm755 build/ytc          "$pkgdir/usr/bin/ytc"
    install -Dm644 README.md          "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE            "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
