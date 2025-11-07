# Maintainer: il1v3y <ind4skylivey@proton.me>
pkgname=gleam-observer
pkgver=1.5.0
pkgrel=2
pkgdesc="Universal Hardware Monitor - Daemon with System Tray Integration"
arch=('x86_64')
url="https://github.com/ind4skylivey/Gleam-Observer"
license=('MIT' 'Apache')
depends=('gcc-libs' 'libnotify' 'systemd')
makedepends=('rust' 'cargo' 'git')
optdepends=(
    'nvidia-utils: NVIDIA GPU monitoring support'
    'mesa-utils: AMD GPU monitoring support'
    'dunst: Desktop notifications daemon'
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
    
    cargo build --release --features nvidia,amd,intel,systray
}

check() {
    cd "$srcdir/Gleam-Observer"
    
    cargo test --release --features nvidia,amd,intel,systray
}

package() {
    cd "$srcdir/Gleam-Observer"
    
    # Binaries
    install -Dm755 "target/release/gleam" "$pkgdir/usr/bin/gleam"
    install -Dm755 "target/release/gleam-tray" "$pkgdir/usr/bin/gleam-tray"
    
    # Icon
    install -Dm644 "assets/gleamobserver.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/gleamobserver.png"
    
    # Systemd user service
    install -Dm644 "packaging/systemd/gleam-observer.service" "$pkgdir/usr/lib/systemd/user/gleam-observer.service"
    
    # Desktop autostart entry
    install -Dm644 "packaging/desktop/gleam-observer.desktop" "$pkgdir/etc/xdg/autostart/gleam-observer.desktop"
    
    # Config example
    install -Dm644 "config/default.toml" "$pkgdir/usr/share/doc/$pkgname/config-example.toml"
    
    # Licenses
    install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
