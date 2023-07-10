# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="android-toolkit-bin"
pkgver=1.5.11
pkgrel=1
pkgdesc="A cross platform desktop app written in Typescript/Node using React and Electron.A GUI for adb and can be used to modify android devices such as firesticks and google TVs."
arch=('x86_64')
url="https://github.com/AnthonyGress/Android-Toolkit"
license=("MIT")
depends=('electron' 'hicolor-icon-theme' 'android-sdk-platform-tools')
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/Android-Toolkit.AppImage"
    "LICENSE::https://raw.githubusercontent.com/AnthonyGress/Android-Toolkit/main/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('dc42bbe36dae93f5c47fc96f8d548cafded7836ce09fc83ce8f1bd85d59b3801'
            '65cb0d2fdca7e4375a2ab466fb1e37fef2514eb10c88c5cf8998893a77295176'
            '80b4e3ccebf66b6048f56ccc53b7b0014bcb94a20d979d1140b7cb515148d779')
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