# Maintainer: dergigi <dergigi@pm.me>
pkgname=goop-bin
pkgver=2.12.0
pkgrel=1
pkgdesc='Native NIP-17 client to chat with your clankers (and friends)'
arch=('x86_64')
url='https://goop.dergigi.com'
license=('GPL-3.0-or-later')
depends=('alsa-lib' 'bash' 'libgcc' 'glibc' 'hicolor-icon-theme' 'libxcb' 'libxkbcommon' 'libxkbcommon-x11' 'vulkan-icd-loader' 'wayland')
makedepends=('patchelf' 'imagemagick')
optdepends=('gnome-keyring: Secret Service provider for storing signer credentials'
            'kwallet: alternative Secret Service provider')
provides=("goop=${pkgver}")
conflicts=('goop')
options=('!strip' '!debug')
source=("goop-${pkgver}-linux-x64.tar.gz::https://github.com/dergigi/goop/releases/download/v${pkgver}/goop-linux-x64.tar.gz"
        'goop')
sha256sums=('7502b6e65244b183ee82ec6096a6f585b8bbcf4aadc617636321df0e5828ad09'
            '109196a81ab41147cc3d14a20cb5a17186fbf99658080ec213022e750e50e2d1')

prepare() {
    # Use Arch's libraries instead of the Ubuntu libraries bundled upstream.
    patchelf --remove-rpath goop.app/bin/goop
    # Upstream declares an action without providing its desktop action group.
    sed -i -e '/^Actions=NewChat;$/d' \
        -e 's/^Icon=goop$/Icon=com.dergigi.goop/' \
        goop.app/share/applications/goop.desktop
    printf '\nStartupWMClass=com.dergigi.goop\nTerminal=false\n' >> goop.app/share/applications/goop.desktop
    for size in 16 24 32 48 64 128 256; do
        mkdir -p "icons/${size}x${size}"
        magick goop.app/share/icons/hicolor/512x512/apps/goop.png \
            -resize "${size}x${size}" "icons/${size}x${size}/com.dergigi.goop.png"
    done
}

package() {
    install -Dm755 goop.app/bin/goop "${pkgdir}/usr/lib/goop/goop"
    install -Dm755 goop "${pkgdir}/usr/bin/goop"
    install -Dm644 goop.app/share/applications/goop.desktop "${pkgdir}/usr/share/applications/com.dergigi.goop.desktop"
    for size in 16 24 32 48 64 128 256; do
        install -Dm644 "icons/${size}x${size}/com.dergigi.goop.png" \
            "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/com.dergigi.goop.png"
    done
    for size in 512x512 1024x1024; do
        install -Dm644 "goop.app/share/icons/hicolor/${size}/apps/goop.png" \
            "${pkgdir}/usr/share/icons/hicolor/${size}/apps/com.dergigi.goop.png"
    done
}
