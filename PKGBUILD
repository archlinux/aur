# Maintainer: Hongyang Chun <your-email@example.com>
pkgname=hyprland-monitor-manager
pkgver=1.0.0
pkgrel=2
pkgdesc="Smart monitor and lid management for Hyprland with automatic detection and configuration"
arch=('any')
url="https://github.com/hongyangchun/hyprland-monitor-manager"
license=('MIT')
depends=('hyprland' 'jq' 'systemd' 'libnotify')
optdepends=(
    'mako: notification daemon for Wayland'
    'dunst: alternative notification daemon'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('4f1c03c52647fdda4780a69417018ddf713245bf2becbc2f44dab28cdfbb4225')  # Will be updated when creating release
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
    install -Dm644 OPTIMIZATION.md "$pkgdir/usr/share/doc/$pkgname/OPTIMIZATION.md"
    install -Dm644 NOTIFICATIONS.md "$pkgdir/usr/share/doc/$pkgname/NOTIFICATIONS.md"
    install -Dm644 monitor-configs/README.md "$pkgdir/usr/share/doc/$pkgname/monitor-configs-README.md"
    
    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

post_install() {
    echo ""
    echo "==> Hyprland Monitor Manager installed successfully!"
    echo ""
    echo "==> Next steps:"
    echo "    1. Copy monitor config template to your Hyprland config:"
    echo "       mkdir -p ~/.config/hypr/monitor-configs"
    echo "       cp /usr/share/hyprland-monitor-manager/monitor-configs/default.conf \\"
    echo "          ~/.config/hypr/monitor-configs/\$(hostname).conf"
    echo ""
    echo "    2. Edit your machine-specific config:"
    echo "       nano ~/.config/hypr/monitor-configs/\$(hostname).conf"
    echo ""
    echo "    3. Add to Hyprland autostart (~/.config/hypr/hyprland.conf):"
    echo "       exec-once = hmonitor daemon"
    echo ""
    echo "    4. Restart systemd-logind or reboot for lid switch config:"
    echo "       sudo systemctl restart systemd-logind"
    echo ""
    echo "==> Usage:"
    echo "    hmonitor status   - Show current status"
    echo "    hmonitor toggle   - Toggle internal display"
    echo "    hmonitor refresh  - Refresh configuration"
    echo "    hmonitor help     - Show help"
    echo ""
    echo "==> Documentation: /usr/share/doc/hyprland-monitor-manager/"
    echo ""
}

post_upgrade() {
    post_install
}

post_remove() {
    echo ""
    echo "==> Stopping monitor-manager daemon..."
    pkill -f "monitor-manager.sh.*daemon" 2>/dev/null || true
    pkill -f "hmonitor.*daemon" 2>/dev/null || true
    
    echo "==> Please manually remove monitor-manager from your Hyprland config:"
    echo "    - Remove 'exec-once = hmonitor daemon' from hyprland.conf or autostart.conf"
    echo "    - Remove keybindings if any (e.g. 'hmonitor toggle')"
    echo ""
    echo "==> User configuration files preserved at:"
    echo "    ~/.config/hypr/monitor-configs/"
    echo ""
}
