# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="uyou-todo-bin"
_pkgname="uyoutodo"
pkgver=1.3.3
pkgrel=1
pkgdesc="This is a todo list with electron"
arch=('x86_64')
url="https://github.com/tonylu110/uyou-todo-electron"
license=('MIT')
conflicts=("${pkgname%-bin}")
depends=('electron')
source=("${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/${pkgver}/uyou.ToDo-${pkgver}.AppImage"
    "https://raw.githubusercontent.com/tonylu110/uyou-todo-electron/main/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('ec7e8f698c2d58e246d6880219bb03fa45b66959f1181698ab9650ee38925c2a'
            '39db5a38eec57377569ab296b6a804062b8e7a72908db228ae1d6d91bcbb61d3'
            '31f38a4af41338c949ec584b3a3ebff244d67aa173697335eedf4fdc30cfe8de')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${_pkgname}.png" -t "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    sed "s|AppRun --no-sandbox %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g;s|${_pkgname}|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}