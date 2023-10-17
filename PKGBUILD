# Maintainer: yukiiawa <yukiiawa@foxmail.com>
pkgname=postcat-appimage
_pkgname=Postcat
pkgver=0.5.1
pkgrel=1
pkgdesc="Postcat 是一个可扩展的 API 工具平台。集合基础的 API 管理和测试功能，并且可以通过插件简化你的 API 开发工作，让你可以更快更好地创建 API。An extensible API tool."
arch=('x86_64')
url="https://www.postcat.com/"
_githuburl="https://github.com/Postcatlab/postcat"
license=('Apache')
provides=("${pkgname%-appimage}=${pkgver}")
conflicts=("${pkgname%-appimage}")
depends=('bash' 'electron22' 'hicolor-icon-theme')
makedepends=('asar')
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.AppImage"
    "${pkgname%-appimage}.sh")
sha256sums=('9a1a3928d64df829b151d9aac4a69a4a8a0db6427f478c8af1cead260383e1ae'
            '8e023fcba18f4bc4da169ac0a7c3163005c55d16b260f39f45df6fc087bd7a41')
build() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    asar e "${srcdir}/squashfs-root/resources/app.asar" "${srcdir}/app.asar.unpacked"
    cp -r "${srcdir}/squashfs-root/resources/app.asar.unpacked" "${srcdir}"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
    sed "s|AppRun --no-sandbox %U|${pkgname%-appimage}|g" -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}.sh" "${pkgdir}/usr/bin/${pkgname%-appimage}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/opt/${pkgname%-appimage}/resources"
    for _icons in 16x16 24x24 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
}
