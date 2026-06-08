# Maintainer: mryll <https://github.com/mryll>
pkgname=printbar
pkgver=0.1.0
pkgrel=1
pkgdesc='Generic printer monitor for Waybar (IPP + SNMP + CUPS) — supplies, trays, jobs, panel text; instant push on print; Omarchy theming'
arch=('x86_64')
url='https://github.com/mryll/printbar'
license=('MIT')
depends=('gcc-libs')
optdepends=('cups: CUPS source, queue action and the instant-push service'
            'libnotify: desktop notifications'
            'xdg-utils: open the EWS / queue on click')
makedepends=('cargo')
options=(!debug)
source=("$pkgname-$pkgver.tar.gz::https://github.com/mryll/printbar/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2f0707e9647e5472190dacd5b9e603169ac892b2848bba301278c5b298443d0c')

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo build --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 target/release/printbar "$pkgdir/usr/bin/printbar"
    install -Dm755 printbar-watch "$pkgdir/usr/bin/printbar-watch"
    sed 's|@BIN@|/usr/bin|' printbar-watch.service > "$srcdir/printbar-watch.service.pkg"
    install -Dm644 "$srcdir/printbar-watch.service.pkg" "$pkgdir/usr/lib/systemd/user/printbar-watch.service"
    install -Dm644 config.example.toml "$pkgdir/usr/share/printbar/config.example.toml"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
