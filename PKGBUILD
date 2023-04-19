# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="apifox-appimage"
pkgver=2.2.33
pkgrel=1
pkgdesc="Apifox=Postman+Swagger+Mock+JMeter.API 文档、API 调试、API Mock、API 自动化测试"
arch=('x86_64')
url="https://apifox.com/"
license=('custom')
conflicts=("${pkgname%-appimage}")
providers=("${pkgname%-appimage}")
depends=('hicolor-icon-theme' 'zlib' 'glibc')
options=(!strip)
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.zip::https://cdn.apifox.cn/download/Apifox-linux-latest.zip"
  "LICENSE.html::${url}/help/app/faq/")
sha256sums=('d9fd38b20762a82a7d98c1bb3f944f17a4d5627a42b7d9d9dcf8c4e71de71e3a'
            'd6411651b59c49d7cfb6cbc3736e669c90a9db7a7c0370dc50039f18a0fcd650')
   
prepare() {
    chmod a+x "Apifox.AppImage"
    "./Apifox.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/apifox.AppImage|g;s|Utility|Utility;Development|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
   
package() {
    install -Dm755 "${srcdir}/Apifox.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
      install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
        -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}