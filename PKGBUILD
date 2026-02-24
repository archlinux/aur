# Maintainer: Ermenegildo Fiorito <gildo.fiorito@gmail.com>
pkgname=accentd
pkgver=0.2.1
pkgrel=1
pkgdesc="Press-and-hold accent character popup for Linux (macOS-style)"
arch=('x86_64')
url="https://github.com/gildo/accentd"
license=('MIT')
depends=('gtk4' 'gtk4-layer-shell')
makedepends=('cargo' 'pkgconf')
install=accentd.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c653f08e0df686b701f8e8fac67cfb0a9a671e76bc93277a86e939d9bfad1412')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --workspace
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo test --frozen --workspace
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm0755 target/release/accentd "$pkgdir/usr/bin/accentd"
    install -Dm0755 target/release/accentd-popup "$pkgdir/usr/bin/accentd-popup"
    install -Dm0755 target/release/accentctl "$pkgdir/usr/bin/accentctl"

    install -Dm644 dist/accentd.service "$pkgdir/usr/lib/systemd/system/accentd.service"
    install -Dm644 dist/accentd-popup.service "$pkgdir/usr/lib/systemd/user/accentd-popup.service"
    install -Dm644 dist/70-accentd.rules "$pkgdir/usr/lib/udev/rules.d/70-accentd.rules"

    install -dm755 "$pkgdir/usr/share/accentd/locales"
    install -Dm644 data/locales/*.toml "$pkgdir/usr/share/accentd/locales/"
    install -Dm644 data/config.default.toml "$pkgdir/usr/share/accentd/config.default.toml"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
