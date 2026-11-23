# Maintainer: Clemens Brunner <clemens.brunner@gmail.com>

pkgname=kymo
pkgver=0.1.0
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
# ${pkgver} with braces: the updater then bumps pkgver= and leaves the URL as it is.
source=("$pkgname-$pkgver.tar.gz::https://github.com/cbrnr/kymo/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ed842b1c684cd3f74d0a3a08431b597b813b9d8d7d2c179587ec548fef78b0b7')

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

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    # The readers, the pyramid and the tiles; the viewer's tests need fonts and a GPU.
    cargo test --frozen -p kymo-core
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
