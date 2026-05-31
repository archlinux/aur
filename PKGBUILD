# Maintainer: Ivan <vanakrikun0@gmail.com>
pkgname=sword-bin
pkgver=0.1.0
pkgrel=2
pkgdesc="A modern Linux package manager: install from pacman, the AUR, and Flatpak in one click"
arch=('x86_64')
url="https://github.com/ivngineer/sword"
license=('GPL-3.0-or-later')
depends=(
    # Tauri / webkit GUI runtime
    'webkit2gtk-4.1'
    'gtk3'
    'glib2'
    'cairo'
    'pango'
    'gdk-pixbuf2'
    'libsoup3'
    'openssl'
    # Package-source backends the sidecar shells out to
    'expac'          # pacman search/query
    'flatpak'        # flatpak source
    'polkit'         # pkexec - privilege escalation for install/remove
    # Desktop integration
    'hicolor-icon-theme'
    'desktop-file-utils'
)
optdepends=(
    'paru: install packages from the AUR'
    'yay: install packages from the AUR (alternative to paru)'
)
provides=('sword')
conflicts=('sword' 'sword-git')
install=sword-bin.install
source_x86_64=("https://github.com/ivngineer/sword/releases/download/v${pkgver}/sword-x86_64.tar.gz")
sha256sums_x86_64=('1f42416fb8f27cf8da603e251bb34dfed0f06a0db494a90df12d74a04bb3c2fa')

package() {
    # Main Tauri executable and the Go sidecar must live in the SAME directory:
    # Tauri resolves the sidecar relative to the main binary at runtime.
    install -Dm755 sword          "$pkgdir/usr/bin/sword"
    install -Dm755 sword-backend  "$pkgdir/usr/bin/sword-backend"

    install -Dm644 sword.desktop  "$pkgdir/usr/share/applications/sword.desktop"

    for size in 16 32 48 128 256; do
        install -Dm644 "icons/${size}x${size}/sword.png" \
            "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/sword.png"
    done
}
