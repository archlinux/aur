# Maintainer: subz69 <shyne69 at gmail dot com>
pkgname=nmlinkd
pkgver=0.2.1
pkgrel=1
pkgdesc="NetworkManager D-Bus bridge for netlink-based network stacks"
arch=('x86_64' 'aarch64')
url="https://github.com/subz69/nmlinkd"
license=('MIT')
depends=('dbus')
makedepends=('cargo')
provides=('networkmanager')
conflicts=('networkmanager')
install=nmlinkd.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('9d506b0da64a15aa46bf9538e85a8a8cd4228d0446ad865d195547b29194d1dd')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 target/release/nmlinkd "$pkgdir/usr/bin/nmlinkd"
    install -Dm644 dist/nmlinkd.service "$pkgdir/usr/lib/systemd/system/nmlinkd.service"
    install -Dm644 dist/org.freedesktop.NetworkManager.conf "$pkgdir/usr/share/dbus-1/system.d/org.freedesktop.NetworkManager.conf"
    install -Dm644 dist/org.freedesktop.NetworkManager.service "$pkgdir/usr/share/dbus-1/system-services/org.freedesktop.NetworkManager.service"
    install -Dm644 dist/org.freedesktop.NetworkManager.policy "$pkgdir/usr/share/polkit-1/actions/org.freedesktop.NetworkManager.policy"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
