# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="android-toolkit-bin"
pkgver=1.5.16
pkgrel=1
pkgdesc="A cross platform desktop app written in Typescript/Node using React and Electron.A GUI for adb and can be used to modify android devices such as firesticks and google TVs."
arch=('x86_64')
url="https://github.com/AnthonyGress/Android-Toolkit"
license=("MIT")
depends=('electron25' 'hicolor-icon-theme' 'android-sdk-platform-tools')
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/Android-Toolkit.AppImage"
    "LICENSE::https://raw.githubusercontent.com/AnthonyGress/Android-Toolkit/main/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('b7c34a2e9f883befdf89a4d2ae4238c81bdb428ef9042f6eb5c56848790ec2e2'
            '65cb0d2fdca7e4375a2ab466fb1e37fef2514eb10c88c5cf8998893a77295176'
            '8ee44a380589e8671935e43f5ae7970a9a062957cf12ca7ab2a09edbf8c24bf7')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    cp -r "${srcdir}/squashfs-root/resources/"* "${pkgdir}/opt/${pkgname%-bin}"
    sed "s|AppRun --no-sandbox %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 180x180 192x192 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm755 -d "${pkgdir}/usr/bin/Android-Toolkit/apks" "${pkgdir}/usr/bin/Android-Toolkit/platform-tools"
    ln -s "/opt/android-sdk/platform-tools/adb" "${pkgdir}/usr/bin/Android-Toolkit/platform-tools/adb"
}