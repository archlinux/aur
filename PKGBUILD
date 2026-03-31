# Maintainer: Louis Nelson Jr. <https://lousclues.com>
pkgname=vpn-shroud
pkgver=2.0.2
pkgrel=1
pkgdesc="A provider-agnostic VPN connection manager for Linux with kill switch, auto-reconnect, and system tray integration"
arch=('x86_64')
url="https://github.com/loujr/shroud"
license=('GPL-3.0-or-later')
depends=('networkmanager' 'dbus' 'gcc-libs' 'glibc')
makedepends=('rust')
optdepends=(
    'networkmanager-openvpn: OpenVPN support'
    'networkmanager-wireguard: WireGuard support'
    'iptables: kill switch (iptables backend)'
    'nftables: kill switch (nftables backend, preferred)'
)
provides=('shroud')
conflicts=('shroud')
options=(!lto)
backup=('etc/sudoers.d/shroud')
install=shroud.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/loujr/shroud/archive/v$pkgver.tar.gz")
sha256sums=('c736b7eddea62cd0366ef9cf83d1a87de5d39ce8e8004fa2e75463e46891ecbf')

prepare() {
    cd "shroud-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "shroud-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "shroud-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    # Only run unit tests — integration/security tests require D-Bus, NM, iptables
    cargo test --frozen --release --lib
}

package() {
    cd "shroud-$pkgver"

    # Binary
    install -Dm755 "target/release/shroud" "$pkgdir/usr/bin/shroud"

    # Systemd service (fix binary path for system package)
    install -Dm644 "assets/shroud.service" "$pkgdir/usr/lib/systemd/system/shroud.service"
    sed -i 's|/usr/local/bin/shroud|/usr/bin/shroud|g' "$pkgdir/usr/lib/systemd/system/shroud.service"

    # Sudoers rule for passwordless kill switch
    install -Dm440 "assets/sudoers.d/shroud" "$pkgdir/etc/sudoers.d/shroud"

    # Desktop entry (app launcher + autostart capable)
    install -Dm644 "autostart/shroud.desktop" "$pkgdir/usr/share/applications/shroud.desktop"

    # Example headless config
    install -Dm644 "assets/shroud-headless.conf.example" \
        "$pkgdir/usr/share/doc/$pkgname/shroud-headless.conf.example"

    # Documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/doc/$pkgname/LICENSE"
    install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"

    # Docs directory
    for doc in docs/*.md; do
        install -Dm644 "$doc" "$pkgdir/usr/share/doc/$pkgname/docs/$(basename "$doc")"
    done
}
