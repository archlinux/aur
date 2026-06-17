# Maintainer: Salman Abuhaimed <salman.f.abuhaimed@gmail.com>
#

pkgname=ytdlp-gui
pkgver=3.3.0
pkgrel=2
pkgdesc="a GUI for yt-dlp written in Rust"
url="https://github.com/BKSalman/ytdlp-gui"
license=("GPL-3.0-only")
arch=("x86_64")
makedepends=( "cargo" "pkgconf" "git" )
depends=("ffmpeg" "yt-dlp")
options+=('!lto')

source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("dd378650f145f6a56d2db8262a7d22f8e05efea4cebc9a0b61107e2aba90666e")

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
