# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=tabby
pkgname="${_appname}-electron-bin"
_pkgname=Tabby
pkgver=1.0.231
_electronversion=38
pkgrel=1
pkgdesc="A terminal for a more modern age.(Prebuilt version.Use system-wide electron)"
arch=(
    'aarch64'
    'armv7h'
    'x86_64'
)
url="https://tabby.sh/"
_ghurl="https://github.com/Eugeny/tabby"
license=('MIT')
conflicts=("${_appname}")
provides=("${_appname}=${pkgver}")
depends=(
    "electron${_electronversion}"
    'python'
    'libsecret'
)
makedepends=(
    'asar'
)
options=(
    '!emptydirs'
)
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/Eugeny/tabby/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${_ghurl}/releases/download/v${pkgver}/${_appname}-${pkgver}-linux-arm64.rpm")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.rpm::${_ghurl}/releases/download/v${pkgver}/${_appname}-${pkgver}-linux-armv7l.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${_ghurl}/releases/download/v${pkgver}/${_appname}-${pkgver}-linux-x64.rpm")
sha256sums=('ac295694b9f56e90dce3cf58313ed891d0bd9178adec02d8503a0c07d9d34c68'
            '31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6')
sha256sums_aarch64=('ac053c1dd350ff452a13e495653669dc49b582aec343af598fc7d23619190518')
sha256sums_armv7h=('0b1f092c6b160dc0514f3cc66d154ac7c87a881a4c78636ce58729efc20ece98')
sha256sums_x86_64=('183b823950d4e49dca1e9b127a0c5d25b35af2a2314647b1b773d790ca261a1d')
_get_electron_version() {
    _elec_ver="$(strings "${srcdir}/opt/${_pkgname}/${_appname}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
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
    _get_electron_version
    sed -i -e "
        s/\/opt\/${_pkgname}\/${_appname} --no-sandbox/${pkgname%-bin}/g
        s/Icon=${_appname}/Icon=${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${_appname}.desktop"
    asar e "${srcdir}/opt/${_pkgname}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    rm -rf "${srcdir}/opt/${_pkgname}/resources/app.asar"
    find "${srcdir}/app.asar.unpacked/dist" -type f -exec sed -i "s/process.resourcesPath/\'\/usr\/lib\/${pkgname%-bin}\'/g" {} +
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/opt/${_pkgname}/resources/app.asar"
    find "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked/node_modules" \
        -type d \( -name "android-*" -o -name "darwin-*" -o -name "win32-*" \) \
        -exec rm -rf {} +
    case "${CARCH}" in
        aarch64)
            find "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked/node_modules" \
                -type d \( -name "linux-arm" -o -name "linux-x64" \) \
                -exec rm -rf {} +
            ;;
        armv7h)
            find "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked/node_modules" \
                -type d \( -name "linux-arm64" -o -name "linux-x64" \) \
                -exec rm -rf {} +
            ;;
        x86_64)
            find "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked/node_modules" \
                -type d \( -name "linux-arm" -o -name "linux-arm64" \) \
                -exec rm -rf {} +
            ;;
    esac
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -a "${srcdir}/opt/${_pkgname}/resources/". "${pkgdir}/usr/lib/${pkgname%-bin}/"
    _icon_sizes=(16x16 32x32 64x64 256x256 512x512)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_appname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
