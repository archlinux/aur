# Maintainer: RimuruTemp1421 <daser1421official@gmail.com>

pkgname=anihot-app
pkgver=6.2.4
pkgrel=1
pkgdesc="Linux client for AniHot anime streaming app"
arch=('x86_64')
url="https://github.com/MrGlany/AniHotAppPC"
license=('custom')
depends=('glibc' 'gtk3' 'bash' 'sqlite' 'mpv')
install="${pkgname}.install"
options=('!debug')
source=("anihot-${pkgver}.zip::https://github.com/MrGlany/AniHotAppPC/releases/download/${pkgver}r/${pkgver}-linux.zip"
        "${pkgname}.install")
sha256sums=('d0210611121a066c083b0a92e9f4f99e1a75d593c1048c25a9b3dff26f17629b'
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

    # Wrapper script for GUI app
    cat > "$pkgdir/usr/bin/anihot" << 'EOF'
#!/bin/bash
cd /usr/lib/anihot-app
export LD_LIBRARY_PATH="/usr/lib/anihot-app/lib:${LD_LIBRARY_PATH}"
exec ./anihot-app "$@"
EOF
    chmod 755 "$pkgdir/usr/bin/anihot"

    # Install CLI client (ahcli) as a command
    cp "$srcdir/ahcli" "$pkgdir/usr/lib/$pkgname/ahcli"
    chmod 755 "$pkgdir/usr/lib/$pkgname/ahcli"

    # Wrapper script for ahcli
    cat > "$pkgdir/usr/bin/ahcli" << 'EOF'
#!/bin/bash
cd /usr/lib/anihot-app
export LD_LIBRARY_PATH="/usr/lib/anihot-app/lib:${LD_LIBRARY_PATH}"
exec ./ahcli "$@"
EOF
    chmod 755 "$pkgdir/usr/bin/ahcli"

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
