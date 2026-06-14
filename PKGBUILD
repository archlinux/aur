# Maintainer: Johannes Brüderl <johannes.bruederl@gmail.com>
pkgname=ezbar
pkgver=0.1.13
pkgrel=1
pkgdesc='GPU-rendered status bar for Sway (iced + wlr-layer-shell), with pluggable widgets'
arch=('x86_64')
url='https://github.com/birdayz/ezbar'
license=('MIT')
# ring (rustls' asm crypto) fails to link under makepkg's default LTO
options=('!lto')
# wgpu/winit dlopen wayland/xkbcommon/vulkan at runtime (so ldd shows only libc);
# vulkan-driver (a virtual provided by vulkan-radeon/intel/nvidia/...) guarantees a
# usable ICD so it renders on a fresh box.
depends=('glibc' 'gcc-libs' 'libxkbcommon' 'wayland' 'vulkan-icd-loader' 'vulkan-driver')
makedepends=('cargo')
optdepends=('sway: the wlroots compositor ezbar targets'
            'noto-fonts-emoji: emoji glyphs in the bar')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('753f9aff7ad32c1b0bb03f8d03bb436a857297dc2fa5d35883e12a677c71a993')

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
