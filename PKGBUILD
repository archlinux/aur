# Maintainer: NickMarcha
#
# The prebuilt Linux release from https://github.com/NickMarcha/TowerOfAtum-releases (the source is private, hence
# -bin). Installed under /opt/towerofatum; `towerofatum` (and the menu entry) opens the launcher, which shows what's new
# and starts the game, and `towerofatum-server` hosts.
pkgname=towerofatum-bin
pkgver=0.8.5
pkgrel=1
pkgdesc="Work-in-progress multiplayer spell-combat game, played offline against a local server"
arch=('x86_64')
url="https://github.com/NickMarcha/TowerOfAtum-releases"
license=('LicenseRef-TowerOfAtum')
# The player links only glibc and gcc-libs; Unity loads the display, graphics, input and audio libraries at run time.
# The launcher (Avalonia on X11) adds libice, libsm and libxext, and fontconfig and freetype2 for Skia's text; it
# bundles its own libICE and libSM, but pacman's are preferred and kept up to date.
depends=('glibc' 'gcc-libs' 'libx11' 'libxcursor' 'libxrandr' 'libxi' 'libxext' 'libice' 'libsm' 'libglvnd'
         'vulkan-icd-loader' 'wayland' 'cairo' 'pango' 'fontconfig' 'freetype2' 'dbus' 'systemd-libs' 'alsa-lib')
optdepends=('libpulse: sound through PulseAudio or PipeWire')
provides=('towerofatum')
conflicts=('towerofatum')
# Unity's libraries must not be stripped.
options=('!strip' '!debug')
source=("https://github.com/NickMarcha/TowerOfAtum-releases/releases/download/client-v${pkgver}/TowerOfAtum-client-${pkgver}-linux.tar.gz"
        'towerofatum'
        'towerofatum-server'
        'towerofatum.desktop'
        'towerofatum.png'
        'LICENSE')
sha256sums=('e6245a514be71fba8b33b4d7f6bafee951367bea422ccfdac34b5311af0a460c'
            '55d20e3b085a6821bed5cca8e7916fa571ededb7aeac8f496c69dd6b0736f4e9'
            '3801c09495ed6ae351ebb358d166cba64f87498205fefb3a97cbe52dd9dd1893'
            '1da8f3dcb1ee8baf66b181fbb74ab9c8087acff1f12a6e000c55209acd98df7f'
            'd566efc26511564ab5279849db8fdf0a1865959b6a2b9f150b74b2950033405d'
            '8c3e8d3a9708c0cf435c6d040019c69ad9084bf099d1083ae3dc9fbcad2ccedd')

package() {
    local game="TowerOfAtum-client-${pkgver}-linux"
    install -d "$pkgdir/opt/towerofatum"
    cp -a "$game/." "$pkgdir/opt/towerofatum/"
    # The release's scripts would update the game in place and write logs beside it; the commands below replace them.
    # version.txt stays, so the launcher can say which version is installed, and "package-managed" tells it that pacman
    # owns /opt/towerofatum: it then never updates the game, says when a newer version is out, and makes no shortcuts.
    rm -f "$pkgdir/opt/towerofatum/"{play.sh,run-server.sh}
    echo "pacman (the AUR package towerofatum-bin)" > "$pkgdir/opt/towerofatum/package-managed"
    install -Dm755 towerofatum "$pkgdir/usr/bin/towerofatum"
    install -Dm755 towerofatum-server "$pkgdir/usr/bin/towerofatum-server"
    install -Dm644 towerofatum.desktop "$pkgdir/usr/share/applications/towerofatum.desktop"
    install -Dm644 towerofatum.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/towerofatum.png"
    install -Dm644 towerofatum.png "$pkgdir/usr/share/pixmaps/towerofatum.png"
    install -Dm644 "$game/README.txt" "$pkgdir/usr/share/doc/towerofatum/README.txt"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
