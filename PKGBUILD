# Maintainer: Dmitry Yarikov <dmitry@yarikov.com>
pkgname=kvn-tui-bin
pkgver=0.35.1
pkgrel=1
pkgdesc="Terminal VPN client for Arch Linux with vim navigation (transitional, replaced by kvn-bin)"
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
source=("https://github.com/yarikov/kvn/releases/download/v0.35.1/kvn-tui-0.35.1-x86_64-linux.tar.gz")
sha256sums=('2a92be96846543bf6b20b69d133a388ed302907a83e8354ae22a9a29427d92b5')

package() {
    cd "kvn-tui-0.35.1-x86_64-linux"
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
