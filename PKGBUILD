# Maintainer: Manuel Kauschinger <admin at bruzzzla dot de>
pkgname=shimmer-firefly-wallet
pkgver=2.1.16
pkgrel=1
pkgdesc="The SMR Firefly Wallet"
arch=(x86_64)
url="https://iota.org/"
license=('Apache')
provides=(shimmer-firefly-wallet)
options=('!strip')
depends=('gnome-keyring' 'libsecret' 'gtk3' 'libxss' 'nss')

source_x86_64=("https://github.com/iotaledger/firefly/releases/download/desktop-shimmer-$pkgver/firefly-shimmer-desktop-$pkgver.AppImage")
sha256sums_x86_64=('ffbd9fe3f648bd972e156c5b6b8baf9c3facefc4e10c156d293100a6dea3e775')

source=("shimmer-firefly-wallet.desktop")
md5sums=('b86c333fd18633c8f94e86973c798eee')
sha512sums=('3a46d0563d792d39dccdb5f9e8d64ac8009a6eae75c71b7a0b39346e75893289934e32f26678ec86a9ee11eb06e551e673a34b294359d0e68ead34b1010d64e4')


prepare() {
    # Extract Appimage
    chmod +x "${srcdir}/firefly-shimmer-desktop-$pkgver.AppImage"
    "${srcdir}/firefly-shimmer-desktop-$pkgver.AppImage" --appimage-extract > /dev/null 2>&1
    chmod -x "${srcdir}/firefly-shimmer-desktop-$pkgver.AppImage"
}

package() {
    # Copy files
    install -dm755 "${pkgdir}/opt/${pkgname}"
    cp -Rr "${srcdir}/squashfs-root/"* "${pkgdir}/opt/${pkgname}"

    # Desktop entry
    install -Dm644 "${srcdir}/shimmer-firefly-wallet.desktop" "${pkgdir}/usr/share/applications/shimmer-firefly-desktop.desktop"

    # Icon
    install -dm755 "${pkgdir}/usr/share/icons/hicolor"
    cp -Rr "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/desktop.png" "${pkgdir}/usr/share/icons/shimmer-firefly-desktop.png"

    # fix file permissions - all files as 644 - directories as 755
    find "${pkgdir}/"{opt,usr} -type d -exec chmod 755 {} \;
    find "${pkgdir}/"{opt,usr} -type f -exec chmod 644 {} \;
    chmod +x "${pkgdir}/opt/${pkgname}/desktop"
	chmod +x "${pkgdir}/opt/${pkgname}/chrome_crashpad_handler"

    # Link binary
    install -dm755 "${pkgdir}/usr/bin"
    ln -sr "${pkgdir}/opt/${pkgname}/desktop" "${pkgdir}/usr/bin/shimmer-firefly-wallet"
}
