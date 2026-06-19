# Maintainer: Salman Abuhaimed <salman.f.abuhaimed@gmail.com>
#

pkgname=ytdlp-gui
pkgver=3.4.0
pkgrel=1
pkgdesc="a GUI for yt-dlp written in Rust"
url="https://github.com/BKSalman/ytdlp-gui"
license=("GPL-3.0-only")
arch=("x86_64")
makedepends=( "cargo" "pkgconf" "git" )
depends=("ffmpeg" "yt-dlp")
options+=('!lto')

source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("d446eec8c9765dcf38dff5a07f3dd0a94abd642a75dbdb8b4c4c7a9c0e3fbda6")

prepare() {
    cd "$pkgname-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$pkgname-${pkgver}"
    
    install -Dm755 "${CARGO_TARGET_DIR:-target}/release/ytdlp-gui" "$pkgdir/usr/bin/ytdlp-gui"
    install -Dm755 "data/applications/ytdlp-gui.desktop" "$pkgdir/usr/share/applications/ytdlp-gui.desktop"
    for _size in "16x16" "32x32" "48x48" "64x64" "128x128" "256x256"; do
        install -Dm644 "data/icons/$_size/apps/ytdlp-gui.png" "$pkgdir/usr/share/icons/hicolor/$_size/apps/ytdlp-gui.png"
    done

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
