# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=uyou-todo-bin
_pkgname=uyoutodo
pkgver=2.0.4
pkgrel=1
pkgdesc="This is a todo list with electron"
arch=('x86_64')
url="https://github.com/tonylu110/uyou-todo-electron"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron25')
source=("${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/${pkgver}/uyou.ToDo-${pkgver}.AppImage"
    "https://raw.githubusercontent.com/tonylu110/uyou-todo-electron/main/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('b691145e33c58f5a4e8c6cf2c95b6a77b5fe38c90b08b660b07de9e9bc85209b'
            '39db5a38eec57377569ab296b6a804062b8e7a72908db228ae1d6d91bcbb61d3'
            'ddb7b6ad21e91e6a21442d9c4528048e2f26f495d57418e299443448d187cf89')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${_pkgname}.png" -t "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    sed "s|AppRun --no-sandbox %U|${pkgname%-bin}|g;s|${_pkgname}|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}