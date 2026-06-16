# Maintainer: brookerslyn <brookerslyn at REPLACE-WITH-YOUR-EMAIL-DOMAIN dot com>
pkgname=klyppd
pkgver=0.3.2
pkgrel=1
pkgdesc="Performance-first Linux clipping app with instant replay, trimming, and cloud uploads."
arch=('x86_64')
url="https://github.com/brookerslyn/klyppd"
license=('MIT')
depends=(
    'gpu-screen-recorder'
    'ffmpeg'
    'webkit2gtk-4.1'
    'gst-plugins-base'
    'gst-plugins-good'
    'gst-plugins-bad'
    'gst-libav'
)
makedepends=(
    'rust'
    'cargo'
    'nodejs'
    'npm'
    'pkgconf'
)
optdepends=(
    'libnotify: desktop notifications for clip events'
    'hyprland: tested compositor with first-class hotkey integration'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('99a8be1c19c7a58d462fbf5bee04f303258275f4e93719cf657fae3fb5945a74')

build() {
    cd "$pkgname-$pkgver"
    npm ci
    npm run tauri build -- --bundles deb
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 src-tauri/target/release/klyppd "$pkgdir/usr/bin/klyppd"
    install -Dm644 packaging/klyppd.desktop "$pkgdir/usr/share/applications/klyppd.desktop"
    install -Dm644 src-tauri/icons/128x128.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/klyppd.png"
    install -Dm644 src-tauri/icons/32x32.png   "$pkgdir/usr/share/icons/hicolor/32x32/apps/klyppd.png"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
