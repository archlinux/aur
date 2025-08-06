# Maintainer: oech3
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: xiota
pkgname=legcord-bin
_pkgname=Legcord
pkgver=1.1.5
_electron_major_ver=36
pkgrel=3
pkgdesc="Discord client with builtin client mod and theme support."
arch=(
    'aarch64'
    'armv7h'
    'x86_64'
)
url="https://legcord.app/"
_ghurl="https://github.com/Legcord/Legcord"
license=('OSL-3.0')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electron_major_ver}"
    'libpulse'
    'libpipewire'
)
source=(
    "${pkgver}package.json::https://raw.githubusercontent.com/Legcord/Legcord/refs/tags/v${pkgver}/package.json"
    "LICENSE-${pkgver}.txt::https://raw.githubusercontent.com/Legcord/Legcord/v${pkgver}/license.txt"
    "run.sh.in"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-aarch64.rpm")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-armv7l.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-x86_64.rpm")
sha256sums=('05e80f40571d170343a2b85bd89668e2559ec92459015d51d7e1ce62718e28d4'
            'c2cba32542cf3a65813e83fdbd259020d6d62b6833aa18f38aec983837dc9e4d'
            '5873a0fde454152dbfed5cf1404e352f5e01326bcd2182189c8a463bf2cbce72')
sha256sums_aarch64=('de7d24bf3206f4eae8e502136b6f53eb7cb04593ad4902c2953273104aab0827')
sha256sums_armv7h=('5a4fb6c2155eefd0378cf90acc5ae3b352fc7c2962432ae3ad3a35c84413f327')
sha256sums_x86_64=('627d08a7a53f8eebcb1e46d28e38b85bcb8130af6cea63ef4485846294276132')

prepare() {
    if [ $_electron_major_ver != $(grep -oP '"electron":\s*"\K\d+' ${pkgver}package.json) ];then
      echo Wrong electron version.
      exit 1
    fi
    sed "s/@ELECTRON@/electron${_electron_major_ver}/" "${srcdir}/run.sh.in" > run.sh
    sed -i "s/\/opt\/${_pkgname}\///g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    case "${CARCH}" in
        aarch64)
            rm -rf "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked/node_modules/@vencord/venmic/prebuilds/venmic-addon-linux-x64"
            ;;
        armv7h)
            rm -rf "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked/node_modules/@vencord/venmic/prebuilds/venmic-addon-linux-x64"
            ;;
        x86_64)
            rm -rf "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked/node_modules/@vencord/venmic/prebuilds/venmic-addon-linux-arm64"
            ;;
    esac
}
package() {
    install -Dm755 "${srcdir}/run.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    _icon_sizes=(16x16 32x32 48x48 64x64 128x128 256x256 512x512)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
