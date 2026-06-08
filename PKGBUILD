# Maintainer: Bendik Aagaard Lynghaug <bendik.lynghaug@gmail.com>
pkgname=gpupaper-git
pkgver=r1.f53340a
pkgrel=1
pkgdesc="Wayland layer-surface wallpaper runner powered by GLSL/WGSL fragment shaders (wgpu)"
arch=('x86_64' 'aarch64')
url="https://prosjekt.klingenbergbygg.no/bl/gpupaper"
license=('MIT')
depends=('wayland' 'libglvnd')
makedepends=('rust' 'cargo')
optdepends=(
    'vulkan-icd-loader: Vulkan backend (generic loader)'
    'mesa: open-source Vulkan/OpenGL for AMD, Intel, and Raspberry Pi'
    'nvidia-utils: NVIDIA Vulkan/OpenGL support'
)
provides=('gpupaper')
conflicts=('gpupaper')
source=("gpupaper::git+https://prosjekt.klingenbergbygg.no/bl/gpupaper.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/gpupaper"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/gpupaper"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/gpupaper"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "$srcdir/gpupaper"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen
}

package() {
    cd "$srcdir/gpupaper"

    install -Dm755 "target/release/gpupaper" "$pkgdir/usr/bin/gpupaper"

    # Example shaders
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Example shaders
    install -dm755 "$pkgdir/usr/share/gpupaper/shaders"
    install -Dm644 shaders/*.frag "$pkgdir/usr/share/gpupaper/shaders/"
}
