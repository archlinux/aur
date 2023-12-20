# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=envkey-bin
_appname=EnvKey
pkgver=1.5.10
_electronversion=24
pkgrel=5
pkgdesc="Secure, human-friendly, cross-platform secrets and config."
arch=(
    'i686'
    'x86_64'
)
url="https://www.envkey.com/"
_ghurl="https://github.com/envkey/envkey-app"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'hicolor-icon-theme'
    'libx11'
    'gdk-pixbuf2'
    'libxext'
    'libdbusmenu-glib'
    'gtk2'
    'dbus-glib'
)
makedepends=(
    'squashfuse'
)
source_i686=(
    "${pkgname%-bin}-${pkgver}-i686.AppImage::${_ghurl}/releases/download/linux-ia32-prod-v${pkgver}/${_appname}-${pkgver}-i386.AppImage"
    "LICENSE-i686-${pkgver}::https://raw.githubusercontent.com/envkey/envkey-app/linux-ia32-prod-v${pkgver}/LICENSE"
)
source_x86_64=(
    "${pkgname%-bin}-${pkgver}-x86_64.AppImage::${_ghurl}/releases/download/linux-x64-prod-v${pkgver}/${_appname}-${pkgver}.AppImage"
    "LICENSE-x86_64-${pkgver}::https://raw.githubusercontent.com/envkey/envkey-app/linux-x64-prod-v${pkgver}/LICENSE"
)
source=(
    "${pkgname%-bin}.sh"
)
sha256sums=('5ce46265f0335b03568aa06f7b4c57c5f8ffade7a226489ea39796be91a511bf')
sha256sums_i686=('906006984188184a967a81474dd03d29e0bff2559a32396c66a2d4f3ee476745'
                 '09b057e89473140a66ebb115d2c45af606ae7a7a3f1a8debad96f49bbea74ddd')
sha256sums_x86_64=('6d05c4672560e2785a1dc6141cabfcb4fdfe0025c58096ab471bf4ad48b65cc9'
                   '09b057e89473140a66ebb115d2c45af606ae7a7a3f1a8debad96f49bbea74ddd')
build() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
}
package() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@appasar@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/swiftshader"
    install -Dm644 "${srcdir}/squashfs-root/usr/lib/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/lib"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${CARCH}-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}