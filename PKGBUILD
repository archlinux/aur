# Maintainer: Rick Price <fprice@pricemail.ca>

pkgname=midi-daemon
pkgver=0.5.0
pkgrel=1
pkgdesc="A Lua-scriptable MIDI routing daemon"
arch=('x86_64')
url="https://github.com/rickprice/midi-daemon"
license=('BSD-3-Clause')
depends=('alsa-lib' 'gcc-libs' 'glibc')
makedepends=('cargo')
install=midi-daemon.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/rickprice/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6fb59bbabef137f17734d217e3b7d4a2729d1f381b820ab58d3e8ed36f673956')

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

    # System service — Arch-specific file already uses /usr/bin path and CLI flags
    install -Dm644 "systemd/arch/$pkgname.service" \
        "$pkgdir/usr/lib/systemd/system/$pkgname.service"

    # User service — fix ExecStart to use the installed binary path
    install -Dm644 "systemd/$pkgname.service" \
        "$pkgdir/usr/lib/systemd/user/$pkgname.service"
    sed -i 's|%h/.cargo/bin/midi-daemon|/usr/bin/midi-daemon|' \
        "$pkgdir/usr/lib/systemd/user/$pkgname.service"

    # System user — audio access is via SupplementaryGroups=audio in the service
    install -Dm644 "systemd/arch/sysusers.conf" \
        "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"

    # Empty routes directory (config installed by .install script only if absent)
    install -dm755 "$pkgdir/etc/$pkgname/routes.d"

    # Sample config
    install -Dm644 config.toml "$pkgdir/usr/share/doc/$pkgname/config.toml"

    # Example Lua routes — copy to /etc/midi-daemon/routes.d/ to activate
    for lua in routes.d/*.lua; do
        install -Dm644 "$lua" "$pkgdir/usr/share/doc/$pkgname/examples/$lua"
    done

    # TouchOSC layout samples — companion layouts for the example routes
    for tosc in TouchOSC/*.tosc; do
        install -Dm644 "$tosc" "$pkgdir/usr/share/doc/$pkgname/examples/$tosc"
    done

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
