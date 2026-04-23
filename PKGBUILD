# Maintainer: RimuruTemp1421 <daser1421official@gmail.com>

pkgname=anihot-app
pkgver=6.0.9
pkgrel=1
pkgdesc="Flutter-based Linux client for AniHot anime streaming app"
arch=('x86_64')
url="https://github.com/MrGlany/AniHotAppPC"
license=('custom')
depends=('glibc' 'gtk3' 'bash' 'sqlite3')
options=('!debug')
source=("anihot-${pkgver}.zip::https://github.com/MrGlany/AniHotAppPC/releases/download/${pkgver}r/${pkgver}-linux.zip")
sha256sums=('42c2a4acd597b1b649c21b7992ed2ced9692c052961915395bf0c7340a5afae8')
install="${pkgname}.install"

package() {
    cd "$srcdir"

    rm -f anihot_updater

    install -d "$pkgdir/usr/lib/$pkgname"

    cp -r lib share data "$pkgdir/usr/lib/$pkgname/"
    cp "AniHot App" "$pkgdir/usr/lib/$pkgname/"

    mv "$pkgdir/usr/lib/$pkgname/AniHot App" "$pkgdir/usr/lib/$pkgname/anihot-app"

    # Удаляем встроенную SQLite, используем системную
    rm -f "$pkgdir/usr/lib/$pkgname/lib/libsqlite3.so"

    install -d "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/anihot" << 'EOF'
#!/bin/bash
cd /usr/lib/anihot-app
export LD_LIBRARY_PATH="/usr/lib/anihot-app/lib:${LD_LIBRARY_PATH}"
exec ./anihot-app "$@"
EOF
    chmod 755 "$pkgdir/usr/bin/anihot"

    install -Dm644 "$srcdir/share/applications/com.anihot.anihot.desktop" \
        "$pkgdir/usr/share/applications/anihot.desktop"

    install -Dm644 "$srcdir/share/icons/hicolor/256x256/apps/com.anihot.anihot.png" \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/com.anihot.anihot.png"
}
