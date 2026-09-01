# Maintainer: mryll <https://github.com/mryll>
pkgname=printbar
pkgver=0.5.2
pkgrel=1
pkgdesc='Generic printer monitor for Waybar (IPP + SNMP + CUPS) — supplies, trays, jobs, panel text; instant push on print; Omarchy theming'
arch=('x86_64')
url='https://github.com/mryll/printbar'
license=('MIT')
depends=('gcc-libs')
optdepends=('cups: CUPS source, queue action and the instant-push service'
            'libnotify: desktop notifications'
            'xdg-utils: open the EWS / queue on click'
            'ttf-jetbrains-mono-nerd: monospace font the tooltip pins by default (tooltip_font)')
makedepends=('cargo')
options=(!debug)
source=("$pkgname-$pkgver.tar.gz::https://github.com/mryll/printbar/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('26e1a033099dcd823eaa176baaae4572971dd6fd391ced3ddde5dcf2dfa4d67e')

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
