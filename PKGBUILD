# Maintainer: YesPlayMusic contributors

pkgname=yesplaymusic-axuanran-bin
pkgver=0.1.6
pkgrel=1
_releasever=0.1.6
pkgdesc="XuMP - a third-party Netease Cloud Music player"
arch=('x86_64')
url="https://github.com/axuanran/YesPlayMusic"
license=('MIT')
provides=('xump')
conflicts=(
    'yesplaymusic'
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
    "XuMP-${_releasever}.pacman::${url}/releases/download/v${_releasever}/XuMP-${_releasever}.pacman"
    "LICENSE-${_releasever}::https://raw.githubusercontent.com/axuanran/YesPlayMusic/v${_releasever}/LICENSE"
)
sha256sums=('8ea8217feb8c7fd01682001676332af729549e30df84c81df8b14c217b869aa2'
            'c33378c6fd12e6d040cedd06dc0d1bedfca74fd66bc46cc2cf10cc10e0906be6')

package() {
    tar -xf "XuMP-${_releasever}.pacman" -C "$pkgdir"

    rm -f "$pkgdir"/.{PKGINFO,MTREE,INSTALL}

    install -dm755 "$pkgdir/usr/bin"
    ln -sf '/opt/XuMP/xump' "$pkgdir/usr/bin/xump"

    # Releases built with electron-builder 26.15.3 - 26.17.0 shipped no
    # chrome-sandbox (the snap target deleted it from the shared linux-unpacked
    # app dir), so only set the SUID bit when the helper is actually packaged.
    if [[ -e "$pkgdir/opt/XuMP/chrome-sandbox" ]]; then
        chmod 4755 "$pkgdir/opt/XuMP/chrome-sandbox"
    else
        echo "==> WARNING: chrome-sandbox is missing from the release artifact;" >&2
        echo "==> WARNING: the app will fall back to the user-namespace sandbox." >&2
    fi

    install -Dm644 "$srcdir/LICENSE-${_releasever}" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
