# Maintainer: Gergő Sályi <salyigergo94@gmail.com>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=multibg-wayland
pkgver=0.2.4
pkgrel=1
pkgdesc='Set a different wallpaper for the background of each Sway or Hyprland or niri workspace'
arch=('x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
url="https://github.com/gergo-salyi/multibg-wayland"
# Direct source files are MIT OR Apache-2.0 but have GPL-3.0-or-later dependencies
license=('GPL-3.0-or-later')
depends=('dav1d>=1.3.0' 'gcc-libs' 'glibc')
makedepends=('cargo')
optdepends=(
    'hyprland: supported window manager to set the wallpapers with'
    'niri: supported window manager to set the wallpapers with'
    'sway: supported window manager to set the wallpapers with'
    'vulkan-driver: upload and serve wallpapers from GPU memory'
    'vulkan-icd-loader: upload and serve wallpapers from GPU memory'
)
conflicts=('multibg-sway')
provides=('multibg-sway')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('83c87fc972418a5acc7b8aa75fcbff1a46e8f0d716a24a415a274ea985b41f0d')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --features avif
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    ln -rs "$pkgdir/usr/bin/$pkgname" "$pkgdir/usr/bin/multibg-sway"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
}
