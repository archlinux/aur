# Maintainer: Softer <softer@lin.in.ua>
pkgname=razer-tray
pkgver=0.4.1
pkgrel=1
pkgdesc='Minimal Linux tray indicator for Razer wireless mouse and keyboard battery level'
arch=('x86_64')
url='https://github.com/Softer/razer-tray'
license=('MIT')
depends=('gcc-libs' 'dbus' 'openrazer-driver-dkms')
makedepends=('cargo')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::https://github.com/Softer/razer-tray/archive/v$pkgver.tar.gz")
sha256sums=('0bab653547f85463cba92fe9c7c0ddf98e36f8b1543fc36f36a5f24828a7f934')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo test --frozen --release
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 "target/release/$pkgname" \
        "$pkgdir/usr/bin/$pkgname"

    install -Dm644 "arch/$pkgname.service" \
        "$pkgdir/usr/lib/systemd/user/$pkgname.service"
    install -Dm644 "arch/$pkgname.desktop" \
        "$pkgdir/etc/xdg/autostart/$pkgname.desktop"
    install -Dm644 "arch/99-$pkgname.rules" \
        "$pkgdir/usr/lib/udev/rules.d/99-$pkgname.rules"
    install -Dm755 "arch/$pkgname-udev-trigger.sh" \
        "$pkgdir/usr/lib/$pkgname/udev-trigger"

    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md \
        "$pkgdir/usr/share/doc/$pkgname/README.md"

    install -d "$pkgdir/usr/share/$pkgname/icons"
    install -m644 icons/*.png "$pkgdir/usr/share/$pkgname/icons/"
}
