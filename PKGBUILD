# Maintainer: Johannes Brüderl <johannes.bruederl@gmail.com>
pkgname=ezbar
pkgver=0.1.0
pkgrel=1
pkgdesc='GPU-rendered status bar for Sway (iced + wlr-layer-shell), with pluggable widgets'
arch=('x86_64')
url='https://github.com/birdayz/ezbar'
license=('MIT')
# ring (rustls' asm crypto) fails to link under makepkg's default LTO
options=('!lto')
# wgpu/winit dlopen these at runtime (so they do not show up in ldd):
depends=('gcc-libs' 'fontconfig' 'libxkbcommon' 'wayland' 'vulkan-icd-loader')
makedepends=('cargo')
optdepends=('sway: the compositor ezbar targets'
            'vulkan-radeon: Vulkan driver for AMD GPUs'
            'vulkan-intel: Vulkan driver for Intel GPUs'
            'nvidia-utils: Vulkan driver for NVIDIA GPUs')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('709be6d2a2cd80bc50224cf0ff04890cf5339ce44730f4d800ad407ba8d93325')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --bin ezbar
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    # --all-targets (i.e. not doctests) matches the project's CI test matrix
    cargo test --frozen --workspace --all-targets
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
