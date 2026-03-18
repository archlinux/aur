# Maintainer: MagicTerm <magicterm@users.noreply.github.com>
pkgname=magicterm-bin
pkgver=0.3.11
pkgrel=1
pkgdesc="Cross-platform SSH/SFTP client with E2E encryption"
arch=('x86_64')
url="https://github.com/D3FVLT/MagicTerm"
license=('MIT')
depends=('gtk3' 'nss' 'libxss' 'libsecret')
provides=('magicterm')
conflicts=('magicterm')
options=('!strip')
source=("${pkgname}-${pkgver}.AppImage::https://github.com/D3FVLT/MagicTerm/releases/download/v${pkgver}/MagicTerm-${pkgver}-x86_64.AppImage")
sha256sums=('e750632072eb935b06553f2029ef053d9b457257bd18840784f3c040fb0f60c7')

prepare() {
    chmod +x "${pkgname}-${pkgver}.AppImage"
    "./${pkgname}-${pkgver}.AppImage" --appimage-extract
}

package() {
    install -dm755 "${pkgdir}/opt/${pkgname}"
    cp -r squashfs-root/* "${pkgdir}/opt/${pkgname}/"
    
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/magic-term" "${pkgdir}/usr/bin/magicterm"
    
    if [ -f "squashfs-root/magic-term.desktop" ]; then
        install -Dm644 "squashfs-root/magic-term.desktop" "${pkgdir}/usr/share/applications/magicterm.desktop"
    fi
    
    for size in 16 32 48 64 128 256 512; do
        if [ -f "squashfs-root/usr/share/icons/hicolor/${size}x${size}/apps/magic-term.png" ]; then
            install -Dm644 "squashfs-root/usr/share/icons/hicolor/${size}x${size}/apps/magic-term.png" \
                "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/magicterm.png"
        fi
    done
}
