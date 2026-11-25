# Maintainer: Clemens Brunner <clemens.brunner@gmail.com>

pkgname=kymo
pkgver=0.2.0
pkgrel=1
pkgdesc="Viewer for large EEG and MEG recordings"
arch=('x86_64' 'aarch64')
url="https://github.com/cbrnr/kymo"
license=('BSD-3-Clause')
# Loaded at run time rather than linked: Vulkan for wgpu, the window system for winit, the
# desktop portal for file dialogs.
depends=('libgcc' 'glibc' 'hicolor-icon-theme' 'libxkbcommon' 'vulkan-icd-loader'
         'wayland' 'libx11' 'libxcursor' 'libxi' 'libxrandr' 'xdg-desktop-portal')
makedepends=('cargo')
optdepends=('vulkan-driver: GPU rendering (mesa or the vendor driver provide one)')
# makepkg's LTO compiles C dependencies (ring's) to GCC bitcode, which rust-lld, Rust's linker
# on x86_64 Linux since 1.90, can't read: the link then misses their symbols.
options=('!lto')
# ${pkgver} with braces: the updater then bumps pkgver= and leaves the URL as it is.
source=("$pkgname-$pkgver.tar.gz::https://github.com/cbrnr/kymo/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a3783f66757554f9dfd44d2bc2bbecb625741b427d1ded6c13edf7d0b94f6539')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release -p kymo
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 target/release/kymo "$pkgdir/usr/bin/kymo"
    install -Dm644 packaging/linux/kymo.desktop "$pkgdir/usr/share/applications/kymo.desktop"
    install -Dm644 packaging/linux/kymo.xml "$pkgdir/usr/share/mime/packages/kymo.xml"
    for size in 16 24 32 48 64 128 256 512; do
        install -Dm644 "crates/kymo/assets/png/kymo-$size.png" \
            "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/kymo.png"
    done
    install -Dm644 crates/kymo/assets/kymo.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/kymo.svg"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
