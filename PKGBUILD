# Maintainer: Mattdef <mattdef@gmail.com>
# Contributor: Rustrland Contributors

pkgname=rustrland
pkgver=0.3.2
pkgrel=1
pkgdesc="A Rust-powered window management for Hyprland - Fast, reliable plugin system"
arch=('x86_64' 'aarch64')
url="https://github.com/mattdef/rustrland"
license=('MIT')
depends=('hyprland')
optdepends=(
    'swaybg: Default wallpaper backend for wallpapers plugin'
    'swww: Alternative wallpaper backend with animations'
    'wpaperd: Per-workspace wallpaper backend'
    'imagemagick: Hardware acceleration for wallpaper processing'
    'foot: Recommended terminal for scratchpad plugin'
    'firefox: Browser support for scratchpad plugin'
    'thunar: File manager support for scratchpad plugin'
)
makedepends=('rust' 'cargo')
conflicts=('rustrland-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mattdef/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('451ee4aa2a965caa7c2074d7f887e4a95e4594a18f3fcd1b57d7aba6e28a9252')

build() {
    cd "$pkgname-$pkgver"
    
    # Set environment variables for optimized build
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    
    # Build with optimizations
    cargo build --release --all-features
}

check() {
    cd "$pkgname-$pkgver"
    
    # Run tests to ensure package integrity
    cargo test --release --lib --bins
}

package() {
    cd "$pkgname-$pkgver"
    
    # Install main binaries
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm755 "target/release/rustr" "$pkgdir/usr/bin/rustr"
    
    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    
    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 CLAUDE.md "$pkgdir/usr/share/doc/$pkgname/CLAUDE.md"
    
    # Install optional documentation (if exists)
    [[ -f "PLUGINS.md" ]] && install -Dm644 PLUGINS.md "$pkgdir/usr/share/doc/$pkgname/PLUGINS.md"
    [[ -f "KEYBINDINGS.md" ]] && install -Dm644 KEYBINDINGS.md "$pkgdir/usr/share/doc/$pkgname/KEYBINDINGS.md"
    
    # Install example configurations (if examples directory exists)
    if [[ -d "examples" ]]; then
        install -dm755 "$pkgdir/usr/share/$pkgname/examples"
        # Install only .toml configuration files
        find examples -name "*.toml" -exec install -m644 {} "$pkgdir/usr/share/$pkgname/examples/" \;
    fi
    
    # Install systemd user service (if exists)
    if [[ -f "contrib/rustrland.service" ]]; then
        install -Dm644 "contrib/rustrland.service" "$pkgdir/usr/lib/systemd/user/rustrland.service"
    fi
    
    # Install desktop entry for GUI integration (if exists)
    if [[ -f "contrib/rustrland.desktop" ]]; then
        install -Dm644 "contrib/rustrland.desktop" "$pkgdir/usr/share/applications/rustrland.desktop"
    fi
    
    # Install shell completions (if they exist)
    if [[ -d "completions" ]]; then
        install -dm755 "$pkgdir/usr/share/bash-completion/completions"
        install -dm755 "$pkgdir/usr/share/zsh/site-functions" 
        install -dm755 "$pkgdir/usr/share/fish/vendor_completions.d"
        
        [[ -f "completions/rustrland.bash" ]] && install -m644 "completions/rustrland.bash" "$pkgdir/usr/share/bash-completion/completions/rustrland"
        [[ -f "completions/_rustrland" ]] && install -m644 "completions/_rustrland" "$pkgdir/usr/share/zsh/site-functions/_rustrland"
        [[ -f "completions/rustrland.fish" ]] && install -m644 "completions/rustrland.fish" "$pkgdir/usr/share/fish/vendor_completions.d/rustrland.fish"
    fi
}

# vim:set ts=4 sw=4 et: