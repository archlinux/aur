# Maintainer: dergigi <dergigi@pm.me>
pkgname=goop-bin
pkgver=2.11.1
pkgrel=1
pkgdesc='Native NIP-17 client to chat with your clankers (and friends)'
arch=('x86_64')
url='https://goop.dergigi.com'
license=('GPL-3.0-or-later')
depends=('alsa-lib' 'bash' 'libgcc' 'glibc' 'hicolor-icon-theme' 'libxcb' 'libxkbcommon' 'libxkbcommon-x11' 'vulkan-icd-loader' 'wayland')
makedepends=('patchelf')
optdepends=('gnome-keyring: Secret Service provider for storing signer credentials'
            'kwallet: alternative Secret Service provider')
provides=("goop=${pkgver}")
conflicts=('goop')
options=('!strip' '!debug')
source=("goop-${pkgver}-linux-x64.tar.gz::https://github.com/dergigi/goop/releases/download/v${pkgver}/goop-linux-x64.tar.gz"
        'goop')
sha256sums=('1fb60e0dbe2add04644a4d90e05f2c4c93a10891dcdba008722f964656c691d9'
            '109196a81ab41147cc3d14a20cb5a17186fbf99658080ec213022e750e50e2d1')

prepare() {
    # Use Arch's libraries instead of the Ubuntu libraries bundled upstream.
    patchelf --remove-rpath goop.app/bin/goop
    # Upstream declares an action without providing its desktop action group.
    sed -i '/^Actions=NewChat;$/d' goop.app/share/applications/goop.desktop
}

package() {
    install -Dm755 goop.app/bin/goop "${pkgdir}/usr/lib/goop/goop"
    install -Dm755 goop "${pkgdir}/usr/bin/goop"
    install -Dm644 goop.app/share/applications/goop.desktop "${pkgdir}/usr/share/applications/goop.desktop"
    for size in 512x512 1024x1024; do
        install -Dm644 "goop.app/share/icons/hicolor/${size}/apps/goop.png" \
            "${pkgdir}/usr/share/icons/hicolor/${size}/apps/goop.png"
    done
}
