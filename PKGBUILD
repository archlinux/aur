# Maintainer: RAprogramm <andrey.rozanov.vl@gmail.com>
pkgname=logi-mx
pkgver=0.7.0
pkgrel=1
pkgdesc="Logitech MX Master 3S configuration tool and daemon with system tray"
arch=('x86_64')
url="https://github.com/RAprogramm/logi-mx"
license=('MIT')
depends=('hidapi' 'systemd' 'gtk4' 'libadwaita' 'dbus')
makedepends=('rustup')
install=logi-mx.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/RAprogramm/logi-mx/archive/v$pkgver.tar.gz")
# Filled by the release pipeline when the v$pkgver tag exists:
#   curl -sL "https://github.com/RAprogramm/logi-mx/archive/v$pkgver.tar.gz" | sha256sum
sha256sums=('SKIP')

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
    install -Dm755 target/release/logi-mx-overlay "$pkgdir/usr/bin/logi-mx-overlay"

    # Install udev rules
    install -Dm644 90-logi-mx.rules "$pkgdir/usr/lib/udev/rules.d/90-logi-mx.rules"

    # Install systemd user units
    install -Dm644 logi-mx-daemon.service "$pkgdir/usr/lib/systemd/user/logi-mx-daemon.service"
    install -Dm644 logi-mx-daemon.socket "$pkgdir/usr/lib/systemd/user/logi-mx-daemon.socket"
    install -Dm644 overlay/logi-mx-overlay.service "$pkgdir/usr/lib/systemd/user/logi-mx-overlay.service"
    sed -i "s#^ExecStart=.*#ExecStart=/usr/bin/logi-mx-overlay#" "$pkgdir/usr/lib/systemd/user/logi-mx-overlay.service"

    # Load uinput at boot for gesture key injection
    install -Dm644 uinput.conf "$pkgdir/usr/lib/modules-load.d/uinput.conf"

    # Install desktop files
    install -Dm644 logi-mx-daemon.desktop "$pkgdir/usr/share/applications/logi-mx-daemon.desktop"
    install -Dm644 logi-mx-ui.desktop "$pkgdir/usr/share/applications/logi-mx-ui.desktop"

    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
