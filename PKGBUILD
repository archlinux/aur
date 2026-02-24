# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=zasper-bin
_pkgname=Zasper
pkgver=0.3.0_beta
_electronversion=40
pkgrel=1
pkgdesc="An IDE designed from the ground up to support massive concurrency. It provides a minimal memory footprint, exceptional speed, and the ability to handle numerous concurrent connections.(Prebuilt version.Use system-wide electron)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://zasper.io/"
_ghurl="https://github.com/zasper-io/zasper"
license=('AGPL-3.0-or-later')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
source=("${pkgname%-bin}.sh")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${_ghurl}/releases/download/v${pkgver//_/-}/${pkgname%-bin}_${pkgver//_/-}_aarch64_linux.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${_ghurl}/releases/download/v${pkgver//_/-}/${pkgname%-bin}_${pkgver//_/-}_x86_64_linux.rpm")
sha256sums=('31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6')
sha256sums_aarch64=('77e52d55cafd8d1adb132cc049749456fe93ef79b5c06c6b9f4267c1d1e7c5dd')
sha256sums_x86_64=('35348f694b3f181ed695568abfd30030cc179b3c7ea99147ede485df3b75e294')
_get_electron_version() {
    _elec_ver="$(strings "${srcdir}/opt/${pkgname%-bin}/${pkgname%-bin}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
    echo -e "The electron version is: \033[1;31m${_elec_ver}\033[0m"
}
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-bin}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    _get_electron_version
    sed -i "s/\/opt\/${pkgname%-bin}\///g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    find "${srcdir}/opt/${pkgname%-bin}/resources" -type d \( -name "darwin-*" -o -name "win32-*" \) -exec rm -rf {} +
    rm -rf "${srcdir}/opt/${pkgname%-bin}/resources/backend/linux-386"
    case "${CARCH}" in
        aarch64)
            rm -rf "${srcdir}/opt/${pkgname%-bin}/resources/backend/linux-amd64"
            ;;
        x86_64)
            rm -rf "${srcdir}/opt/${pkgname%-bin}/resources/backend/linux-arm64"
            ;;
    esac
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    if find "${srcdir}/opt/${pkgname%-bin}/resources" -mindepth 1 -maxdepth 1 -type d | read; then
        for subdir in "${srcdir}/opt/${pkgname%-bin}/resources/"*; do
            if [ -d "${subdir}" ]; then
                cp -Pr --no-preserve=ownership "${subdir}" "${pkgdir}/usr/lib/${pkgname%-bin}"
            fi
        done
    fi
    _icon_sizes=(16x16 24x24 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}