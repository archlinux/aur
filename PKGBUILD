# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=android-toolkit-appimage
pkgver=1.4.1
pkgrel=1
pkgdesc="A cross platform desktop app written in Typescript/Node using React and Electron. Android-Toolkit is a GUI for adb and can be used to modify android devices such as firesticks and google TVs."
arch=('x86_64')
url="https://github.com/AnthonyGress/Android-Toolkit"
license=('MIT')
options=('!strip')
replaces=("firetv-toolkit-appimage")
conflits=("${pkgname%-appimage}" "firetv-toolkit-appimage")
depends=('zlib' 'glibc' 'hicolor-icon-theme')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/Android-Toolkit-${pkgver}.AppImage"
    "LICENSE::https://raw.githubusercontent.com/AnthonyGress/Android-Toolkit/main/LICENSE")
sha256sums=('5e65462ffcb5c037b06344c8933b6f13a797d66795ef4b7993f4d254511d18f8'
            '65cb0d2fdca7e4375a2ab466fb1e37fef2514eb10c88c5cf8998893a77295176')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${_install_path}/${pkgname%-appimage}.AppImage|g" -i "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop"
}
     
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    for _icons in 16x16 32x32 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-appimage}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/squashfs-root/"LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}