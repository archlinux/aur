# Maintainer: RiDDiX <github@egu-rel.de>
pkgname=adguard-tray
pkgver=1.1.0
pkgrel=1
pkgdesc="System tray monitor and controller for adguard-cli (KDE Plasma & Hyprland)"
arch=('any')
url="https://github.com/RiDDiX/adguard-tray"
license=('MIT')
depends=(
    'python'
    'python-pyqt6'
    'python-yaml'
    'libnotify'
)
optdepends=(
    'adguard-cli-bin: AdGuard CLI via AUR (alternatively install upstream: curl -fsSL https://raw.githubusercontent.com/AdguardTeam/AdGuardCLI/release/install.sh | sh -s -- -v)'
    'qt6-svg: SVG icon theme support'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')  # replace with real checksum before publishing to AUR

package() {
    cd "$srcdir/$pkgname-$pkgver"

    # Application files
    install -dm755 "$pkgdir/usr/lib/$pkgname"
    cp -r adguard_tray "$pkgdir/usr/lib/$pkgname/"
    install -Dm755 adguard-tray.py "$pkgdir/usr/lib/$pkgname/adguard-tray.py"

    # Launcher script
    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/$pkgname" << EOF
#!/usr/bin/env bash
exec python3 /usr/lib/$pkgname/adguard-tray.py "\$@"
EOF
    chmod 755 "$pkgdir/usr/bin/$pkgname"

    # Desktop entry
    install -Dm644 adguard-tray.desktop \
        "$pkgdir/usr/share/applications/adguard-tray.desktop"

    # License
    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
