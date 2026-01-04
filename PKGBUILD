# Maintainer: mfw <espadonne@outlook.com>

pkgname=hyprkvm
pkgver=0.5.2
pkgrel=1
pkgdesc='Hyprland-native software KVM switch for seamless keyboard/mouse sharing between Linux machines'
arch=('x86_64')
url='https://github.com/tenseleyFlow/hyprKVM'
license=('MIT')
depends=('wayland' 'libxkbcommon' 'openssl')
makedepends=('rust' 'cargo' 'pkg-config' 'wayland-protocols' 'clang' 'cmake' 'perl')
optdepends=('wl-clipboard: for clipboard synchronization')
source=("git+https://github.com/tenseleyFlow/hyprKVM.git#tag=v$pkgver")
sha256sums=('SKIP')

prepare() {
    cd hyprKVM
    # Clean any stale build artifacts
    rm -rf target
}

build() {
    cd hyprKVM
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    # Use clang for ring crate assembly compilation
    export CC=clang
    export CXX=clang++
    cargo build --release --locked
}

check() {
    cd hyprKVM
    cargo test --release --locked || true
}

package() {
    cd hyprKVM

    # Install binaries
    install -Dm755 target/release/hyprkvm "$pkgdir/usr/bin/hyprkvm"
    install -Dm755 target/release/hyprkvm-ctl "$pkgdir/usr/bin/hyprkvm-ctl"

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

    # Install example config
    install -Dm644 config/hyprkvm.example.toml "$pkgdir/usr/share/doc/$pkgname/hyprkvm.example.toml"
}
