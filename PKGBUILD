# Maintainer: solidstrong <latifishal@gmail.com>

pkgname=ddper
pkgver=9.1
pkgrel=1
pkgdesc="DDPER (unofficial DDNet client)"
arch=('x86_64')
url="https://ddper.ir"
options=('!debug')
license=('custom:Proprietary')
depends=('freetype2' 'opusfile' 'curl' 'glew' 'wavpack' 'ffmpeg' 'libnotify' 'miniupnpc' 'sqlite' 'mariadb-libs' 'vulkan-icd-loader')
optdepends=('discord-game-sdk: Enable rich presence in Discord desktop client.')
provides=('ddper')

_arch="x86_64"

source=("https://ddper.ir/client/linux/DDPER-${pkgver}-linux_${_arch}.tar.xz")
sha256sums=('7228b5ec923c43273b613e72f3f7d0e59430e8a3a2751e8a7825628f490f2c46')

prepare() {
    mkdir -p "$srcdir/tmp"

    tar -xf "DDPER-${pkgver}-linux_${_arch}.tar.xz" \
        -C "$srcdir/tmp" \
        --strip-components=1
}

build() {
    :
}

package() {
    install -d "$pkgdir/opt/$pkgname"
    install -d "$pkgdir/usr/bin"
    install -d "$pkgdir/usr/share/applications"
    install -d "$pkgdir/usr/share/icons/hicolor/48x48/apps"
    install -d "$pkgdir/usr/share/licenses/$pkgname"

    cp -a "$srcdir/tmp/." "$pkgdir/opt/$pkgname"

    # Wrapper to ensure correct working directory
    cat << 'EOF' > "$pkgdir/usr/bin/ddper"
#!/bin/bash
exec /opt/ddper/DDPER "$@"
EOF
    chmod +x "$pkgdir/usr/bin/ddper"

    # Application icon
    install -Dm644 "$srcdir/tmp/data/gui_logo.png" \
        "$pkgdir/usr/share/icons/hicolor/48x48/apps/ddper.png"

    # License
    if [[ -f "$srcdir/tmp/LICENSE" ]]; then
        install -Dm644 "$srcdir/tmp/LICENSE" \
            "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi

    # Desktop entry
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