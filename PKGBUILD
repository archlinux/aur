# Maintainer: Mara Vexa <me@maravexa.com>
pkgname=hyprdeck
pkgver=0.1.0
pkgrel=1
pkgdesc="A Wayland-native panel, taskbar, and dock for Hyprland"
arch=('x86_64')
url="https://github.com/maravexa/hyprdeck"
license=('MIT')
# GCC LTO objects from ring are not linkable by Rust toolchains configured
# with LLVM's lld. Rust's release profile still performs its own optimization.
options=('!lto')
depends=(
    'fontconfig'
    'libxkbcommon'
    'wayland'
)
makedepends=(
    'cargo'
    'rust'
)
optdepends=(
    'hyprland: compositor integration'
    'hyprlock: default lock action'
    'hyprcube: settings launcher module'
    'wireplumber: wpctl sound control backend'
    'wofi: default application menu action'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/maravexa/hyprdeck/archive/v$pkgver.tar.gz")
# Replace with `updpkgsums` after the release tag is available.
sha256sums=('5be136df342c768a8837d57ed52550955aeb06a3399eda178e34a9f339b3e996')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo build --release --locked -p hyprdeck
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 target/release/hyprdeck "$pkgdir/usr/bin/hyprdeck"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
