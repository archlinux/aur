# Maintainer: Rick Price <fprice@pricemail.ca>

pkgname=midi-daemon
pkgver=0.1.0
pkgrel=1
pkgdesc="A Lua-scriptable MIDI routing daemon"
arch=('x86_64')
url="https://github.com/rickprice/midi-daemon"
license=('BSD-3-Clause')
depends=('alsa-lib' 'gcc-libs' 'glibc')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rickprice/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('89e7d9b96cf7a2dae20f5313705d4677df8ceff364a6fa02a56d001e4cf2216b')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --frozen --offline
}

check() {
    cd "$pkgname-$pkgver"
    cargo test --frozen --offline
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

    # Fix ExecStart to use the installed binary path instead of ~/.cargo/bin
    install -Dm644 "systemd/$pkgname.service" "$pkgdir/usr/lib/systemd/user/$pkgname.service"
    sed -i 's|%h/.cargo/bin/midi-daemon|/usr/bin/midi-daemon|' \
        "$pkgdir/usr/lib/systemd/user/$pkgname.service"

    install -Dm644 config.toml "$pkgdir/usr/share/doc/$pkgname/config.toml.example"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
