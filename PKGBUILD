# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=papdieo
pkgver=0.1.6
pkgrel=1
pkgdesc="Hyprland-compatible wallpaper management CLI"
arch=('x86_64' 'aarch64')
url="https://github.com/xiaotinglian/papdieo"
license=('MIT')
depends=('gstreamer' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad' 'gst-plugins-ugly' 'gst-libav')
optdepends=(
    'nvidia-utils: better NVIDIA video decode path'
    'vulkan-icd-loader: better NVIDIA video decode path'
    'wayland-compositor')
makedepends=('git' 'cargo')
source=("$pkgname::git+$url#tag=v$pkgver")
sha256sums=('ef58f395af41dab9a8f4a6ebb3445204da57b5b76d9f4321e71c9be0b9803d86')

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
