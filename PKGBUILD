# Maintainer: TrueRandom <rantruedom at gmail dot com>
pkgname=iota-trinity-wallet
pkgver=0.3.3
pkgrel=1
pkgdesc="The IOTA Trinity Wallet"
arch=(x86_64)
url="https://trinity.iota.org/"
license=('Apache')
provides=(iota-trinity-wallet)
source=()
options=('!strip')

source_x86_64=("https://github.com/iotaledger/trinity-wallet/releases/download/desktop-v$pkgver/trinity-desktop-$pkgver.AppImage")
md5sums_x86_64=('2dc09238410108da78f82606db932f27')
sha512sums_x86_64=('675b710c6044cf9793c6afb16a95e7c13b208dc3ea6e7df472d28cea36f07f95ab9419e2f81000558523fa07598fb3353c06fd48e7e210b6decc87bc83826e75')

source=("iota-trinity-wallet.desktop")
md5sums=('ebf2fc6a46b006ded903b6591c8f5897')
sha512sums=('eac7d8322ce501a0352d8998cd9fe53bd33c836f1fc9f1b775573bd741a2b402f66f82785f747b72702add15320e5cee8f62482bf2882176af57a9f5b3b0af0f')

prepare() {
    # Extract Appimage
    chmod +x "${srcdir}/trinity-desktop-$pkgver.AppImage"
    "${srcdir}/trinity-desktop-$pkgver.AppImage" --appimage-extract
    chmod -x "${srcdir}/trinity-desktop-$pkgver.AppImage"
}

package() {
    # Copy files
    install -dm755 "${pkgdir}/opt/${pkgname}"
    cp -Rr "${srcdir}/squashfs-root/"* "${pkgdir}/opt/${pkgname}"

    # Desktop entry
    install -Dm644 "${srcdir}/iota-trinity-wallet.desktop" "${pkgdir}/usr/share/applications/trinity-desktop.desktop"

    # Icon
    install -dm755 "${pkgdir}/usr/share/icons/hicolor"
    cp -Rr "${srcdir}/squashfs-root/usr/share/icons/hicolor/" "${pkgdir}/usr/share/icons/"

    # fix file permissions - all files as 644 - directories as 755
    find "${pkgdir}/"{opt,usr} -type d -exec chmod 755 {} \;
    find "${pkgdir}/"{opt,usr} -type f -exec chmod 644 {} \;
    chmod +x "${pkgdir}/opt/${pkgname}/trinity-desktop"

    # Link binary
    install -dm755 "${pkgdir}/usr/bin"
    ln -sr "${pkgdir}/opt/${pkgname}/trinity-desktop" "${pkgdir}/usr/bin/iota-trinity-wallet"
}