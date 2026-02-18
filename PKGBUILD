# Maintainer: Lenar Imamutdinov <lenar dot imamutdinov at gmail dot com>
pkgname=wlcontrol
pkgver=0.1.0
pkgrel=1
pkgdesc="WiFi and Bluetooth control app, built with GTK4/libadwaita"
arch=('x86_64')
url="https://github.com/neoden/wlcontrol"
license=('MIT')
depends=('gtk4' 'libadwaita' 'dbus')
makedepends=('cargo' 'blueprint-compiler' 'gcc' 'pkgconf')
optdepends=(
    'iwd: WiFi support'
    'bluez: Bluetooth support'
)
conflicts=('wlcontrol-git')
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::https://github.com/neoden/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9984139101d5601665b8a3cf1666eeb3295251b396712914a96570cd28ba0318')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "data/dev.neoden.wlcontrol.desktop" "$pkgdir/usr/share/applications/dev.neoden.wlcontrol.desktop"
    install -Dm644 "data/icons/hicolor/scalable/apps/dev.neoden.wlcontrol.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/dev.neoden.wlcontrol.svg"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
