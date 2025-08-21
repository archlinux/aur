# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: criptixo <therealcriptixo@gmail.com>
pkgname=waveterm-bin
_pkgname=Wave
pkgver=0.11.4
_electronversion=37
pkgrel=1
pkgdesc='An open-source, cross-platform terminal for seamless workflows.(Prebuilt version.Use system-wide electron)'
arch=(
    'aarch64'
    'x86_64'
)
url="https://www.waveterm.dev"
_ghurl="https://github.com/wavetermdev/waveterm"
license=('Apache-2.0')
depends=(
    "electron${_electronversion}"
)
options=(
    '!strip'
)
source=(
    "${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.pacman::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-linux-aarch64-${pkgver}.pacman")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.pacman::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-linux-x64-${pkgver}.pacman")
sha256sums=('31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6')
sha256sums_aarch64=('6c8312762ba20bf98df5807514dac65f1c5cba0f066a7fce87be097aa9688ef0')
sha256sums_x86_64=('2920f9dc740a40d394ccf202438ad9cf842d22925100d275e21f591264f4603e')
_get_electron_version() {
    _electronversion="$(strings "${srcdir}/opt/${_pkgname}/${pkgname%-bin}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
    echo -e "The electron version is: \033[1;31m${_electronversion}\033[0m"
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
        s/\/opt\/${_pkgname}\/${pkgname%-bin}/${pkgname%-bin}/g
        s/Icon=${_pkgname}/Icon=${pkgname%-bin}/g
        s/TerminalEmulator/TerminalEmulator;Utility/g
    " "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    case "${CARCH}" in
        aarch64)
            rm -rf "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked/dist/bin/"{*-darwin.*,*-linux.mips*,*-linux-x64,*-windows.*}
            ;;
        x86_64)
            rm -rf "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked/dist/bin/"{*-darwin.*,*-linux.arm64,*-linux.mips*,*-windows.*}
            ;;
    esac
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    _icon_sizes=(16x16 32x32 128x128 256x256 512x512)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
