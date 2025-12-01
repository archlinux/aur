# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Maintainer: oech3
# Contributor: xiota
pkgname=legcord-bin
_pkgname=Legcord
pkgver=1.1.6
_electronversion=38
pkgrel=1
pkgdesc="a custom client designed to enhance your Discord experience while keeping everything lightweight.(Prebuilt version.Use system-wide electron)"
arch=(
    'aarch64'
    'armv7h'
    'x86_64'
)
url="https://legcord.app"
_ghurl="https://github.com/Legcord/Legcord"
license=('OSL-3.0')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
    'python'
    'libpulse'
    'libpipewire'
)
options=(
    '!emptydirs'
)
source=(
    "LICENSE-${pkgver}.txt::https://raw.githubusercontent.com/Legcord/Legcord/v${pkgver}/license.txt"
    "${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-aarch64.rpm")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-armv7l.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-x86_64.rpm")
sha256sums=('c2cba32542cf3a65813e83fdbd259020d6d62b6833aa18f38aec983837dc9e4d'
            '31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6')
sha256sums_aarch64=('94e4d4aef4959d23f598f4de1fc578fc2650b4a749bdc5bca8fb0da66a0fe3ee')
sha256sums_armv7h=('f724d402c128dbcc9aae6cc384e6f26215c9d5a3a020ac535adb51b8474afd8c')
sha256sums_x86_64=('651b101be818390db29d32667abfde9771e65d46f64b88642f3a910b372ce937')
_get_electron_version() {
    _elec_ver="$(strings "${srcdir}/opt/${_pkgname}/${_pkgname}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
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
    _get_electron_version
    sed -i -e "
        s/\/opt\/${_pkgname}\/${_pkgname}/${pkgname%-bin}/g
        s/Icon=${_pkgname}/Icon=${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${_pkgname}.desktop"
    rm -rf \
        "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked/node_modules/koffi/build/koffi/"{darwin_*,freebsd_*,openbsd_*,win32_*} \
        "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked/node_modules/koffi/build/koffi/"{linux_ia32,linux_loong64,linux_riscv64d}
    case "${CARCH}" in
        aarch64)
            rm -rf \
                "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked/node_modules/koffi/build/koffi/"{linux_armhf,linux_x64} \
                "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked/node_modules/@vencord/venmic/prebuilds/venmic-addon-linux-x64"
            ;;
        armv7h)
            rm -rf \
                "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked/node_modules/koffi/build/koffi/"{linux_arm64,linux_x64} \
                "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked/node_modules/@vencord/venmic/prebuilds/"{venmic-addon-linux-arm64,venmic-addon-linux-x64}
            ;;
        x86_64)
            rm -rf \
                "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked/node_modules/koffi/build/koffi/"{linux_arm64,linux_armhf} \
                "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked/node_modules/@vencord/venmic/prebuilds/venmic-addon-linux-arm64"
            ;;
    esac
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    _icon_sizes=(16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
