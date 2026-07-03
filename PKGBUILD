pkgname=smart-updater
pkgver=2.0.2_beta
pkgrel=1
pkgdesc="A streamlined PyQt6 tool for Arch Linux and CachyOS that makes system updates, app uninstallation, and log tracking fast and elegant."
arch=('any')
url="https://github.com/UniqueSpirit/smart-updater"
license=('GPL')
depends=('python' 'python-pyqt6' 'pacman-contrib')

source=("${pkgname}-${pkgver}.tar.gz::$url/archive/refs/tags/v${pkgver/_/-}.tar.gz")
sha256sums=('0adae3d2a76046d15c4870a6f6eb8132a6c7350cac44202c4fb015b01329b12f')

package() {
    local _srcdir="$pkgname-${pkgver/_/-}"

    mkdir -p "$pkgdir/opt/$pkgname"
    cp -r "$srcdir/$_srcdir/"* "$pkgdir/opt/$pkgname/"

    find "$pkgdir/opt/$pkgname" -type d -exec chmod 755 {} +
    find "$pkgdir/opt/$pkgname" -type f -exec chmod 644 {} +
    chmod +x "$pkgdir/opt/$pkgname/main.py"

    mkdir -p "$pkgdir/usr/bin"
    echo -e '#!/bin/bash\nexec -a smart-updater python /opt/smart-updater/main.py "$@"' > "$pkgdir/usr/bin/$pkgname"
    chmod +x "$pkgdir/usr/bin/$pkgname"

    mkdir -p "$pkgdir/usr/share/pixmaps"
    cat << 'EOF' > "$pkgdir/usr/share/pixmaps/$pkgname.svg"
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 256 256"><defs><linearGradient id="ringGrad" x1="0%" y1="100%" x2="100%" y2="0%"><stop offset="0%" stop-color="#89b4fa"/><stop offset="100%" stop-color="#0db9d7"/></linearGradient></defs><path d="M 128 32 A 96 96 0 1 1 60 56" fill="none" stroke="url(#ringGrad)" stroke-width="28" stroke-linecap="round"/><path d="M 128 24 L 184 96 L 144 96 L 144 184 L 112 184 L 112 96 L 72 96 Z" fill="#a6e3a1"/></svg>
EOF

    mkdir -p "$pkgdir/usr/share/applications"
    echo "[Desktop Entry]
Version=1.0
Type=Application
Name=Smart Updater
Comment=System-Updates einfach und smart
Exec=smart-updater
Icon=/usr/share/pixmaps/smart-updater.svg
Terminal=false
StartupWMClass=smart-updater
Categories=System;Settings;" > "$pkgdir/usr/share/applications/$pkgname.desktop"
}
