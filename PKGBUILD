# Maintainer: RiDDiX <riddix at riddix dot dev>

pkgname=adguard-tray-git
pkgver=r1.e343d17
pkgrel=1
pkgdesc="System tray monitor and controller for adguard-cli (KDE Plasma & Hyprland)"
arch=('any')
url="https://github.com/RiDDiX/adguard-tray"
license=('MIT')
depends=(
    'python'
    'python-pyqt6'
    'libnotify'
)
optdepends=(
    'adguard-cli-bin: adguard-cli binary (AUR)'
)
provides=('adguard-tray')
conflicts=('adguard-tray')
makedepends=('git')
source=("$pkgname::git+https://github.com/RiDDiX/adguard-tray.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$pkgname"

    # Application files
    install -dm755 "$pkgdir/usr/lib/adguard-tray"
    cp -r adguard_tray "$pkgdir/usr/lib/adguard-tray/"
    install -Dm755 adguard-tray.py "$pkgdir/usr/lib/adguard-tray/adguard-tray.py"

    # Launcher
    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/adguard-tray" << 'SCRIPT'
#!/usr/bin/env bash
exec python3 /usr/lib/adguard-tray/adguard-tray.py "$@"
SCRIPT
    chmod 755 "$pkgdir/usr/bin/adguard-tray"

    # Desktop entry
    install -Dm644 adguard-tray.desktop \
        "$pkgdir/usr/share/applications/adguard-tray.desktop"

    # License
    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
