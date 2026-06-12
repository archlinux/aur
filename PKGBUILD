# Maintainer: RimuruTemp1421 <daser1421official@gmail.com>

pkgname=anihot-app-bin
pkgver=6.1.1
pkgrel=1
pkgdesc="Linux client for AniHot anime streaming app"
arch=('x86_64')
url="https://github.com/MrGlany/AniHotAppPC"
license=('custom')
depends=('glibc' 'gtk3' 'bash' 'sqlite')
conflicts=('anihot-app')
replaces=('anihot-app')
install="${pkgname}.install"
options=('!debug')
source=("anihot-${pkgver}.zip::https://github.com/MrGlany/AniHotAppPC/releases/download/${pkgver}r/${pkgver}-linux.zip"
        "${pkgname}.install")
sha256sums=('4b74204008c9b87ae984e56498b635690ad0d6690fae10c57563cf01a7e5a807'
            '0e036796aa22e8b8c0f11112c454651edea24ab5e4aedcb81536cbde1540c763')

package() {
    cd "$srcdir"

    # Remove built-in updater
    rm -f "$srcdir/anihot_updater"

    # Create directory structure
    install -d "$pkgdir/usr/lib/$pkgname"
    install -d "$pkgdir/usr/bin"
    install -d "$pkgdir/usr/share/applications"
    install -d "$pkgdir/usr/share/icons/hicolor/256x256/apps"

    # Copy application files (lib and data only, share is handled separately)
    cp -r lib data "$pkgdir/usr/lib/$pkgname/"
    cp "AniHot App" "$pkgdir/usr/lib/$pkgname/anihot-app"

    # Wrapper script
    cat > "$pkgdir/usr/bin/anihot" << 'EOF'
#!/bin/bash
cd /usr/lib/anihot-app-bin
export LD_LIBRARY_PATH="/usr/lib/anihot-app-bin/lib:${LD_LIBRARY_PATH}"
exec ./anihot-app "$@"
EOF
    chmod 755 "$pkgdir/usr/bin/anihot"

    # .desktop file
    cat > "$pkgdir/usr/share/applications/anihot.desktop" << 'EOF'
[Desktop Entry]
Version=1.0
Type=Application
Name=AniHot App
Comment=AniHot App
Exec=anihot
Icon=com.anihot.anihot
Terminal=false
Categories=Video;AudioVideo;Player;
StartupNotify=true
StartupWMClass=com.anihot.anihot
EOF

    # Copy icon (exact path with fallback find)
    if [ -f "$srcdir/share/icons/hicolor/256x256/apps/com.anihot.anihot.png" ]; then
        cp "$srcdir/share/icons/hicolor/256x256/apps/com.anihot.anihot.png" \
           "$pkgdir/usr/share/icons/hicolor/256x256/apps/com.anihot.anihot.png"
    else
        find "$srcdir/share/icons/hicolor" -name "com.anihot.anihot.png" -exec cp {} "$pkgdir/usr/share/icons/hicolor/256x256/apps/com.anihot.anihot.png" \;
    fi

    # Install license if present
    if [ -f "$srcdir/LICENSE" ]; then
        install -d "$pkgdir/usr/share/licenses/$pkgname"
        cp "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
    fi
}
