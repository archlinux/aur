# Maintainer: Ashley <info@meisgaming.net>
# Contributor: Ashley <info@meisgaming.net>
pkgname=league-of-gays
pkgver=0.2.1
pkgrel=1
pkgdesc="League of Gays Launcher — private MOBA client launcher (self-hosted)"
arch=('x86_64')
url="https://lol.meisgaming.net"
license=('custom:proprietary')
depends=('electron>=42')
makedepends=('nodejs' 'npm')
provides=('league-of-gays')
conflicts=('league-of-gays')
changelog=CHANGELOG.md
source=("${pkgname}-src-${pkgver}.tar.gz::https://lol.meisgaming.net/launcher/${pkgname}-src-${pkgver}.tar.gz")
sha256sums=('e605ee2af88cb79dc208875bfab548028477142f3f1d1a238e27db9ed14f5e74')

build() {
    cd "$srcdir/${pkgname}-src-${pkgver}"
    npm ci --prefer-offline
    npx electron-builder --linux --dir
}

package() {
    local app="$srcdir/${pkgname}-src-${pkgver}/dist/linux-unpacked"

    install -dm755 "$pkgdir/opt/league-of-gays"
    cp -r "$app/." "$pkgdir/opt/league-of-gays/"

    install -dm755 "$pkgdir/usr/bin"
    ln -sf /opt/league-of-gays/league-of-gays "$pkgdir/usr/bin/league-of-gays"

    install -dm755 "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/league-of-gays.desktop" << 'EOF'
[Desktop Entry]
Name=League of Gays
Comment=League of Gays Launcher
Exec=/usr/bin/league-of-gays %U
Icon=league-of-gays
Type=Application
Categories=Game;
StartupWMClass=league-of-gays
MimeType=x-scheme-handler/log;
EOF

    # Handle both electron-builder output layouts
    for iconpath in \
        "$app/resources/app/renderer/assets/icon.png" \
        "$app/resources/icon.png"; do
        if [ -f "$iconpath" ]; then
            install -Dm644 "$iconpath" \
                "$pkgdir/usr/share/icons/hicolor/256x256/apps/league-of-gays.png"
            break
        fi
    done

    # License
    install -Dm644 /dev/null "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
    printf '%s\n' \
        'League of Gays Launcher' \
        'Copyright (c) 2026 Ashley' \
        '' \
        'This software is provided for private, non-commercial use only.' \
        'Redistribution or commercial use is prohibited without express permission.' \
        > "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"

    # Install changelog
    install -Dm644 "$srcdir/${pkgname}-src-${pkgver}/CHANGELOG.md" \
        "$pkgdir/usr/share/doc/${pkgname}/CHANGELOG.md"

    # Install protocol handler
    cat > "$pkgdir/usr/share/applications/league-of-gays-handler.desktop" << 'EOF'
[Desktop Entry]
Name=League of Gays (Auth Handler)
Exec=/usr/bin/league-of-gays %U
Icon=league-of-gays
Terminal=false
Type=Application
NoDisplay=true
MimeType=x-scheme-handler/log;
Categories=
EOF
}
