# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=requestly-bin
_pkgname=Requestly
pkgver=25.12.15
_electronversion=23
pkgrel=1
pkgdesc="Debug your network request across all platforms and browsers using a single app.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://requestly.com/"
_ghurl="https://github.com/requestly/requestly-desktop-app"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'python'
    'java-runtime'
)
makedepends=(
    'asar'
)
source=(
    "${pkgname%-bin}-${pkgver}-x86_64.AppImage::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.AppImage"
    "index.html-${pkgver}::https://raw.githubusercontent.com/requestly/requestly-desktop-app/v${pkgver}/src/loadingScreen/index.html"
    "${pkgname%-bin}.sh"
)
sha256sums=('5da591e1a9f9ed369ba35ba21f8c37686ffa89ef7dc8ae790ae5bbc7b44c00d0'
            '458836a4541233742fec5da1bf75b151cc0b1f879b0574f362ae793d055a233d'
            '31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6')
_get_electron_version() {
    _elec_ver="$(strings "${srcdir}/squashfs-root/${pkgname%-bin}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
    echo -e "The electron version is: \033[1;31m${_elec_ver}\033[0m"
}
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    if [ ! -x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" ];then
        chmod +x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage"
    fi
    if [ -d "${srcdir}/squashfs-root" ];then
        rm -rf "${srcdir}/squashfs-root"
    fi
    "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    _get_electron_version
    sed -i "s/AppRun/${pkgname%-bin}/g" "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    asar e "${srcdir}/squashfs-root/resources/app.asar" "${srcdir}/app.asar.unpacked"
    find "${srcdir}/app.asar.unpacked/dist/main" -type f -exec sed -i "s/process.resourcesPath/\"\/usr\/lib\/${pkgname%-bin}\"/g" {} +
    install -Dm644 "${srcdir}/index.html-${pkgver}" "${srcdir}/app.asar.unpacked/dist/loadingScreen/index.html"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
    find "${srcdir}/squashfs-root" -type d -exec chmod 755 {} +
    rm -rf \
        "${srcdir}/squashfs-root/resources/app.asar.unpacked/node_modules/win-version-info/prebuilds" \
        "${srcdir}/squashfs-root/resources/app.asar.unpacked/static/nss/"{darwin,win32} \
        "${srcdir}/squashfs-root/resources/app.asar.unpacked/static/overrides/path/"*.bat
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/squashfs-root/resources/"{app.asar.unpacked,static} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/lib/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/lib"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    _icon_sizes=(16x16 32x32 64x64 128x128 256x256 512x512 1024x1024)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
}