# Maintainer: Sumer Jakhar <sumer.jakhar@emoha.com>
pkgname=hyprpilot-mcp
pkgver=1.1.0
pkgrel=1
pkgdesc="Programmatic control of Hyprland for AI agents and humans: typed IPC client, daemon with undo/snapshots, CLI, MCP server, input synthesis, screen capture + OCR, and accessibility (AT-SPI) reading"
arch=('x86_64' 'aarch64')
url="https://github.com/sumerchoudhary78/HyprPilot"
license=('MIT OR Apache-2.0')
depends=('hyprland' 'gcc-libs' 'glibc')
makedepends=('cargo')
optdepends=('grim: screen capture for the Vision tools'
            'slurp: interactive region selection for capture'
            'tesseract: OCR for the Vision tools'
            'tesseract-data-eng: English language data for OCR'
            'wtype: text and key-chord input synthesis'
            'ydotool: input-synthesis fallback that drives Hyprland keybinds'
            'at-spi2-core: accessibility (AT-SPI) bus for the a11y tools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1333f5143f58dbf06485cf01fbd258bd85b393d95e5ca9df5562f22538bca2de')

prepare() {
    cd "HyprPilot-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "HyprPilot-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "HyprPilot-$pkgver"

    install -Dm755 target/release/hyprpilot        "$pkgdir/usr/bin/hyprpilot"
    install -Dm755 target/release/hyprpilot-daemon "$pkgdir/usr/bin/hyprpilot-daemon"
    install -Dm755 target/release/hyprpilot-mcp    "$pkgdir/usr/bin/hyprpilot-mcp"

    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    for example in docs/*.example.toml; do
        install -Dm644 "$example" "$pkgdir/usr/share/doc/$pkgname/$(basename "$example")"
    done

    install -Dm644 LICENSE-MIT    "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
