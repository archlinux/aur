# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: criptixo <therealcriptixo@gmail.com>
pkgname=waveterm-bin
_pkgname=Wave
pkgver=0.14.4
_electronversion=41
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
sha256sums_aarch64=('434f91800e7c8971d35714e7700f90ec010b9d892282315dc967e2cc274a285a')
sha256sums_x86_64=('e96151a2af404d7f9d2b668de57fb74da00bcc7f1d95c99a3ad13696935c08a9')
_get_electron_version() {
    _elec_ver="$(strings "${srcdir}/opt/${_pkgname}/${pkgname%-bin}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
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
        s/\/opt\/${_pkgname}\/${pkgname%-bin}/${pkgname%-bin}/g
        s/Icon=${_pkgname}/Icon=${pkgname%-bin}/g
        s/TerminalEmulator/TerminalEmulator;Utility/g
    " "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    rm -rf "${srcdir}/opt/${_pkgname}/resources/"{apparmor-profile,package-type}
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
	find "${srcdir}/opt/${_pkgname}/resources" -maxdepth 1 -type f -exec install -Dm644 -t "${pkgdir}/usr/lib/${pkgname%-bin}" {} +
    if find "${srcdir}/opt/${_pkgname}/resources" -mindepth 1 -maxdepth 1 -type d | read; then
        for _subdir in "${srcdir}/opt/${_pkgname}/resources/"*; do
            if [ -d "${_subdir}" ]; then
                cp -Pr --no-preserve=ownership "${_subdir}" "${pkgdir}/usr/lib/${pkgname%-bin}"
            fi
        done
    fi
    _icon_sizes=(16x16 32x32 128x128 256x256 512x512)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
