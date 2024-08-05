# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=wiznote
pkgname="${_pkgname}-desktop-bin"
_appname=WizNote
pkgver=0.1.107
_electronversion=16
pkgrel=1
pkgdesc="A powerful note-taking tool."
arch=(
    'aarch64'
    'x86_64'
)
url="https://www.wiz.cn"
license=('LicenseRef-custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=(
    "${pkgname%-bin}"
    "${_pkgname}-electron"
)
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'fuse2'
    'asar'
)
source=(
    "LICENSE.html::${url}/share-termsofuse.html"
    "${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.AppImage::https://get.wiz.cn/x/${_pkgname}-desktop-${pkgver}-linux-arm64.AppImage")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.AppImage::https://get.wiz.cn/x/${_pkgname}-desktop-${pkgver}-linux-x86_64.AppImage")
sha256sums=('5309dacf6de88f4a349ca1dc0b3b8396f22a79f85622439d35cbc25d088c5d03'
            '2b2e8aeed33fd71c521e49fd54fb2fa81218d16aef8bccb88d77909055ab8051')
sha256sums_aarch64=('b1f2d7602ea533056129eb3575256fd149e14ed08131c3b6d3c45544cac5c4da')
sha256sums_x86_64=('d0370c1dfb06ce09e8502720156d530d2c7e98e68e632a133a194b0116df261c')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@cfgdirname@|${_appname}|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun --no-sandbox|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    asar e "${srcdir}/squashfs-root/resources/app.asar" "${srcdir}/app.asar.unpacked"
    sed "s|process.resourcesPath|\"\/usr\/lib\/${pkgname%-bin}\"|g" -i "${srcdir}/app.asar.unpacked/dist/main/main.prod.js"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
    find "${srcdir}/squashfs-root/resources" -type d -exec chmod 755 {} \;
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp "${srcdir}/squashfs-root/resources/"{app.asar.unpacked,assets} -r "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/lib/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/lib"
    for _icons in 16x16 32x32 256x256 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}