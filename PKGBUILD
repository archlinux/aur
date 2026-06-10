# Maintainer: britors <rodrigo@w3ti.com.br>
pkgname=draco-bin
pkgver=11.1.2
pkgrel=1
pkgdesc="Multi-database desktop client — explorer, query editor, table creator/editor, ERD, and more"
arch=('x86_64')
url="https://github.com/britors/Draco"
license=('GPL-3.0-or-later')
depends=('gtk3' 'nss' 'alsa-lib' 'libnotify' 'libxss' 'libxtst')
makedepends=('librsvg')
provides=('draco')
conflicts=('draco')
options=('!debug' '!strip')
source=("https://github.com/britors/Draco/releases/download/v${pkgver}/draco_${pkgver}_amd64.deb"
        "https://raw.githubusercontent.com/britors/Draco/main/logo.svg")
sha256sums=('SKIP'
            'b22695b2f97a91e4995fe11fd5cd60a63522818fa49af063cfa300a75a6b3ba6')

prepare() {
    ar x "draco_${pkgver}_amd64.deb"
}

package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}"

    # ícone SVG correto
    install -Dm644 "logo.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/draco.svg"

    # gera PNGs a partir do SVG, sobrescrevendo os PNGs do Electron incluídos no .deb
    for size in 16 32 48 64 128 256; do
        install -dm755 "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps"
        rsvg-convert -w "${size}" -h "${size}" "logo.svg" \
            -o "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/draco.png"
    done

    # symlink no PATH
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/Draco/draco" "${pkgdir}/usr/bin/draco"

    # chrome-sandbox precisa de setuid
    chmod 4755 "${pkgdir}/opt/Draco/chrome-sandbox"
}
