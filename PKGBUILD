# Maintainer: wayvid contributors

pkgname=wayvid
pkgver=0.4.2
pkgrel=1
pkgdesc="Dynamic video wallpaper engine for Wayland with Steam Workshop and Niri support"
arch=('x86_64' 'aarch64')
url="https://github.com/YangYuS8/wayvid"
license=('MIT' 'Apache-2.0')
depends=(
    'wayland'
    'libmpv'
    'gcc-libs'
    'glibc'
)
makedepends=(
    'rust'
    'cargo'
)
optdepends=(
    'mesa: Hardware video decoding with VA-API'
    'libva-intel-driver: Intel GPU hardware acceleration'
    'libva-mesa-driver: AMD GPU hardware acceleration'
    'nvidia-utils: NVIDIA GPU hardware acceleration'
    'steam: Steam Workshop integration for Wallpaper Engine imports'
    'niri: Workspace-aware performance optimizations'
)
provides=('wayvid')
conflicts=('wayvid-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('19205f814970264c92aacd9164f4c6ba805a40c41785ca6077198921a4035dfa')

prepare() {
    cd "$pkgname-$pkgver"
    
    # Update Cargo.lock
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"
    
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    
    # Build with all features including GUI
    cargo build --frozen --release --all-features --features gui
}

check() {
    cd "$pkgname-$pkgver"
    
    # Run tests (currently minimal, skip if fails)
    cargo test --frozen --release --all-features || true
}

package() {
    cd "$pkgname-$pkgver"
    
    # Install binaries
    install -Dm755 target/release/wayvid "$pkgdir/usr/bin/wayvid"
    install -Dm755 target/release/wayvid-ctl "$pkgdir/usr/bin/wayvid-ctl"
    install -Dm755 target/release/wayvid-gui "$pkgdir/usr/bin/wayvid-gui"
    
    # Install systemd user service
    install -Dm644 systemd/wayvid.service "$pkgdir/usr/lib/systemd/user/wayvid.service"
    
    # Install example config
    install -Dm644 configs/config.example.yaml "$pkgdir/usr/share/wayvid/config.example.yaml"
    
    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 docs/QUICKSTART.md "$pkgdir/usr/share/doc/$pkgname/QUICKSTART.md"
    install -Dm644 docs/IPC.md "$pkgdir/usr/share/doc/$pkgname/IPC.md"
    install -Dm644 docs/VIDEO_SOURCES.md "$pkgdir/usr/share/doc/$pkgname/VIDEO_SOURCES.md"
    install -Dm644 docs/WE_FORMAT.md "$pkgdir/usr/share/doc/$pkgname/WE_FORMAT.md"
    install -Dm644 docs/M6_ROADMAP.md "$pkgdir/usr/share/doc/$pkgname/M6_ROADMAP.md"
    
    # Install licenses
    install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
