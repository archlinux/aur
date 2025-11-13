# Maintainer: RAprogramm <andrey.rozanov.vl@gmail.com>
pkgname=logi-mx
pkgver=0.3.0
pkgrel=1
pkgdesc="Logitech MX Master 3S configuration tool and daemon with system tray"
arch=('x86_64')
url="https://github.com/RAprogramm/logi-mx"
license=('MIT')
depends=('hidapi' 'systemd' 'gtk4' 'libadwaita' 'dbus')
makedepends=('rustup')
install=logi-mx.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/RAprogramm/logi-mx/archive/v$pkgver.tar.gz")
sha256sums=('e9c6b88a0fcb1491d80b9655d84893faca992ec00cc2436a21d2d60ab3f24078')

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --locked --all-features
}

check() {
    cd "$pkgname-$pkgver"
    cargo test --release --locked --all-features
}

package() {
    cd "$pkgname-$pkgver"

    # Install binaries
    install -Dm755 target/release/logi-mx "$pkgdir/usr/bin/logi-mx"
    install -Dm755 target/release/logi-mx-daemon "$pkgdir/usr/bin/logi-mx-daemon"
    install -Dm755 target/release/logi-mx-ui "$pkgdir/usr/bin/logi-mx-ui"

    # Install udev rules
    install -Dm644 90-logi-mx.rules "$pkgdir/usr/lib/udev/rules.d/90-logi-mx.rules"

    # Install systemd user service
    install -Dm644 logi-mx-daemon.service "$pkgdir/usr/lib/systemd/user/logi-mx-daemon.service"

    # Install desktop file
    install -Dm644 logi-mx-daemon.desktop "$pkgdir/usr/share/applications/logi-mx-daemon.desktop"

    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
