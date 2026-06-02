# Maintainer: Ashley <info@meisgaming.net>
pkgname=league-of-gays
pkgver=0.1.0
pkgrel=10
pkgdesc="League of Gays — self-hosted MOBA launcher"
arch=('x86_64')
url="https://lol.meisgaming.net"
license=('custom')
depends=('gtk3' 'nss' 'alsa-lib' 'libnotify' 'xdg-utils' 'libx11')
makedepends=('nodejs' 'npm')
provides=('league-of-gays')
conflicts=('league-of-gays')
source=("${pkgname}-src-${pkgver}.tar.gz::https://lol.meisgaming.net/launcher/${pkgname}-src-${pkgver}.tar.gz")
sha256sums=('12f5dd93eb52aff669991d734d6e55914e1754bdbf56d4abb9d224f1d16e7264')

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
Exec=/usr/bin/league-of-gays %U
Icon=league-of-gays
Type=Application
Categories=Game;
StartupWMClass=league-of-gays
MimeType=x-scheme-handler/log;
EOF

    local icon="$app/resources/app/renderer/assets/icon.png"
    if [ -f "$icon" ]; then
        install -Dm644 "$icon" \
            "$pkgdir/usr/share/icons/hicolor/256x256/apps/league-of-gays.png"
    fi

    install -Dm644 /dev/null "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
