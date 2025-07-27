# Maintainer: solidstrong <latifishal@gmail.com>

pkgname=ddper
pkgver=8.4
pkgrel=1
pkgdesc="DDPER (unofficial DDNet client)"
arch=('x86_64')
url="https://ddper.ir"
license=('custom:Proprietary')
depends=('freetype2' 'opusfile' 'curl' 'glew' 'wavpack' 'ffmpeg' 'libnotify' 'miniupnpc' 'sqlite' 'mariadb-libs' 'vulkan-icd-loader')
optdepends=('discord-game-sdk: Enable rich presence in Discord desktop client.')
provides=('ddper')
_arch="x86_64"
source=("https://ddper.ir/client/linux/ddper-v${pkgver}-linux_${_arch}.tar.xz"
        "https://ddper.ir/image/icon.png")
sha256sums=('2f62ffd210aea3eb2f4015d7a59da35b3ecc1bf861a1df9aed7b7a1e70a8dac0'
            '6649746c0783e4187422125358126dc65f252330104143fa515ece61ed6aba8a')

build() {
  :
}

package() {
    install -d "$pkgdir/opt/$pkgname"
    install -d "$pkgdir/usr/bin"
    install -d "$pkgdir/usr/share/applications"
    install -d "$pkgdir/usr/share/icons/hicolor/48x48/apps"
    install -d "$pkgdir/usr/share/licenses/$pkgname"

    mkdir -p "$srcdir/tmp"
    tar -xf "ddper-v${pkgver}-linux_${_arch}.tar.xz" -C "$srcdir/tmp" --strip-components=1
    cp -a "$srcdir/tmp/." "$pkgdir/opt/$pkgname"

    # Use wrapper instead of symlink to ensure correct working directory
    cat << 'EOF' > "$pkgdir/usr/bin/ddper"
#!/bin/bash
exec /opt/ddper/DDPER "$@"
EOF
    chmod +x "$pkgdir/usr/bin/ddper"

    install -Dm644 "icon.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/ddper.png"

    [ -f "$srcdir/tmp/LICENSE" ] && install -Dm644 "$srcdir/tmp/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    cat << EOF > "$pkgdir/usr/share/applications/ddper.desktop"
[Desktop Entry]
Type=Application
Name=DDPER
StartupWMClass=DDPER
GenericName=Platform Game
Exec=/usr/bin/ddper %u
Icon=ddper
Terminal=false
Keywords=game;multiplayer;
Categories=Game;ArcadeGame;
MimeType=x-scheme-handler/ddper;
Comment=Launch DDPER
EOF
}
