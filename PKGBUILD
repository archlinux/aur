# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=piclist-bin
_pkgname=PicList
pkgver=2.5.3
pkgrel=1
pkgdesc="a cloud storage platform management and file upload tool based on PicGo, which has been deeply redeveloped.一款云储存/图床管理和文件上传客户端工具,基于PicGo深度二次开发."
arch=('x86_64')
url="https://piclist.cn/"
_githuburl="https://github.com/Kuingsmile/PicList"
license=('MIT')
conflits=("${pkgname%-bin}")
depends=('bash' 'electron22' 'gcc-libs' 'glibc')
source=("${pkgname%-bin}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/Kuingsmile/PicList/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('a6a96185ecb880c4246603a44026ccb8014576e2815270e2303b2ffd6684f18b'
            'cddebc59798c76d191fc65eb4176d960e4e157177c9d81db80eaff8d84d86a1c'
            '704784c2cb1b6de71435ebd327d9720ecd2293c4635c9f27dd884173355df190')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun --no-sandbox %U|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    find "${srcdir}/squashfs-root/resources" -type d -perm 700 -exec chmod 755 {} \;
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/squashfs-root/resources/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/256x256/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}