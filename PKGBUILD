# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=envkey-bin
_appname=EnvKey
pkgver=1.5.10
pkgrel=2
pkgdesc="Secure, human-friendly, cross-platform secrets and config."
arch=('i686' 'x86_64')
url="https://www.envkey.com/"
_githuburl="https://github.com/envkey/envkey-app"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('electron24' 'hicolor-icon-theme')
source_i686=("${pkgname%-bin}-${pkgver}-i686.AppImage::${_githuburl}/releases/download/linux-ia32-prod-v${pkgver}/${_appname}-${pkgver}-i386.AppImage")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.AppImage::${_githuburl}/releases/download/linux-x64-prod-v${pkgver}/${_appname}-${pkgver}.AppImage")
source=("LICENSE::https://raw.githubusercontent.com/envkey/envkey-app/master/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('09b057e89473140a66ebb115d2c45af606ae7a7a3f1a8debad96f49bbea74ddd'
            'ba42a6d73ddea10ed56557d2fd580498585ddf968e3ded256e861e6da859d8f5')
sha256sums_i686=('906006984188184a967a81474dd03d29e0bff2559a32396c66a2d4f3ee476745')
sha256sums_x86_64=('6d05c4672560e2785a1dc6141cabfcb4fdfe0025c58096ab471bf4ad48b65cc9')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
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