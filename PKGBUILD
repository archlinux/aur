# Maintainer: Mara Vexa <me@maravexa.com>
pkgname=hyprsaver
pkgver=0.4.4
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
sha256sums=('d7218205b11663e014afe3480b6cb44d6f9817c2e4e47680b990bfc00991047c')

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
    install -Dm644 examples/hyprsaver.toml   "$pkgdir/usr/share/$pkgname/examples/config.toml"
}
