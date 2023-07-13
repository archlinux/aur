# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="envkey-bin"
pkgver=1.5.10
pkgrel=1
pkgdesc="Secure, human-friendly, cross-platform secrets and config."
arch=('x86_64')
url="https://www.envkey.com/"
_githuburl="https://github.com/envkey/envkey-app"
license=('MIT')
conflicts=("${pkgname%-bin}")
depends=('electron' 'hicolor-icon-theme')
source=("${pkgname%-bin}-${pkgver}.AppImage::${_githuburl}/releases/download/linux-x64-prod-v${pkgver}/EnvKey-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/envkey/envkey-app/master/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('6d05c4672560e2785a1dc6141cabfcb4fdfe0025c58096ab471bf4ad48b65cc9'
            '09b057e89473140a66ebb115d2c45af606ae7a7a3f1a8debad96f49bbea74ddd'
            '0a845db56efbe634eeb534ea08786574f8d131498eb6276476c9605bf75e05b2')
      
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
  
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    cp -r "${srcdir}/squashfs-root/resources/"* "${pkgdir}/opt/${pkgname%-bin}"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    sed "s|AppRun|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}