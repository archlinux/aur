# Maintainer: Mattdef <mattdef@gmail.com>
# Contributor: Rustrland Contributors

pkgname=rustrland
pkgver=0.3.8
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
    'hyprpaper: Wallpaper backend for hyprland'
    'foot: Recommended terminal for scratchpad plugin'
    'firefox: Browser support for scratchpad plugin'
    'thunar: File manager support for scratchpad plugin'
)
makedepends=('rust' 'cargo')
conflicts=('rustrland-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mattdef/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('0f16bcb678ec9be54211b4c6810bf10b7a4bb7838f3af7a71a28b14da23c94d1')

build() {
    cd "$pkgname-$pkgver"
    
    # Set environment variables for optimized build
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    
    # Build with optimizations
    cargo build --release
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