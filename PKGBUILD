# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=trezor-suite-bin
_pkgname=Trezor-Suite
pkgver=26.2.3
_electronversion=39
pkgrel=1
pkgdesc="Desktop app for Trezor hardware wallets.(Prebuilt version.Use system-wide electron)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://trezor.io/trezor-suite"
_ghurl="https://github.com/trezor/trezor-suite"
license=('LicenseRef-T-RSL')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'trezor-udev'
)
makedepends=(
    'asar'
)
source=(
    "LICENSE-${pkgver}.md::https://raw.githubusercontent.com/trezor/trezor-suite/v${pkgver}/LICENSE.md"
    "${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.AppImage::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-arm64.AppImage")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.AppImage::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-x86_64.AppImage")
sha256sums=('0bb9e6855d6aa4f013a87ed9ceb2ef47b6eddc44858cc85ed3faf5d53677f67a'
            '31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6')
sha256sums_aarch64=('3c23fb68b5d37240039c677166c6338f04059c9e0b0c02b1e7f207e695d3f260')
sha256sums_x86_64=('602c199d2d92123d36597d18ff78d55f60aaa93024943fbd44220147a5640383')
_get_electron_version() {
    _elec_ver="$(strings "${srcdir}/squashfs-root/${pkgname%-bin}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
    echo -e "The electron version is: \033[1;31m${_elec_ver}\033[0m"
}
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/@trezor/g
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
    sed -i "s/AppRun --no-sandbox/${pkgname%-bin}/g" "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    asar e "${srcdir}/squashfs-root/resources/app.asar" "${srcdir}/app.asar.unpacked"
    rm -rf "${srcdir}/squashfs-root/resources/app.asar"
    find "${srcdir}/app.asar.unpacked/dist" -type f -exec sed -i "s/process.resourcesPath/\'\/usr\/lib\/${pkgname%-bin}\'/g" {} +
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/squashfs-root/resources/app.asar"
    find "${srcdir}/squashfs-root/resources" -type d -exec chmod 755 {} +
    find "${srcdir}/squashfs-root/resources/app.asar.unpacked" -type d \( -name "darwin-*" -o -name "win32-*" -o -name "android-*" \
        -o -name "linux-arm" -o -name "linux-ia32" \) -type d -exec rm -rf {} +
    case "${CARCH}" in
        aarch64)
            rm -rf "${srcdir}/squashfs-root/resources/app.asar.unpacked/node_modules/usb/prebuilds/linux-x64"
            ;;
        x86_64)
            rm -rf "${srcdir}/squashfs-root/resources/app.asar.unpacked/node_modules/usb/prebuilds/linux-arm64"
            ;;
    esac
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
	find "${srcdir}/squashfs-root/resources" -maxdepth 1 -type f -exec install -Dm644 -t "${pkgdir}/usr/lib/${pkgname%-bin}" {} +
    if find "${srcdir}/squashfs-root/resources" -mindepth 1 -maxdepth 1 -type d | read; then
        for _subdir in "${srcdir}/squashfs-root/resources/"*; do
            if [ -d "${_subdir}" ]; then
                cp -Pr --no-preserve=ownership "${_subdir}" "${pkgdir}/usr/lib/${pkgname%-bin}"
            fi
        done
    fi
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/512x512/apps/${pkgname%-bin}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
