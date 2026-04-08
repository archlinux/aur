# Maintainer: Mara Vexa <me@maravexa.com>
pkgname=hyprsaver
pkgver=0.1.0
pkgrel=1
pkgdesc="A Wayland-native screensaver for Hyprland — fractal shaders on wlr-layer-shell overlays"
arch=('x86_64')
url="https://github.com/maravexa/hyprsaver"
license=('MIT')
depends=(
    'wayland'
    'mesa'
)
makedepends=(
    'rust'
    'cargo'
)
optdepends=(
    'hypridle: idle daemon for automatic activation'
    'hyprlock: lock screen to pair with hyprsaver'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/maravexa/hyprsaver/archive/v$pkgver.tar.gz")
sha256sums=('a164aa7833a2f973996640a9bed25ffbfd4d714421101d0e2770a9f94523aefe')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo build --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 target/release/hyprsaver "$pkgdir/usr/bin/hyprsaver"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -dm755 "$pkgdir/usr/share/$pkgname/examples"
    install -Dm644 examples/hypridle.conf "$pkgdir/usr/share/$pkgname/examples/hypridle.conf"
    install -Dm644 examples/hyprland.conf "$pkgdir/usr/share/$pkgname/examples/hyprland.conf"
    install -Dm644 examples/config.toml   "$pkgdir/usr/share/$pkgname/examples/config.toml"
    install -Dm644 config.example.toml    "$pkgdir/usr/share/$pkgname/config.example.toml"
}
