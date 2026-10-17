# Maintainer: Dmitry Yarikov <dmitry@yarikov.com>
pkgname=kvn-bin
pkgver=0.35.0
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
provides=('kvn' 'kvn-tui')
conflicts=('kvn' 'kvn-tui')
source=("https://github.com/yarikov/kvn/releases/download/v0.35.0/kvn-0.35.0-x86_64-linux.tar.gz")
sha256sums=('16ee0c663ae2fd83e2e71cd05afbc676f77062ed49a09423aed347d08ca55464')

package() {
    cd "kvn-tui-0.35.0-x86_64-linux"
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
