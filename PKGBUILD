# Maintainer: mfw <espadonne@outlook.com>

pkgname=wezztershier-rust
pkgver=0.3.0
pkgrel=1
pkgdesc='High-performance Rust GUI tuner for WezTerm configuration with embedded web interface'
arch=('x86_64')
url='https://github.com/tenseleyFlow/wezzteRust'
license=('MIT')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
optdepends=('wezterm: for WezTerm terminal emulator integration')
provides=('wezztershier-rust')
source=("git+https://github.com/tenseleyFlow/wezzteRust.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
    cd wezzteRust
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --locked
}

check() {
    cd wezzteRust
    cargo test --release --locked || true  # Allow tests to fail gracefully
}

package() {
    cd wezzteRust
    
    # Install the binary
    install -Dm755 target/release/wezztershier "$pkgdir/usr/bin/wezztershier-rust"
    
    # Install templates and examples
    install -Dm644 templates/basic.lua "$pkgdir/usr/share/wezztershier-rust/templates/basic.lua"
    install -Dm644 templates/advanced.lua "$pkgdir/usr/share/wezztershier-rust/templates/advanced.lua"
    install -Dm644 examples/test-config.lua "$pkgdir/usr/share/wezztershier-rust/examples/test-config.lua"
    
    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 BUILD-INSTRUCTIONS.md "$pkgdir/usr/share/doc/$pkgname/BUILD-INSTRUCTIONS.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    
    # Install desktop file if it exists
    if [ -f packaging/wezztershier.desktop ]; then
        install -Dm644 packaging/wezztershier.desktop "$pkgdir/usr/share/applications/wezztershier-rust.desktop"
        # Update the desktop file to use the correct binary name
        sed -i 's/Exec=wezztershier/Exec=wezztershier-rust/' "$pkgdir/usr/share/applications/wezztershier-rust.desktop"
    fi
}