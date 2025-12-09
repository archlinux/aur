pkgname=lightningview
pkgver=2.4.0
pkgrel=1
pkgdesc="A lightning-fast cross-platform image viewer written in Rust, supporting many raw camera formats."
arch=('x86_64')
url="https://github.com/dividebysandwich/LightningView"
license=('GPL-2.0-or-later')
depends=('hicolor-icon-theme' 'libxkbcommon' 'libx11' 'libxcursor' 'libxrandr' 'libxi' 'fontconfig' 'dbus' 'openssl')
makedepends=('rust' 'cargo')
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/dividebysandwich/LightningView/archive/refs/tags/v$pkgver.tar.gz"
    "$pkgname.desktop"
    "logo_256.png"
)
sha256sums=('12998cb29b64dde7855123b4eb91955f1bb31c03d75821a9f185fe01118b422b'
            '830ce1fe85eb1e00530d020e1c0f735e77e10909d2575e84db231023ce42a99b'
            '09492ed9bde5eb1d4857e2551c0fabcaf57bdd873d09c0112b3b27ef01135893')

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd "LightningView-$pkgver"
    cargo fetch --locked --target $(rustc --print host-tuple)
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd "LightningView-$pkgver"
    cargo build --release --frozen
}

package() {
    cd "LightningView-$pkgver"

    # Install the main binary
    install -Dm755 "target/release/lightningview" "$pkgdir/usr/bin/lightningview"

    # Install the license file
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Install the .desktop file for application menus
    install -Dm644 "../$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

    # Install the application icon
    install -Dm644 "../logo_256.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
}
