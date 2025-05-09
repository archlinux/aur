# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=houdoku-bin
_pkgname=Houdoku
pkgver=2.16.0
_electronversion=32
pkgrel=1
pkgdesc="Manga reader and library manager for the desktop.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://houdoku.org/"
_ghurl="https://github.com/xgi/houdoku"
license=("MIT")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'asar'
    'fuse2'
)
options=('!strip')
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.AppImage"
    "LICENSE-${pkgver}.txt::https://raw.githubusercontent.com/xgi/houdoku/v${pkgver}/LICENSE.txt"
    "${pkgname%-bin}.sh"
)
sha256sums=('3fd7fcb792ba73d845fea7b416abf9a40801deb8f26bd16cc15eac3c5d7290e8'
            '815575dfc47f9dd48999c193cbf60a5ce81b8493dafe998e4c72fda4d61ea473'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    if [ ! -x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" ];then
        chmod +x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    fi
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed -i "s/AppRun --no-sandbox/${pkgname%-bin}/g" "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    asar e "${srcdir}/squashfs-root/resources/app.asar" "${srcdir}/app.asar.unpacked"
    find "${srcdir}/app.asar.unpacked/out" -type f -exec sed -i "s/process.resourcesPath/\'\/usr\/lib\/${pkgname%-bin}\'/g" {} +
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
    rm -rf \
        "${srcdir}/squashfs-root/resources/app.asar.unpacked/node_modules/@biomejs/cli-linux-x64-musl" \
        "${srcdir}/squashfs-root/resources/app.asar.unpacked/node_modules/@rollup/rollup-linux-x64-musl" \
        "${srcdir}/squashfs-root/resources/app.asar.unpacked/node_modules/bufferutil/prebuilds/"{darwin-*,win32-*} \
        "${srcdir}/squashfs-root/resources/app.asar.unpacked/node_modules/utf-8-validate/prebuilds/"{darwin-*,win32-*}
    find "${srcdir}/squashfs-root/resources" -type d -perm 700 -exec chmod 755 {} +
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/squashfs-root/resources/"{app.asar.unpacked,assets} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/512x512/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}