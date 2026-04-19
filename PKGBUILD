pkgname=quick-dns-switcher
pkgver=1.0.0
pkgrel=1
pkgdesc="System tray utility to manage and switch DNS settings via NetworkManager"
arch=('any')
url="https://github.com/gmm96/Quick-DNS-Switcher"
license=('GPL3')
depends=(
    'python'
    'python-pyqt6'
    'networkmanager'
    'python-dbus'
)
source=(
  "$pkgname-$pkgver.zip::https://github.com/gmm96/Quick-DNS-Switcher/releases/download/$pkgver/quick-dns-switcher-v$pkgver.zip"
)
sha256sums=('1d683be6b6568571fe8e1e0e6a5b777749aefd74b4c134d51307e46131686ff1')

package(){
    cd "$srcdir/$pkgname-v$pkgver"

    # Source
    install -dm755 "$pkgdir/opt/quick-dns-switcher"
    cp -r src "$pkgdir/opt/quick-dns-switcher/"
    install -Dm644 "README.md" "$pkgdir/opt/quick-dns-switcher/README.md"
    install -Dm644 "LICENSE" "$pkgdir/opt/quick-dns-switcher/LICENSE"

    # Config
    install -Dm644 "src/resources/config/dns_providers.json" "$pkgdir/usr/share/quick-dns-switcher/dns_providers.json"

    # Bin
    install -Dm755 "/dev/stdin" "$pkgdir/usr/bin/quick-dns-switcher" \
<<EOF
#!/bin/bash
cd /opt/quick-dns-switcher
exec python3 -m src.main "$@"
EOF

    # App shortcut
    install -Dm644 "src/resources/assets/QuickDnsSwitcher.desktop" "$pkgdir/usr/share/applications/quick-dns-switcher.desktop"

    # Autostart
    install -Dm644 "src/resources/assets/QuickDnsSwitcher.desktop" "$pkgdir/etc/xdg/autostart/quick-dns-switcher.desktop"

    # Icons
    install -dm755 "$pkgdir/usr/share/icons/hicolor/scalable/apps"
    for icon in src/resources/assets/icons/*.svg; do
        install -Dm644 "$icon" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$(basename "$icon")"
    done
}
