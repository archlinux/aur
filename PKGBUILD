# Maintainer: motudev <fabian.roos@motusoft.dev>
pkgname=tomatick
pkgver=0.1.0
pkgrel=1
pkgdesc="Modern, lightweight Pomodoro timer"
arch=('x86_64')
url="https://github.com/motudev/tomatick"
license=('MIT')
depends=('gtk4' 'libadwaita' 'dbus')
makedepends=('rust' 'cargo')
install=tomatick.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('aa1f70075af6beb3489fcd9ab0295d0e384024c659e246766858e4f75ba10fc8')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --lib
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "assets/icons/$pkgname.svg" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
    install -Dm644 "assets/icons/tray-break.svg" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname-break.svg"
    install -Dm644 "assets/dev.motusoft.Tomatick.desktop" \
        "$pkgdir/usr/share/applications/dev.motusoft.Tomatick.desktop"
    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
