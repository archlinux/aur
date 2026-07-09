# Maintainer: logan_reed <liulingzhang.work@icloud.com>

_pkgname=navicat17-premium-cs
pkgname=navicat17-premium-zh-cn
pkgver=17.3.10
pkgrel=1
pkgdesc="Navicat Premium is a multi-connection database development tool. (Chinese Simplified)"
arch=('x86_64' 'aarch64')
url='https://www.navicat.com.cn/products/navicat-premium'
license=('LicenseRef-Navicat')
depends=('fontconfig' 'freetype2' 'hicolor-icon-theme')
conflicts=('navicat' 'navicat-premium' 'navicat17-premium')
provides=("navicat=$pkgver")
source=("navicat.sh")
source_x86_64=("${_pkgname}-x86_64-${pkgver}.AppImage::https://dn.navicat.com/download/navicat17-premium-cs-x86_64.AppImage")
source_aarch64=("${_pkgname}-aarch64-${pkgver}.AppImage::https://dn.navicat.com/download/navicat17-premium-cs-aarch64.AppImage")

b2sums=('7c5ff753c2800d2dc7b0194d7ee5b4ac0b2e9d056fb69205e52b0c3e3c50d2335caaeca6ff9a3f41bd22d89e9f3c320dbbbacf965608a4d3e94d7bded942cf85')
b2sums_x86_64=('c633020961f2fabe7a37f5998f41644ec425010d98ef75ae42bce0e3cbd7488691b93740f1123c12a4a28cd65022f596bc5fb3c0bd3dd1acdf040cb29d53489f')
b2sums_aarch64=('a0891e62a0d9fa4613afc21e5fd2d91020a48723cc1993ca5fa8827abd362d601463e7eab446ed8ff5f56abe9c8a7276f7a63808f97b5a4171cdbf71bc3897c5')

options=('!strip' '!debug')

prepare() {
    cd "${srcdir}/" && rm -rf "squashfs-root"
    chmod +x "${srcdir}/${_pkgname}-${CARCH}-${pkgver}.AppImage"
    "${srcdir}/${_pkgname}-${CARCH}-${pkgver}.AppImage" --appimage-extract
}

package() {
    install -d "${pkgdir}/opt/${_pkgname}"
    cp -a "${srcdir}/squashfs-root/." "${pkgdir}/opt/${_pkgname}/"

    # Desktop entry
    install -Dm644 "squashfs-root/navicat.desktop" \
        "${pkgdir}/usr/share/applications/navicat.desktop"
    sed -i 's|Icon=.*|Icon=navicat-icon|' "${pkgdir}/usr/share/applications/navicat.desktop"

    # Icon
    install -Dm644 "squashfs-root/navicat-icon.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/navicat-icon.png"

    # Launcher
    install -Dm755 "${srcdir}/navicat.sh" "${pkgdir}/usr/bin/navicat"

    # Remove Debian copyright files
    rm -rf "${pkgdir}/opt/${_pkgname}/usr/share/doc"
    rm -rf "${pkgdir}/opt/${_pkgname}/share/doc"
}
