# Maintainer: Rick Price <fprice@pricemail.ca>

pkgname=midi-daemon
pkgver=0.3.0
pkgrel=1
pkgdesc="A Lua-scriptable MIDI routing daemon"
arch=('x86_64')
url="https://github.com/rickprice/midi-daemon"
license=('BSD-3-Clause')
depends=('alsa-lib' 'gcc-libs' 'glibc')
makedepends=('cargo')
backup=('etc/midi-daemon/config.toml')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rickprice/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e117e683522b4450922c85c6dbb2946e02b4a09052f076ab56bddba658d757af')

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

    # System-wide config and empty routes directory
    install -Dm644 config.toml "$pkgdir/etc/$pkgname/config.toml"
    install -dm755 "$pkgdir/etc/$pkgname/routes.d"

    # Example Lua routes — copy to /etc/midi-daemon/routes.d/ to activate
    for lua in routes.d/*.lua; do
        install -Dm644 "$lua" "$pkgdir/usr/share/doc/$pkgname/examples/$lua"
    done

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
