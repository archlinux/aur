# Maintainer: MagicTerm <magicterm@users.noreply.github.com>
pkgname=magicterm-bin
pkgver=0.3.15
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
sha256sums=('d48629441dd17588b4f976b22937b64e864beecdd5e05a44fff35f865f83a0fa')

prepare() {
    chmod +x "${pkgname}-${pkgver}.AppImage"
    "./${pkgname}-${pkgver}.AppImage" --appimage-extract
}

package() {
    install -dm755 "${pkgdir}/opt/${pkgname}"
    cp -r squashfs-root/* "${pkgdir}/opt/${pkgname}/"
    
    find "${pkgdir}/opt/${pkgname}" -type d -exec chmod 755 {} \;
    find "${pkgdir}/opt/${pkgname}" -type f -exec chmod 644 {} \;
    chmod 755 "${pkgdir}/opt/${pkgname}/@magictermdesktop"
    chmod 755 "${pkgdir}/opt/${pkgname}/chrome_crashpad_handler"
    chmod 755 "${pkgdir}/opt/${pkgname}/chrome-sandbox"
    chmod 4755 "${pkgdir}/opt/${pkgname}/chrome-sandbox"

    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/@magictermdesktop" "${pkgdir}/usr/bin/magicterm"

    install -Dm644 "squashfs-root/@magictermdesktop.desktop" "${pkgdir}/usr/share/applications/magicterm.desktop"
    sed -i 's|Exec=.*|Exec=/usr/bin/magicterm %U|g' "${pkgdir}/usr/share/applications/magicterm.desktop"
    sed -i 's|Icon=.*|Icon=magicterm|g' "${pkgdir}/usr/share/applications/magicterm.desktop"

    for size in 16 32 48 64 128 256 512 1024; do
        if [ -f "squashfs-root/usr/share/icons/hicolor/${size}x${size}/apps/@magictermdesktop.png" ]; then
            install -Dm644 "squashfs-root/usr/share/icons/hicolor/${size}x${size}/apps/@magictermdesktop.png" \
                "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/magicterm.png"
        fi
    done
}
