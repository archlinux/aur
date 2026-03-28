# Maintainer: Qingxu <me@linioi.com>

pkgname=yesplaymusic
pkgver=0.4.10
pkgrel=2
pkgdesc="A third party music application for Netease Music"
arch=('x86_64')
url="https://github.com/qier222/YesPlayMusic"
license=('MIT')
provides=('yesplaymusic')
conflicts=(
    'yesplaymusic-bin'
    'yesplaymusic-electron'
    'yesplaymusic-git'
)
depends=(
    'alsa-lib'
    'gtk3'
    'libxss'
    'nss'
)
optdepends=(
    'libnotify: desktop notifications'
    'libayatana-appindicator: system tray support'
    'xdg-utils: open URLs with default browser'
)
options=('!strip' '!debug')
source=(
    "YesPlayMusic-${pkgver}.pacman::https://github.com/qier222/YesPlayMusic/releases/download/v${pkgver}/yesplaymusic-${pkgver}.pacman"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/qier222/YesPlayMusic/v${pkgver}/LICENSE"
)
sha256sums=('e93b279cf2e916be661586990390b272c471ba1405ff665a27246c3fa1efac9f'
            'c33378c6fd12e6d040cedd06dc0d1bedfca74fd66bc46cc2cf10cc10e0906be6')

package() {
    tar -xf "YesPlayMusic-${pkgver}.pacman" -C "$pkgdir"

    # Remove upstream pacman metadata
    rm -f "$pkgdir"/.{PKGINFO,MTREE,INSTALL}

    # Symlink binary to PATH
    install -dm755 "$pkgdir/usr/bin"
    ln -sf '/opt/YesPlayMusic/yesplaymusic' "$pkgdir/usr/bin/yesplaymusic"

    # SUID chrome-sandbox for Electron 5+
    chmod 4755 "$pkgdir/opt/YesPlayMusic/chrome-sandbox"

    # Fix desktop entry categories
    sed -i 's|Categories=Music;|Categories=Music;AudioVideo;Player;|' \
        "$pkgdir/usr/share/applications/yesplaymusic.desktop"
    echo 'Comment[zh_CN]=高颜值的第三方网易云播放器' \
        >>"$pkgdir/usr/share/applications/yesplaymusic.desktop"

    # Install MIT license
    install -Dm644 "$srcdir/LICENSE-${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
