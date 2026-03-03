# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=papdieo-git
_pkgname="${pkgname%-git}"
pkgver=0.1.6.r0.g0691aee
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
source=("$_pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
    git -C "$_pkgname" describe --long --abbrev=7 | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
    export RUSTUP_TOOLCHAIN=stable

    cd "$_pkgname"
    cargo update
    cargo fetch --locked --target host-tuple
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cd "$_pkgname"
    cargo build --release --frozen --all-features
}

check() {
    export RUSTUP_TOOLCHAIN=stable

    cd "$_pkgname"
    cargo test --frozen --all-features
}

package() {
    cd "$_pkgname"
    install -Dm755 "target/release/$_pkgname" -t "$pkgdir/usr/bin/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
