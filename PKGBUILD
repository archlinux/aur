# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=piclist-bin
pkgver=1.9.7
pkgrel=1
pkgdesc="a cloud storage platform management and file upload tool based on PicGo, which has been deeply redeveloped.一款云储存/图床管理和文件上传客户端工具,基于PicGo深度二次开发."
arch=('x86_64')
url="https://piclist.cn/"
_githuburl="https://github.com/Kuingsmile/PicList"
license=('MIT')
conflits=("${pkgname%-bin}")
depends=('electron22' 'gcc-libs' 'glibc')
source=("${pkgname%-bin}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/PicList-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/Kuingsmile/PicList/dev/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('b115cd680c9f1147a9570e005844596f8aa9918c9689b58c931481c76a1b2c0e'
            'cddebc59798c76d191fc65eb4176d960e4e157177c9d81db80eaff8d84d86a1c'
            '42d13eb414589f800fc03fe5ebdeb2ba6d0598a7290d44b33b0cf993f749b661')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
     
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    cp -r "${srcdir}/squashfs-root/resources/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/256x256/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    sed "s|AppRun --no-sandbox %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    find "${pkgdir}/opt/${pkgname%-bin}" -type d -exec chmod 755 {} \;
}