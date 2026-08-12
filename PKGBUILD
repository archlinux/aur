# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=papdieo
pkgver=0.2.3
pkgrel=1
pkgdesc="Hyprland-compatible wallpaper management CLI"
arch=(x86_64 aarch64)
url="https://github.com/xiaotinglian/papdieo"
license=(MIT)
depends=(gstreamer gst-plugins-base gst-plugins-good gst-plugins-bad gst-plugins-ugly gst-libav)
optdepends=(
    'nvidia-utils: better NVIDIA video decode path'
    'vulkan-icd-loader: better NVIDIA video decode path'
    'wayland-compositor')
makedepends=(git cargo)
source=("$pkgname::git+$url#tag=v$pkgver")
sha256sums=('76bca4ec879b9478b6d3933fd4cb880fd6d86223185126126c536867e39d21ed')

prepare() {
    export RUSTUP_TOOLCHAIN=stable

    cd "$pkgname"
    cargo update
    cargo fetch --locked --target host-tuple
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cd "$pkgname"
    cargo build --release --frozen --all-features
}

check() {
    export RUSTUP_TOOLCHAIN=stable

    cd "$pkgname"
    cargo test --frozen --all-features
}

package() {
    cd "$pkgname"
    install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
