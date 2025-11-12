# Maintainer: RAprogramm <andrey.rozanov.vl@gmail.com>
pkgname=logi-mx
pkgver=0.1.1
pkgrel=1
pkgdesc="Logitech MX Master 3S configuration tool and daemon with system tray"
arch=('x86_64')
url="https://github.com/RAprogramm/logi-mx"
license=('MIT')
depends=('hidapi' 'systemd' 'gtk4' 'libadwaita' 'dbus')
makedepends=('cargo' 'rust>=1.91')
source=("$pkgname-$pkgver.tar.gz::https://github.com/RAprogramm/logi-mx/archive/v$pkgver.tar.gz")
sha256sums=('9fcab19c8fc070ea53e174cf44b21989f3a0b4a7397cd323ef9e7523a15fc2b5')

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

    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
