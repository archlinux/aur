# Maintainer: Your Name <abdullahaladnan95@gmail.com>

pkgname=haram-blocker
pkgver=1.0
pkgrel=1
pkgdesc="System-wide content blocker for Linux — blocks adult, gambling, dating and drug sites via /etc/hosts"
arch=('any')
url="https://github.com/adnanisagoodboy/haram-blocker"
license=('MIT')
depends=('python' 'tk')
optdepends=(
    'polkit: for GUI privilege elevation (recommended)'
    'sudo: alternative privilege escalation'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('27b3f7d39270a6607b812e77a5d949ae836b44f06b04b7b28e4c581005bc04b2') 
package() {
    cd "$srcdir/haram-blocker-$pkgver"

    # App files
    install -dm755 "$pkgdir/opt/haram_blocker"
    install -dm755 "$pkgdir/opt/haram_blocker/data"
    install -dm755 "$pkgdir/opt/haram_blocker/assets"

    install -Dm755 haram_blocker.py   "$pkgdir/opt/haram_blocker/haram_blocker.py"
    install -Dm644 data/domains.csv   "$pkgdir/opt/haram_blocker/data/domains.csv"
    install -Dm644 assets/icon.svg    "$pkgdir/opt/haram_blocker/assets/icon.svg"
    install -Dm644 assets/icon.png    "$pkgdir/opt/haram_blocker/assets/icon.png"

    # Launcher script
    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/haram-blocker" << 'EOF'
#!/bin/bash
exec python3 /opt/haram_blocker/haram_blocker.py "$@"
EOF
    chmod 755 "$pkgdir/usr/bin/haram-blocker"

    # Desktop entry
    install -dm755 "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/haram-blocker.desktop" << 'EOF'
[Desktop Entry]
Version=1.0
Type=Application
Name=Haram Blocker
GenericName=Content Blocker
Comment=Block adult, gambling, dating and drug sites system-wide
Exec=/usr/bin/haram-blocker
Icon=haram-blocker
Terminal=false
StartupNotify=true
Categories=System;Security;Utility;
Keywords=block;haram;parental;filter;adult;gambling;
EOF

    # Icons
    install -Dm644 assets/icon.png \
        "$pkgdir/usr/share/pixmaps/haram-blocker.png"

    for size in 48 64 128 256; do
        install -dm755 \
            "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps"
        install -Dm644 assets/icon.png \
            "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/haram-blocker.png"
    done

    # License
    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
