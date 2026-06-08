# Maintainer: Rick Price <fprice@pricemail.ca>

pkgname=midi-daemon
pkgver=0.4.7
pkgrel=1
pkgdesc="A Lua-scriptable MIDI routing daemon"
arch=('x86_64')
url="https://github.com/rickprice/midi-daemon"
license=('BSD-3-Clause')
depends=('alsa-lib' 'gcc-libs' 'glibc')
makedepends=('cargo')
install=midi-daemon.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/rickprice/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('46608798afa79288eb91034daba504e319e98bd38bccb3513047ec88b1d014d9')

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

    # System service — fix ExecStart to use the installed binary path
    install -Dm644 "systemd/$pkgname-system.service" \
        "$pkgdir/usr/lib/systemd/system/$pkgname.service"
    sed -i 's|/usr/local/bin/midi-daemon|/usr/bin/midi-daemon|' \
        "$pkgdir/usr/lib/systemd/system/$pkgname.service"

    # User service — fix ExecStart to use the installed binary path
    install -Dm644 "systemd/$pkgname.service" \
        "$pkgdir/usr/lib/systemd/user/$pkgname.service"
    sed -i 's|%h/.cargo/bin/midi-daemon|/usr/bin/midi-daemon|' \
        "$pkgdir/usr/lib/systemd/user/$pkgname.service"

    # Dedicated system user with audio group membership
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/sysusers.d/$pkgname.conf" << EOF
u midi-daemon - "MIDI Lua Routing Daemon" /var/empty /usr/bin/nologin
m midi-daemon audio
EOF

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
