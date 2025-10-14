# Maintainer: Hongyang Chun <your-email@example.com>
pkgname=hyprland-monitor-manager
pkgver=1.2.3
pkgrel=1
pkgdesc="Smart monitor and lid management for Hyprland with automatic detection and configuration"
arch=('any')
url="https://github.com/hongyangchun/hyprland-monitor-manager"
license=('MIT')
depends=('hyprland' 'jq' 'systemd' 'libnotify')
optdepends=(
    'mako: notification daemon for Wayland'
    'dunst: alternative notification daemon'
)
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('98588bd417092bd84297d2ddb890695f5f77d92d6fbc0a1c062c8d7036de54cc')
backup=('etc/systemd/logind.conf.d/lid-switch.conf')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    
    # Install main script
    install -Dm755 monitor-manager.sh "$pkgdir/usr/share/$pkgname/monitor-manager.sh"
    
    # Create hmonitor command symlink
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/usr/share/$pkgname/monitor-manager.sh" "$pkgdir/usr/bin/hmonitor"
    
    # Install monitor configs directory structure
    install -dm755 "$pkgdir/usr/share/$pkgname/monitor-configs"
    install -Dm644 monitor-configs/*.conf "$pkgdir/usr/share/$pkgname/monitor-configs/"
    
    # Install systemd lid-switch configuration
    install -Dm644 lid-switch.conf "$pkgdir/etc/systemd/logind.conf.d/lid-switch.conf"
    
    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 README_CN.md "$pkgdir/usr/share/doc/$pkgname/README_CN.md"
    install -Dm644 monitor-configs/README.md "$pkgdir/usr/share/doc/$pkgname/monitor-configs-README.md"
    
    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
