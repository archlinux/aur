# Maintainer: Kyle Jackson <your@email.com>
# paintfe — builds PaintFE from the tagged source tarball on GitHub.
# Update pkgver + sha256sums (run: updpkgsums) for each new release.

pkgname=paintfe
pkgver=1.2.15
pkgrel=1
pkgdesc="Fast, GPU-accelerated raster image editor"
arch=('x86_64' 'aarch64')
url="https://github.com/kylejckson/PaintFE"
license=('MIT')
depends=(
    'gcc-libs'
    'glibc'
    'libxkbcommon'
    'wayland'
    'libx11'
)
optdepends=(
    'vulkan-icd-loader: hardware-accelerated GPU rendering (recommended)'
    'mesa: software/OpenGL fallback rendering'
)
makedepends=(
    'rust'
    'cargo'
    'pkgconf'
    'gtk3'
    'libxcb'
    'vulkan-headers'
    'wayland-protocols'
    'openssl'
    'mesa'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('076edc23b6fb5aca5735efc31f91f3f5bad2a349150e2d873dc5b3c13620bc34')

prepare() {
    cd "PaintFE-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "PaintFE-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "PaintFE-$pkgver"
    install -Dm755 "target/release/PaintFE"                              "$pkgdir/usr/bin/PaintFE"
    install -Dm644 "assets/icons/app_icon.png"                           "$pkgdir/usr/share/icons/hicolor/256x256/apps/PaintFE.png"
    install -Dm644 "packaging/appimage/PaintFE.AppDir/PaintFE.desktop"   "$pkgdir/usr/share/applications/PaintFE.desktop"
    install -Dm644 "LICENSE.md"                                          "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
