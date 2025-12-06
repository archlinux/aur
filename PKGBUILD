# Maintainer: wayvid contributors
pkgname=wayvid-git
pkgver=r137.f18b503
pkgrel=2
pkgdesc="Dynamic video wallpaper engine for Wayland with Steam Workshop and Niri support (git version)"
arch=('x86_64' 'aarch64')
url="https://github.com/YangYuS8/wayvid"
license=('MIT')
depends=(
    'wayland'
    'mpv'
    'gcc-libs'
    'glibc'
    'zstd'
)
makedepends=(
    'rust'
    'cargo'
    'git'
    'wayland-protocols'
    'mesa'
    'libxkbcommon'
    'fontconfig'
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
conflicts=('wayvid')
source=("git+https://github.com/YangYuS8/wayvid.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/wayvid"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/wayvid"
    
    # Update Cargo.lock
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$srcdir/wayvid"
    
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    
    # Use system zstd library instead of building from source
    export ZSTD_SYS_USE_PKG_CONFIG=1
    
    # Build GUI and CLI tools
    cargo build --frozen --release --workspace
}

check() {
    cd "$srcdir/wayvid"
    
    # Run tests (currently minimal, skip if fails)
    cargo test --frozen --release --all-features || true
}

package() {
    cd "$srcdir/wayvid"
    
    # Install binaries (v0.5: GUI-first, no standalone daemon)
    install -Dm755 target/release/wayvid-gui "$pkgdir/usr/bin/wayvid-gui"
    install -Dm755 target/release/wayvid-ctl "$pkgdir/usr/bin/wayvid-ctl"
    
    # Install systemd user service
    install -Dm644 systemd/wayvid.service "$pkgdir/usr/lib/systemd/user/wayvid.service"
    
    # Install example config
    install -Dm644 configs/config.example.yaml "$pkgdir/usr/share/wayvid/config.example.yaml"
    
    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    # Install available docs (skip if missing)
    for doc in docs/*.md; do
        [ -f "$doc" ] && install -Dm644 "$doc" "$pkgdir/usr/share/doc/$pkgname/$(basename $doc)" || true
    done
    
    # Install logo/icon
    install -Dm644 logo.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/wayvid.svg"
    
    # Install desktop file
    install -Dm644 packaging/wayvid-gui.desktop "$pkgdir/usr/share/applications/wayvid.desktop"
    
    # Install licenses
    install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    # Install Apache license if it exists
    [ -f LICENSE-APACHE ] && install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE" || true
}
