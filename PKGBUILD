# Maintainer: Remo-afk <remo@github.com>
pkgname=gamechanger
pkgver=1.0
pkgrel=1
pkgdesc="Gaming Control Center - Battery Monitor with LED alerts and system updates"
arch=('any')
url="https://github.com/Remo-afk/GameChanger"
license=('MIT')
depends=('python' 'python-gobject' 'gtk3' 'libappindicator-gtk3')
optdepends=('cachyos-rate-mirrors: for system update optimization')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Remo-afk/GameChanger/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
    cd "$srcdir/GameChanger-$pkgver"
    
    # Installiere Hauptprogramm
    install -Dm755 gamechanger.py "$pkgdir/usr/share/gamechanger/gamechanger.py"
    
    # Starter
    cat > "$pkgdir/usr/bin/gamechanger" << 'EOF'
#!/bin/bash
if pgrep -f "gamechanger.py" > /dev/null; then
    echo "🎮 GameChanger läuft bereits!"
    exit 0
fi
nohup python3 /usr/share/gamechanger/gamechanger.py > /dev/null 2>&1 &
EOF
    chmod 755 "$pkgdir/usr/bin/gamechanger"
    
    # Desktop Entry
    cat > "$pkgdir/usr/share/applications/gamechanger.desktop" << 'EOF'
[Desktop Entry]
Type=Application
Name=GameChanger
Comment=Gaming Control Center
Exec=gamechanger
Icon=battery-full
Categories=System;Utility;
Terminal=false
StartupNotify=false
X-GNOME-Autostart-enabled=true
EOF
    
    # Udev-Regel für LEDs
    install -Dm644 99-leds.rules "$pkgdir/usr/lib/udev/rules.d/99-leds.rules"
}
