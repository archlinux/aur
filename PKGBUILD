# Maintainer: Dmitry Yarikov <dmitry@yarikov.com>
pkgname=kvn-tui-bin
pkgver=0.31.0
pkgrel=1
pkgdesc="Terminal VPN client for Arch Linux with vim navigation"
arch=('x86_64')
url="https://github.com/yarikov/kvn-tui"
license=('MIT')
install=kvn-tui.install
depends=('gcc-libs' 'dbus' 'libcap' 'sing-box')
optdepends=(
    'git: prepare Git resources required by package migrations'
    'xdg-utils: open the project support page from the TUI'
    'wl-clipboard: clipboard integration on Wayland'
    'xclip: clipboard integration on X11 (preferred)'
    'xsel: clipboard integration on X11 (alternative)'
)
provides=('kvn-tui')
conflicts=('kvn-tui')
source=("https://github.com/yarikov/kvn-tui/releases/download/v0.31.0/kvn-tui-0.31.0-x86_64-linux.tar.gz")
sha256sums=('fe4940babf3eef30091e7782b50e505da3d074fe4a144c30fd9e06aef5e14c71')

package() {
    cd "kvn-tui-0.31.0-x86_64-linux"
    install -Dm755 kvn-tui "$pkgdir/usr/bin/kvn-tui"
    ln -s kvn-tui "$pkgdir/usr/bin/kvn"
    install -dm755 "$pkgdir/usr/lib/kvn/migrations"
    for migration in migrations/*.sh; do
        [[ -f "$migration" ]] || continue
        install -m755 "$migration" "$pkgdir/usr/lib/kvn/migrations/"
    done
    for resources in migrations/*.resources.json; do
        [[ -f "$resources" ]] || continue
        install -m644 "$resources" "$pkgdir/usr/lib/kvn/migrations/"
    done
    install -Dm644 kvn-tui.service "$pkgdir/usr/lib/systemd/user/kvn-tui.service"
    install -Dm644 kvn-tui-sing-box-capabilities.hook \
        "$pkgdir/usr/share/libalpm/hooks/kvn-tui-sing-box-capabilities.hook"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
