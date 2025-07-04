# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=atv-remote-bin
_macname=atv-desktop-remote
_pkgname=ATV-Remote
pkgver=1.4.5
_electronversion=33
pkgrel=1
pkgdesc="A simple app to allow you to control an Apple TV from your desktop.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://github.com/jklewa/atv-desktop-remote"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'python'
    'python-websockets'
)
makedepends=(
    'asar'
    'fuse2'
)
source=(
    "${pkgname%-bin}-${pkgver}-x86_64.AppImage::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.AppImage"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/jklewa/atv-desktop-remote/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('beeb9ec57f04fb18e2d25e36069adf55d68376516a42a8950dce51859b2764c9'
            'cc59293cf57cbc07ad2dd7fa94553da43bc493503b6387742274b999afdb9369'
            'f2fe8c189974ffb9d445e9a42bd4f1d5b60185607c3fcafae79ab44be224e013')
_get_electron_version() {
    _electronversion="$(strings "${srcdir}/squashfs-root/${_macname}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
    echo -e "The electron version is: \033[1;31m${_electronversion}\033[0m"
}
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname//-/ }/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    if [ ! -x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" ];then
        chmod +x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage"
    fi
    "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    _get_electron_version
    sed -i -e "
        s/AppRun --no-sandbox/${pkgname%-bin}/g
        s/Icon=${_macname}/Icon=${pkgname%-bin}/g
    " "${srcdir}/squashfs-root/${_macname}.desktop"
    asar e "${srcdir}/squashfs-root/resources/app.asar" "${srcdir}/app.asar.unpacked"
    find "${srcdir}/app.asar.unpacked" -type f -name "*.js" -exec sed -i "s/process.env.HOME + \"\/.local\/share\"/\'\/usr\/lib\/${pkgname%-bin}\'/g" {} +
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm666 "${srcdir}/squashfs-root/server/wsserver.py" -t "${pkgdir}/usr/lib/${pkgname%-bin}/${_pkgname//-/ }"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${_macname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/squashfs-root/${_macname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
