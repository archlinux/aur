# Maintainer: Henri Koski <henri.koski@bitbrewers.fi>
pkgname=hcibridge
pkgver=1.0.4
pkgrel=1
pkgdesc="Attach remote ESP32 Bluetooth bridges to the local Bluetooth stack"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/heppu/hcibridge"
license=('MIT')
depends=('bluez')
makedepends=('zig')
backup=('etc/hcibridge/hcibridge.conf' 'etc/hcibridge/hcibridge.conf.d/50-example.conf' 'etc/default/hcibridge')
source=("$pkgname-$pkgver.tar.gz::https://github.com/heppu/hcibridge/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c3a36a08b2812a6cb0b0853a20a09d07ee32e8b1f715c06e518258d49393917c')

build() {
    cd "hcibridge-$pkgver"
    zig build -Doptimize=ReleaseSafe
    zig build gen
}

check() {
    cd "hcibridge-$pkgver"
    zig build test
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
    install -Dm644 host/config/hcibridge.conf "$pkgdir/etc/hcibridge/hcibridge.conf"
    install -Dm644 host/config/hcibridge.conf.d/50-example.conf "$pkgdir/etc/hcibridge/hcibridge.conf.d/50-example.conf"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
