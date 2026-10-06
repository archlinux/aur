# Maintainer: NickMarcha <nicolasmmjoes at gmail dot com>
#
# The prebuilt Linux release from https://github.com/NickMarcha/TowerOfAtum-releases (the source is private, hence
# -bin). Installed under /opt/towerofatum; `towerofatum` plays offline and `towerofatum-server` hosts.
pkgname=towerofatum-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="Work-in-progress multiplayer spell-combat game, played offline against a local server"
arch=('x86_64')
url="https://github.com/NickMarcha/TowerOfAtum-releases"
license=('LicenseRef-TowerOfAtum')
# The player links only glibc and gcc-libs; Unity loads the display, graphics, input and audio libraries at run time.
depends=('glibc' 'gcc-libs' 'libx11' 'libxcursor' 'libxrandr' 'libxi' 'libglvnd' 'vulkan-icd-loader' 'wayland'
         'cairo' 'pango' 'dbus' 'systemd-libs' 'alsa-lib')
optdepends=('libpulse: sound through PulseAudio or PipeWire')
provides=('towerofatum')
conflicts=('towerofatum')
# Unity's libraries must not be stripped.
options=('!strip' '!debug')
source=("https://github.com/NickMarcha/TowerOfAtum-releases/releases/download/client-v${pkgver}/TowerOfAtum-client-${pkgver}-linux.tar.gz"
        'towerofatum'
        'towerofatum-server'
        'towerofatum.desktop'
        'LICENSE')
sha256sums=('1eb05cb425cfa5b0fb5b5f3cea17f62266df6fc65444a55f5d9aed7202e1f8b8'
            '02777334d2dc0a52f20efb3bba37493c21ba24ae0c82605acf13bf5d2b66a23e'
            '3801c09495ed6ae351ebb358d166cba64f87498205fefb3a97cbe52dd9dd1893'
            'f6ccd0949aa69d4bc19bf0c9e7aeb473ab2947396426c5fa1a09b556753d50db'
            '86a3c6a009a2677171ae6cbcedd3ed245d571fdd7060f024331268b75572234d')

package() {
    local game="TowerOfAtum-client-${pkgver}-linux"
    install -d "$pkgdir/opt/towerofatum"
    cp -a "$game/." "$pkgdir/opt/towerofatum/"
    # The release's own launchers update themselves and write logs beside the game; the commands below replace them.
    rm -f "$pkgdir/opt/towerofatum/"{play.sh,run-server.sh,version.txt}
    install -Dm755 towerofatum "$pkgdir/usr/bin/towerofatum"
    install -Dm755 towerofatum-server "$pkgdir/usr/bin/towerofatum-server"
    install -Dm644 towerofatum.desktop "$pkgdir/usr/share/applications/towerofatum.desktop"
    install -Dm644 "$game/README.txt" "$pkgdir/usr/share/doc/towerofatum/README.txt"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
