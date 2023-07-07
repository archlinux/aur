# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="chatpad-ai-bin"
_appname="Chatpad-AI"
pkgver=1.4.0
pkgrel=1
pkgdesc="Not just another ChatGPT user-interface!"
arch=("x86_64")
url="https://chatpad.ai/"
_githuburl="https://github.com/deiucanta/chatpad"
license=('AGPL3')
depends=('electron' 'hicolor-icon-theme')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.AppImage::https://dl.todesktop.com/230313oyppkw40a"
    "${pkgname%-bin}.sh")
sha256sums=('05593b7575fe119cb08aa6049cb93d76dc2cfe0cc86fc0db2d22601f453d9c93'
            'd7898a0dda701cda08ff8eedbf1d10782427bfd75f9de3efe45246946570705b')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
   
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    sed "s|AppRun --no-sandbox %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g;s|${_appname}|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${_appname}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${_appname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
}