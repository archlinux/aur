# Maintainer: Manuel Kauschinger <admin at bruzzzla dot de>
pkgname=iota-firefly-wallet
pkgver=1.7.1
pkgrel=1
pkgdesc="The IOTA Firefly Wallet"
arch=(x86_64)
url="https://iota.org/"
license=('Apache')
provides=(iota-firefly-wallet)
options=('!strip')
depends=('gnome-keyring' 'libsecret' 'gtk3' 'libxss' 'nss')


source_x86_64=("https://github.com/iotaledger/firefly/releases/download/desktop-$pkgver/firefly-desktop-$pkgver.AppImage")
sha256sums_x86_64=('f984b6e5273ba74796f42ebf94142e2f2258f557a08b0ceeda44a07423635b14')

source=("iota-firefly-wallet.desktop")
md5sums=('c22e0c2b6cd8941ea147ddc01352858a')
sha512sums=('e7e47f5c99d0536de091204df8eb94fb32471ae550f7861fd0373057af90f8bf4f5aa9fa53ea4fa12303b41bb6a23905d99b751f2c849c3b2c67735a66780714')


prepare() {
    # Extract Appimage
    chmod +x "${srcdir}/firefly-desktop-$pkgver.AppImage"
    "${srcdir}/firefly-desktop-$pkgver.AppImage" --appimage-extract > /dev/null 2>&1
    chmod -x "${srcdir}/firefly-desktop-$pkgver.AppImage"
}

package() {
    # Copy files
    install -dm755 "${pkgdir}/opt/${pkgname}"
    cp -Rr "${srcdir}/squashfs-root/"* "${pkgdir}/opt/${pkgname}"

    # Desktop entry
    install -Dm644 "${srcdir}/iota-firefly-wallet.desktop" "${pkgdir}/usr/share/applications/firefly-desktop.desktop"

    # Icon
    install -dm755 "${pkgdir}/usr/share/icons/hicolor"
    cp -Rr "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/desktop.png" "${pkgdir}/usr/share/icons/firefly-desktop.png"

    # fix file permissions - all files as 644 - directories as 755
    find "${pkgdir}/"{opt,usr} -type d -exec chmod 755 {} \;
    find "${pkgdir}/"{opt,usr} -type f -exec chmod 644 {} \;
    chmod +x "${pkgdir}/opt/${pkgname}/desktop"

    # Link binary
    install -dm755 "${pkgdir}/usr/bin"
    ln -sr "${pkgdir}/opt/${pkgname}/desktop" "${pkgdir}/usr/bin/iota-firefly-wallet"
}
