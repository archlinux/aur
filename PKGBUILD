# Maintainer: Henri Koski <henri.koski@bitbrewers.fi>
pkgname=hcibridge
pkgver=1.0.2
pkgrel=1
pkgdesc="Attach remote ESP32 Bluetooth bridges to the local Bluetooth stack"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/heppu/hcibridge"
license=('MIT')
depends=('bluez')
makedepends=('zig')
backup=('etc/hcibridge/config' 'etc/hcibridge/config.d/50-example.conf' 'etc/default/hcibridge')
source=("$pkgname-$pkgver.tar.gz::https://github.com/heppu/hcibridge/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ce1214d57abbf9acbeaa260dc5fbd275c2fe7766bf8ab3da85fc162b2a81f56a')

build() {
    cd "hcibridge-$pkgver"
    zig build -Doptimize=ReleaseSafe
    zig build gen
}

package() {
    cd "hcibridge-$pkgver"
    install -Dm755 zig-out/bin/hcibridge "$pkgdir/usr/bin/hcibridge"
    install -Dm644 zig-out/gen/hcibridge.1 "$pkgdir/usr/share/man/man1/hcibridge.1"
    install -Dm644 zig-out/gen/hcibridge.bash "$pkgdir/usr/share/bash-completion/completions/hcibridge"
    install -Dm644 zig-out/gen/_hcibridge "$pkgdir/usr/share/zsh/site-functions/_hcibridge"
    install -Dm644 zig-out/gen/hcibridge.fish "$pkgdir/usr/share/fish/vendor_completions.d/hcibridge.fish"
    install -Dm644 host/systemd/hcibridge.service "$pkgdir/usr/lib/systemd/system/hcibridge.service"
    install -Dm644 host/systemd/hcibridge.env "$pkgdir/etc/default/hcibridge"
    install -Dm644 host/modules-load.conf "$pkgdir/usr/lib/modules-load.d/hci_vhci.conf"
    install -Dm644 host/config/config "$pkgdir/etc/hcibridge/config"
    install -Dm644 host/config/config.d/50-example.conf "$pkgdir/etc/hcibridge/config.d/50-example.conf"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
