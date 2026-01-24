# Maintainer: aydiler <aydiler@users.noreply.github.com>
pkgname=logiops-rs
pkgver=0.1.0
pkgrel=1
pkgdesc="Logitech device configuration daemon (Rust rewrite)"
arch=('x86_64')
url="https://github.com/aydiler/logiops-rs"
license=('GPL-2.0-only')
depends=('systemd-libs')
makedepends=('rust' 'cargo')
provides=('logiops')
conflicts=('logiops')
backup=('etc/logiops/config.toml')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$pkgname-$pkgver"
    export CARGO_TARGET_DIR=target
    cargo build --release --locked --package logiops-daemon
}

check() {
    cd "$pkgname-$pkgver"
    export CARGO_TARGET_DIR=target
    cargo test --release --locked --lib
}

package() {
    cd "$pkgname-$pkgver"

    # Binary
    install -Dm755 "target/release/logiops" "$pkgdir/usr/bin/logiops"

    # Configuration
    install -Dm644 "config/default.toml" "$pkgdir/etc/logiops/config.toml"

    # systemd service
    install -Dm644 "data/systemd/logiops.service" "$pkgdir/usr/lib/systemd/system/logiops.service"

    # udev rules
    install -Dm644 "data/udev/99-logiops.rules" "$pkgdir/usr/lib/udev/rules.d/99-logiops.rules"

    # D-Bus policy
    install -Dm644 "data/dbus/org.logiops.conf" "$pkgdir/usr/share/dbus-1/system.d/org.logiops.conf"

    # License
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Documentation
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
