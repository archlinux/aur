# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Maintainer: oech3
# Contributor: xiota
pkgname=legcord-bin
_pkgname=Legcord
pkgver=1.2.2
_electronversion=40
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
sha256sums_aarch64=('57e4ef120051c1fe3b6b2ebd59484913da36199346e006da04850f40b34ad462')
sha256sums_armv7h=('b7e13037f9095e1cefbb016375b392d1fcaf6d21e00bf2ee282e109ec5f92fdb')
sha256sums_x86_64=('bcf5b63df319e00f1913122a910ea8ef6b948ede7f3d1ef1773eb1c344f68617')
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
                "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked/node_modules/koffi/build/koffi/"{linux_armhf,linux_x64,musl_x64} \
                "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked/node_modules/@vencord/venmic/prebuilds/venmic-addon-linux-x64"
            ;;
        armv7h)
            rm -rf \
                "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked/node_modules/koffi/build/koffi/"{linux_arm64,linux_x64} \
                "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked/node_modules/@vencord/venmic/prebuilds/"{venmic-addon-linux-arm64,venmic-addon-linux-x64}
            ;;
        x86_64)
            rm -rf \
                "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked/node_modules/koffi/build/koffi/"{linux_arm64,linux_armhf,musl_arm64} \
                "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked/node_modules/@vencord/venmic/prebuilds/venmic-addon-linux-arm64"
            ;;
    esac
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
    _icon_sizes=(16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
