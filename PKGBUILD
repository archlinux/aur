# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=android-toolkit-bin
_appname=Android-Toolkit
pkgver=1.5.20
_electronversion=25
pkgrel=6
pkgdesc="A cross platform desktop app written in Typescript/Node using React and Electron.A GUI for adb and can be used to modify android devices such as firesticks and google TVs."
arch=('x86_64')
url="https://github.com/AnthonyGress/Android-Toolkit"
license=("MIT")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'android-sdk-platform-tools'
    "electron${_electronversion}"
    'hicolor-icon-theme'
)
makedepends=(
    'squashfuse'
)
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/${_appname}.AppImage"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/AnthonyGress/Android-Toolkit/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('da6f1f81366cec5bbc69cb0281853847966f7de02d7a54a01254b56c575263b8'
            '65cb0d2fdca7e4375a2ab466fb1e37fef2514eb10c88c5cf8998893a77295176'
            'd4272fed78cdcacd9edfb019134ac485d65b43f4d8c7a4179edbaed56af9b231')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@appasar@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun --no-sandbox|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    find "${srcdir}/squashfs-root" -type d -exec chmod 755 {} \;
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/squashfs-root/resources/assets" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 180x180 192x192 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 -d "${pkgdir}/usr/bin/${_appname}/apks" "${pkgdir}/usr/bin/${_appname}/platform-tools"
    ln -sf "/opt/android-sdk/platform-tools/adb" "${pkgdir}/usr/bin/${_appname}/platform-tools/adb"
}