# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=uyou-todo-bin
_pkgname=uyoutodo
pkgver=2.2.0
_electronversion=26
pkgrel=1
pkgdesc="A todo list with electron"
arch=('x86_64')
url="https://github.com/tonylu110/uyou-todo-electron"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'fuse2'
)
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::${url}/releases/download/${pkgver}/uyou.ToDo-${pkgver}.AppImage"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/tonylu110/uyou-todo-electron/${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('ac746a7a5660253ef02cc41aa3de0352fe7df9c918fb646675838b897f84fc67'
            '39db5a38eec57377569ab296b6a804062b8e7a72908db228ae1d6d91bcbb61d3'
            '24c1c5b90cba47cd3d7a3ff11a934fcdbb499f8c56423d22009ef33a775e2d21')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun --no-sandbox|${pkgname%-bin}|g;s|${_pkgname}|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/lib/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/lib"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}