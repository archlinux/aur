# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=linwood-butterfly-appimage
_appname="dev.linwood.butterfly"
_ver=beta.1
pkgver="2.0.0${_ver}"
pkgrel=1
pkgdesc="Powerful, minimalistic, cross-platform, opensource note-taking app"
arch=("x86_64")
url="https://docs.butterfly.linwood.dev/"
_githuburl="https://github.com/LinwoodDev/Butterfly"
license=('Apache' 'AGPL3' 'CC-BY-4.0')
options=(!strip)
conflits=("${pkgname%-appimage}")
depends=('zlib' 'glibc' 'hicolor-icon-theme')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver%${_ver}}-${_ver}/${pkgname%-appimage}-linux.AppImage"
    "LICENSE::https://raw.githubusercontent.com/LinwoodDev/Butterfly/develop/LICENSE")
sha256sums=('e725c96c4325bdc84c9eadac0f0090f9817d68fd535eab268a9e0d22891eb845'
            '8486a10c4393cee1c25392769ddd3b2d6c242d6ec7928e1414efff7dfb2f07ef')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|Exec=butterfly|Exec=${_install_path}/${pkgname%-appimage}.AppImage|g;s|${_appname}|${pkgname%-appimage}|g" -i "${srcdir}/squashfs-root/${_appname}.desktop"
}
      
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for _icons in 128x128 256x256;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/hicolor/${_icons}/apps/${_appname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png"
    done
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
    install -Dm644 "${srcdir}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}