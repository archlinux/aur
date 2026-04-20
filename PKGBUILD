pkgname=anihot-app
pkgver=6.0.8
pkgdesc="Flutter-based Linux client for AniHot anime streaming app"
pkgrel=2
arch=('x86_64')
url="https://github.com/MrGlany/AniHotAppPC"
license=('custom')
depends=('glibc')

source=("anihot-$pkgver.zip::https://github.com/MrGlany/AniHotAppPC/releases/download/${pkgver}r/${pkgver}-linux.zip")
sha256sums=('SKIP')

package() {
    cd "$srcdir"

    # Find extracted root folder safely
    root=$(find . -maxdepth 1 -type d | head -n 1)
    cd "$root"

    # Install full bundle
    install -d "$pkgdir/usr/lib/$pkgname"
    cp -r * "$pkgdir/usr/lib/$pkgname/"

    # Wrapper (no hardcoded name)
    install -d "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/anihot" << EOF
#!/bin/bash
cd /usr/lib/$pkgname
exec ./anihot-app "\$@"
EOF
    chmod 755 "$pkgdir/usr/bin/anihot"

    # Desktop entry
    install -Dm644 "$pkgdir/usr/lib/$pkgname/share/applications/com.anihot.anihot.desktop" \
        "$pkgdir/usr/share/applications/anihot.desktop"

    # Icon
    install -Dm644 "$pkgdir/usr/lib/$pkgname/share/icons/hicolor/256x256/apps/com.anihot.anihot.png" \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/com.anihot.anihot.png"
}
