# Maintainer: theswest
# Contributor: DrSkyfaR <https://github.com/DrSkyfaR>

pkgname=dualcpy-linux
pkgver=1.0.0
pkgrel=1
pkgdesc="Multi-window scrcpy launcher for dual-screen Android handhelds (X11 docking / Wayland floating)"
arch=('any')
url="https://github.com/DrSkyfaR/DualCPY-Linux"
license=('GPL-3.0-or-later')
depends=(
    'python'
    'scrcpy>=4.0'
    'android-tools'
    'tk'
    'python-xlib'
    'python-pillow'
    'python-customtkinter'
    'python-darkdetect'
    'python-mss'
)
makedepends=('git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "dualcpy-linux.sh"
        "dualcpy-linux.desktop")
sha256sums=('93e44fdeaf33c9227ffd07da92ea29298341a1401ded8407914dc7ec30b65e89'
            '4f401d149814e34ae39580852b76310b0e281e3f366a0bd0dcfb224cd0213418'
            'a84f963ea9a365da1b993a48caef482f8f42dc33178433eeae1b2036220df4c0')

package() {
    cd "$srcdir/DualCPY-Linux-$pkgver"

    # App code lives under /opt (read-only, root-owned)
    install -dm755 "$pkgdir/opt/$pkgname"
    cp -r src bin "$pkgdir/opt/$pkgname/"
    install -Dm644 main.py "$pkgdir/opt/$pkgname/main.py"

    # Ship the bundled default config so first run has profiles/layouts to copy
    if [ -d config ]; then
        cp -r config "$pkgdir/opt/$pkgname/config.default"
    fi

    # Assets (icon, fonts) needed by the running app
    if [ -d assets ]; then
        cp -r assets "$pkgdir/opt/$pkgname/"
    fi

    # Launcher wrapper -> /usr/bin/dualcpy-linux
    install -Dm755 "$srcdir/dualcpy-linux.sh" "$pkgdir/usr/bin/$pkgname"

    # Desktop entry + icon for the app launcher
    install -Dm644 "$srcdir/dualcpy-linux.desktop" \
        "$pkgdir/usr/share/applications/$pkgname.desktop"
    if [ -f assets/icon.png ]; then
        install -Dm644 assets/icon.png \
            "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
    fi

    # License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
