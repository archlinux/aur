# Maintainer: il1v3y <ind4skylivey@proton.me>
pkgname=gleam-observer
pkgver=1.5.2
pkgrel=4
pkgdesc="Universal Hardware Monitor - TUI with Cyberpunk Aesthetics"
arch=('x86_64')
url="https://github.com/ind4skylivey/Gleam-Observer"
license=('MIT' 'Apache')
depends=('gcc-libs')
makedepends=('rust' 'cargo' 'git')
optdepends=(
    'nvidia-utils: NVIDIA GPU monitoring support'
    'mesa-utils: AMD GPU monitoring support'
)
install=gleam-observer.install
source=("git+$url.git#tag=v$pkgver"
        "gleam-observer.install")
sha256sums=('SKIP'
            'SKIP')

build() {
    cd "$srcdir/Gleam-Observer"
    
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    
    # Build TUI only (no systray - experimental for GNOME/KDE only)
    cargo build --release --features nvidia,amd,intel
}

check() {
    cd "$srcdir/Gleam-Observer"
    
    cargo test --release --features nvidia,amd,intel
}

package() {
    cd "$srcdir/Gleam-Observer"
    
    # Binary (TUI only)
    install -Dm755 "target/release/gleam" "$pkgdir/usr/bin/gleam"
    
    # Icon
    install -Dm644 "assets/gleamobserver.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/gleamobserver.png"
    
    # Desktop application entry (TUI launcher for rofi/dmenu)
    install -Dm644 "packaging/desktop/gleam-observer-tui.desktop" "$pkgdir/usr/share/applications/gleam-observer.desktop"
    
    # Config example
    install -Dm644 "config/default.toml" "$pkgdir/usr/share/doc/$pkgname/config-example.toml"
    
    # Licenses
    install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
