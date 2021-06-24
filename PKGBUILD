# Maintainer: ns <ns at brickadia dot com>
_version=1.5

pkgname=brickadia-launcher
pkgver=$_version
pkgrel=1
pkgdesc="A multiplayer 3D brick building game."
arch=(x86_64)
url="https://brickadia.com"
license=(unknown)

options=('!strip')
_dist="brickadia-launcher-$_version.deb"
source=("$_dist::https://static.brickadia.com/launcher/$_version/brickadia-launcher.deb")
sha256sums=('a94938152847599b120c397d1762761b02758ec365ed2f3bbc94d50d750eb400')
noextract=("$_dist")

depends=(
    ## For the downloaded game
    glibc
    gcc-libs

    ## For the launcher
    # For /usr/bin/brickadia
    bash
    # For /usr/share/icons/hicolor/
    hicolor-icon-theme
    # I would prefer to depend on qt6-base etc., which would involve more complicated
    # mangling of the upstream files, as they're distributed with a Windows-like approach.
    # For ['usr/lib/brickadia-launcher/libQt6Gui.so.6']
    fontconfig
    # For ['usr/lib/brickadia-launcher/platforms/libqminimal.so']
    freetype2
    # For ['usr/lib/brickadia-launcher/platforms/libqxcb.so',
    # 'usr/lib/brickadia-launcher/libQt6Gui.so.6']
    libgl
    # For ['usr/lib/brickadia-launcher/libQt6DBus.so.6']
    dbus
    # For ['usr/lib/brickadia-launcher/platforms/libqxcb.so']
    libxkbcommon-x11
    # For ['usr/lib/brickadia-launcher/platforms/libqxcb.so']
    xcb-util-keysyms
    # For ['usr/lib/brickadia-launcher/platforms/libqxcb.so']
    xcb-util-renderutil
    # For ['usr/lib/brickadia-launcher/platforms/libqxcb.so']
    xcb-util-image
    # For ['usr/lib/brickadia-launcher/platforms/libqxcb.so']
    xcb-util-wm
)

prepare() {
    ar p "$_dist" data.tar.xz | tar -Jx
}

package() {
    install -Dm755 -t "$pkgdir"/usr/bin "$srcdir"/usr/bin/brickadia
    install -Dm755 -t "$pkgdir"/usr/share/applications "$srcdir"/usr/share/applications/brickadia-launcher*.desktop
    install -Dm755 -t "$pkgdir"/usr/share/icons/hicolor/256x256/apps "$srcdir"/usr/share/icons/hicolor/256x256/apps/brickadia-launcher*.png

    mkdir -p "$pkgdir"/usr/lib/
    cp -dr --no-preserve=ownership -t "$pkgdir"/usr/lib/ "$srcdir"/usr/lib/brickadia-launcher

    mkdir -p "$pkgdir"/usr/share/licenses/
    cp -dr --no-preserve=ownership -t "$pkgdir"/usr/share/licenses/ "$srcdir"/usr/share/licenses/brickadia-launcher
}
