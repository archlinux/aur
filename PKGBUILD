# Maintainer: Dmitry Yarikov <dmitry@yarikov.com>
pkgname=kvn-tui-bin
pkgver=0.32.0
pkgrel=1
pkgdesc="Terminal VPN client for Arch Linux with vim navigation"
arch=('x86_64')
url="https://github.com/yarikov/kvn"
license=('MIT')
install=kvn-tui.install
depends=('gcc-libs' 'dbus' 'libcap' 'sing-box')
optdepends=(
    'xdg-utils: open the project support page from the TUI'
    'wl-clipboard: clipboard integration on Wayland'
    'xclip: clipboard integration on X11 (preferred)'
    'xsel: clipboard integration on X11 (alternative)'
)
provides=('kvn-tui')
conflicts=('kvn-tui')
source=("https://github.com/yarikov/kvn/releases/download/v0.32.0/kvn-tui-0.32.0-x86_64-linux.tar.gz")
sha256sums=('21c4f755032371f365ac1c41a66d2a5b2bb36a70fd56eef0de3cdb1aed1124ed')

package() {
    cd "kvn-tui-0.32.0-x86_64-linux"
    install -Dm755 kvn-tui "$pkgdir/usr/bin/kvn-tui"
    ln -s kvn-tui "$pkgdir/usr/bin/kvn"
    install -dm755 "$pkgdir/usr/lib/kvn/migrations"
    for migration in migrations/*.sh; do
        [[ -f "$migration" ]] || continue
        install -m755 "$migration" "$pkgdir/usr/lib/kvn/migrations/"
    done
    install -Dm644 kvn-tui.service "$pkgdir/usr/lib/systemd/user/kvn-tui.service"
    install -Dm644 kvn-tui-sing-box-capabilities.hook \
        "$pkgdir/usr/share/libalpm/hooks/kvn-tui-sing-box-capabilities.hook"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
