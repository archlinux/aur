# Maintainer: Salman Abuhaimed <salman.f.abuhaimed@gmail.com>
#

pkgname=ytdlp-gui
pkgver=3.1.0
pkgrel=1
pkgdesc="a GUI for yt-dlp written in Rust"
url="https://github.com/BKSalman/ytdlp-gui"
license=("GPL3")
arch=("x86_64")
makedepends=( "cargo" "pkgconf" "git" )
depends=("ffmpeg" "yt-dlp")

source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("6ea34e6ac5f97c673905c1cb0d2d081381a0d6fabe06412b6c0b250386319a85")

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
