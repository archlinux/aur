# Maintainer: iiPythonx
_appname=feishin
pkgname=iipython-feishin-electron-bin
_pkgname=feishin
pkgver=26.01.22_1.0
_tag=26.01.22-1.0
_assetver=26.01.22
_electronversion=39
pkgrel=1
pkgdesc="A modern self-hosted music player (iiPythonx build, prebuilt, system-wide electron)"
arch=('x86_64')
url="https://github.com/iiPythonx/feishin"
license=('GPL-3.0-only')
provides=("${_appname}=${pkgver}")
conflicts=(
    "${_appname}"
    "${_appname}-bin"
    "${_appname}-electron-bin"
)
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'asar'
)
source=("${pkgname%-bin}.sh")
source_x86_64=(
    "${pkgname%-bin}-${pkgver}-x86_64.AppImage::${url}/releases/download/${_tag}/${_appname}-${_assetver}-linux-x86_64.AppImage"
)
sha256sums=('4497d4c2cfb24ca0665cbeabf377a6bc850a8cfd6dd17469b0dc937a9ed6bf65')
sha256sums_x86_64=('80dc7e2936b4260e703b70ea1a39a7683b1254faf15ff9f2d4e24e85342cb871')

_get_electron_version() {
    _elec_ver="$(strings "${srcdir}/squashfs-root/${_appname}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
    echo -e "The electron version is: \033[1;31m${_elec_ver}\033[0m"
}

prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_appname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    if [ ! -x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" ]; then
        chmod +x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage"
    fi
    if [ -d "${srcdir}/squashfs-root" ]; then
        rm -rf "${srcdir}/squashfs-root"
    fi
    "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    _get_electron_version
    sed -i -e "
        s/AppRun --no-sandbox/${pkgname%-bin}/g
        s/Icon=${_appname}/Icon=${pkgname%-bin}/g
        s/StartupWMClass=${_pkgname}/StartupWMClass=${_appname}/g
    " "${srcdir}/squashfs-root/${_appname}.desktop"
    asar e "${srcdir}/squashfs-root/resources/app.asar" "${srcdir}/app.asar.unpacked"
    find "${srcdir}/app.asar.unpacked/out" -type f -exec sed -i "s/process.resourcesPath/'\/usr\/lib\/${pkgname%-bin}'/g" {} +
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
    find "${srcdir}/squashfs-root/resources/assets" -type d -exec chmod 755 {} +
}

package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/squashfs-root/resources/assets" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/lib/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/lib"
    _icon_sizes=(32x32 64x64 128x128 256x256 512x512 1024x1024)
    for _icons in "${_icon_sizes[@]}"; do
        install -Dm644 "${srcdir}/squashfs-root/resources/assets/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
