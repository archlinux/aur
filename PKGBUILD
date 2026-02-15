pkgname=v2ray-rs
pkgver=0.3.10
pkgrel=1
pkgdesc="Linux desktop GUI for v2ray/xray/sing-box proxy management"
arch=('x86_64')
url="https://github.com/victorzhuk/v2ray-rs"
license=('MIT')
depends=('gtk4' 'libadwaita' 'dbus')
makedepends=('rust' 'cargo')
optdepends=(
    'v2ray: V2Ray proxy backend'
    'xray: Xray proxy backend'
    'sing-box: sing-box proxy backend'
)
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('b569bda9cf22776a2625891380628ccd0d394566b980d50502c0bf5a032b2b40')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release -p v2ray-rs-ui
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/v2ray-rs-ui" "$pkgdir/usr/bin/v2ray-rs"
    install -Dm644 "assets/v2ray-rs.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/com.github.v2ray-rs.svg"
    install -Dm644 "assets/v2ray-rs.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/com.github.v2ray-rs.png"
    install -Dm644 "crates/ui/icons/hicolor/symbolic/apps/com.github.v2ray-rs-symbolic.svg" \
        "$pkgdir/usr/share/icons/hicolor/symbolic/apps/com.github.v2ray-rs-symbolic.svg"
    install -Dm644 "assets/com.github.v2ray-rs.desktop" "$pkgdir/usr/share/applications/com.github.v2ray-rs.desktop"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
