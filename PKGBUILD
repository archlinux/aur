pkgname=bloom-wallet
pkgver=0.1.12
pkgrel=1
pkgdesc="Bloom is a beautifully designed, user-centric wallet. Explore the best of Web3 in a safe, curated environment."
arch=(x86_64)
url="https://bloomwallet.io/"
license=('Apache')
provides=(bloom-wallet)
options=('!strip')
depends=('gnome-keyring' 'libsecret' 'gtk3' 'libxss' 'nss')

source_x86_64=("https://github.com/bloomwalletio/bloom/releases/download/desktop-$pkgver/bloom-desktop-$pkgver.AppImage")
sha256sums_x86_64=('SKIP')

prepare() {
    chmod +x "${srcdir}/bloom-desktop-$pkgver.AppImage"
    "${srcdir}/bloom-desktop-$pkgver.AppImage" --appimage-extract > /dev/null 2>&1
    chmod -x "${srcdir}/bloom-desktop-$pkgver.AppImage"
}

package() {
    install -dm755 "${pkgdir}/opt/${pkgname}"
    cp -Rr "${srcdir}/squashfs-root/"* "${pkgdir}/opt/${pkgname}"

    sed -i "s|Exec=desktop|Exec=/opt/${pkgname}/desktop|" "${srcdir}/squashfs-root/desktop.desktop"
    sed -i "s|Icon=desktop|Icon=/usr/share/icons/bloom.png|" "${srcdir}/squashfs-root/desktop.desktop"

    echo "Path=/opt/bloom-wallet" >> "${srcdir}/squashfs-root/desktop.desktop"

    install -Dm644 "${srcdir}/squashfs-root/desktop.desktop" "${pkgdir}/usr/share/applications/bloom.desktop"

    install -dm755 "${pkgdir}/usr/share/icons/hicolor"
    cp -Rr "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/desktop.png" "${pkgdir}/usr/share/icons/bloom.png"

    find "${pkgdir}/"{opt,usr} -type d -exec chmod 755 {} \;
    find "${pkgdir}/"{opt,usr} -type f -exec chmod 644 {} \;
    chmod +x "${pkgdir}/opt/${pkgname}/desktop"
    chmod +x "${pkgdir}/opt/${pkgname}/chrome_crashpad_handler"

    install -dm755 "${pkgdir}/usr/bin"
    ln -sr "${pkgdir}/opt/${pkgname}/desktop" "${pkgdir}/usr/bin/bloom-wallet"
}

