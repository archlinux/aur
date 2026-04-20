# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=airi-bin
_pkgname=AIRI
pkgver=0.9.0
_electronversion=40
pkgrel=1
pkgdesc="💖🧸 Self hosted, you owned Grok Companion, a container of souls of waifu, cyber livings to bring them into our worlds, wishing to achieve Neuro-sama's altitude.(Prebuilt version.Use system-wide electron)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://airi.moeru.ai/docs/"
_ghurl="https://github.com/moeru-ai/airi"
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
)
options=(
    '!emptydirs'
    '!strip'
)
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/moeru-ai/airi/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-aarch64.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-x86_64.rpm")
sha256sums=('f334260edf0508041280b534ca9d0abd5a02a9626c1d2e20a556ac4eb72b07f9'
            '31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6')
sha256sums_aarch64=('e97462cba4c8952d01c377cd0506b05dae41649f45cbfb5d7dbbbf3418be673c')
sha256sums_x86_64=('2d60e69852a4f514db7d01053ed4eff6fa5b804b74b042e2f1cc4ddf2866aede')
_get_electron_version() {
    _elec_ver="$(strings "${srcdir}/opt/${_pkgname}/${pkgname%-bin}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
    echo -e "The electron version is: \033[1;31m${_elec_ver}\033[0m"
}
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/ai.moeru.${pkgname%-bin}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    _get_electron_version
    sed -i "s/\/opt\/${_pkgname}\///g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    rm -rf \
        "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked/node_modules/electron-click-drag-plugin/build/Release/"{darwin-*,win32-*} \
        "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked/node_modules/onnxruntime-node/bin/napi-v3/"{darwin,win32}
    case "${CARCH}" in
        aarch64)
            rm -rf "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked/node_modules/onnxruntime-node/bin/napi-v3/linux/x64"
            ;;
        x86_64)
            rm -rf "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked/node_modules/onnxruntime-node/bin/napi-v3/linux/arm64"
            ;;
    esac
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -a "${srcdir}/opt/${_pkgname}/resources/". "${pkgdir}/usr/lib/${pkgname%-bin}/"
    _icon_sizes=(16x16 32x32 48x48 64x64 128x128 256x256)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
