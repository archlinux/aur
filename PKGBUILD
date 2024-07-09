# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=uyou-todo-bin
_pkgname=uyoutodo
pkgver=3.0.0
_electronversion=31
pkgrel=1
pkgdesc="A todo list with electron"
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/tonylu110/uyou-todo-electron"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'fuse2'
    'asar'
)
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/tonylu110/uyou-todo-electron/${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.AppImage::${url}/releases/download/${pkgver}/uyou.ToDo-${pkgver}-arm64.AppImage")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.AppImage::${url}/releases/download/${pkgver}/uyou.ToDo-${pkgver}.AppImage")
sha256sums=('39db5a38eec57377569ab296b6a804062b8e7a72908db228ae1d6d91bcbb61d3'
            '2b2e8aeed33fd71c521e49fd54fb2fa81218d16aef8bccb88d77909055ab8051')
sha256sums_aarch64=('c15464e9b4be2133862c0f024d87cddd48d027a7adef01c0da01899c2ecf1f93')
sha256sums_x86_64=('c153b8a643b916e980e45eb811fbf0b19236596c82a70746d597873d56e6e637')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@cfgdirname@|${_pkgname}|g" \
        -e "s|@options@|env ELECTRON_OZONE_PLATFORM_HINT=auto|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun --no-sandbox|${pkgname%-bin}|g;s|${_pkgname}|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
    asar e "${srcdir}/squashfs-root/resources/app.asar" "${srcdir}/app.asar.unpacked"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${_pkgname}.png" "${srcdir}/app.asar.unpacked/electron/dist/logo.png"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/lib/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/lib"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}