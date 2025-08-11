# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=tabby
pkgname="${_appname}-electron-bin"
_pkgname=Tabby
pkgver=1.0.225
_electronversion=36
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
sha256sums_aarch64=('be1a7b87a6b4adfc13213370ae1e14fc938c60766f19ca5ef9ef8156a043eb2b')
sha256sums_armv7h=('475082909f459f56d0b043a738b988d885c3fd60714213300044aa307c320e43')
sha256sums_x86_64=('c54784568f7fb7b07a5526d316a5d205874d5bd0143d8aaa8b07dac974099d5c')
_get_electron_version() {
    _electronversion="$(strings "${srcdir}/opt/${_pkgname}/${_appname}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
    echo -e "The electron version is: \033[1;31m${_electronversion}\033[0m"
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
    find "${srcdir}/app.asar.unpacked/dist" -type f -exec sed -i "s/process.resourcesPath/\'\/usr\/lib\/${pkgname%-bin}\'/g" {} +
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/app.asar"
    case "${CARCH}" in
        aarch64)
            rm -rf "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked/node_modules/@serialport/bindings-cpp/prebuilds/"{android-*,darwin-*,win32-*,linux-arm,linux-x64}
            rm -rf "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked/node_modules/russh/"{russh.darwin*,russh.win32*,russh.linux-arm-g*,russh.linux-x64*}
            ;;
        armv7h)
            rm -rf "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked/node_modules/@serialport/bindings-cpp/prebuilds/"{android-*,darwin-*,win32-*,linux-arm64,linux-x64}
            rm -rf "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked/node_modules/russh/"{russh.darwin*,russh.win32*,russh.linux-arm64*,russh.linux-x64*}
            ;;
        x86_64)
            rm -rf "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked/node_modules/@serialport/bindings-cpp/prebuilds/"{android-*,darwin-*,linux-arm*,win32-*}
            rm -rf "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked/node_modules/russh/"{russh.darwin*,russh.win32*,russh.linux-arm*}
            ;;
    esac
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_pkgname}/resources/"{app.asar.unpacked,builtin-plugins,extras} "${pkgdir}/usr/lib/${pkgname%-bin}"
    _icon_sizes=(32x32 128x128 256x256 512x512)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_appname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
