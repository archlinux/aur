# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=quicknote-bin
pkgver=2.0.3
_electronversion=22
pkgrel=2
pkgdesc="Helps to paste some random text or take some notes right from your taskbar!"
arch=('x86_64')
url="https://srilakshmikanthanp.github.io/quicknote/"
_ghurl="https://github.com/srilakshmikanthanp/quicknote"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'fuse2'
)
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}.AppImage"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/srilakshmikanthanp/quicknote/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('1bd36e4028e670c3e2dfdb8163fc04b65d2e19c7dab673c0cea3e05822bc273a'
            '39282d59b67575a0d421c3df6705e5fa5932677862f4b9540cda0e237659c92c'
            '2b2e8aeed33fd71c521e49fd54fb2fa81218d16aef8bccb88d77909055ab8051')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app|g" \
        -e "s|@cfgdirname@|${pkgname%-bin}|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun --no-sandbox|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    sed "s|process.resourcesPath|\"\/usr\/lib\/${pkgname%-bin}\"|g" -i "${srcdir}/squashfs-root/resources/app/.webpack/main/index.js"
    find "${srcdir}/squashfs-root/resources" -type d -exec chmod 755 {} \;
    find "${srcdir}/squashfs-root/resources" -type f -perm 660 -exec chmod 644 {} \;
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/lib/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/lib"
    cp -r "${srcdir}/squashfs-root/resources/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    for _icons in 16x16 32x32 64x64 128x128 256x256 400x400;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}