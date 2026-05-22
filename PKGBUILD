# Maintainer: brookerslyn <brookerslyn at REPLACE-WITH-YOUR-EMAIL-DOMAIN dot com>
pkgname=klyppd-git
_pkgname=klyppd
pkgver=0.1.0.r2.g6a75aef
pkgrel=1
pkgdesc="Performance-first Linux clipping app with instant replay, trimming, and cloud uploads."
arch=('x86_64')
url="https://github.com/brookerslyn/klyppd"
license=('MIT')
provides=("$_pkgname")
conflicts=("$_pkgname")
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
    'git'
    'pkgconf'
)
optdepends=(
    'libnotify: desktop notifications for clip events'
    'hyprland: tested compositor with first-class hotkey integration'
)
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "0.1.0.r%s.g%s" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

build() {
    cd "$_pkgname"
    npm ci
    npm run tauri build -- --bundles deb
}

package() {
    cd "$_pkgname"

    install -Dm755 src-tauri/target/release/klyppd "$pkgdir/usr/bin/klyppd"
    install -Dm644 packaging/klyppd.desktop "$pkgdir/usr/share/applications/klyppd.desktop"
    install -Dm644 src-tauri/icons/128x128.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/klyppd.png"
    install -Dm644 src-tauri/icons/32x32.png   "$pkgdir/usr/share/icons/hicolor/32x32/apps/klyppd.png"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
}
