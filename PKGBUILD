# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=lvce-bin
pkgver=0.79.3
_electronversion=41
pkgrel=1
pkgdesc="VS Code inspired text editor that mostly runs in a webworker.(Prebuilt version.Use system-wide electron)"
arch=(
    'aarch64'
    'armv7h'
    'x86_64'
)
url="https://lvce-editor.github.io/lvce-editor"
_ghurl="https://github.com/lvce-editor/lvce-editor"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
options=(
    '!strip'
    '!emptydirs'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-v${pkgver}_arm64.deb")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-v${pkgver}_armhf.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-v${pkgver}_amd64.deb")
source=(
    "lintian-${pkgname%-bin}"
    "${pkgname%-bin}.sh"
)
sha256sums=('ada1a0303abece27be80372538645da5c5b4e9d60fcacc87b97da1c26b8931bc'
            '31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6')
sha256sums_aarch64=('e88b03b9ce050a1d2555229577c05f525b7c34f87dc983939efdf677efa9990b')
sha256sums_armv7h=('d69d97fe6f00982fa8177eabd36f415c09de324ab5a4e09f2e88a005a4c2e84a')
sha256sums_x86_64=('0382fcb96d254db7af1949b4eafc1695e5ae73b82dd23eaadccb1b8c2931ae95')
_get_electron_version() {
    _elec_ver="$(strings "${srcdir}/usr/lib/${pkgname%-bin}/${pkgname%-bin}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
    echo -e "The electron version is: \033[1;31m${_elec_ver}\033[0m"
}
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
    " "${srcdir}/lintian-${pkgname%-bin}"
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app/g
        s/@cfgdirname@/${pkgname%-bin}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    _get_electron_version
    sed -i "s/\/usr\/lib\/${pkgname%-bin}\///g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    PATTERNS=(
        "**/android-*"
        "**/darwin-*"
        "**/ios-*"
        "**/win32-*"
    )
    for pattern in "${PATTERNS[@]}"; do
        find "${srcdir}/usr/lib/${pkgname%-bin}/resources/app/packages" -type d -path "${pattern}" -exec rm -rf {} +
    done
    case "${CARCH}" in
        aarch64)
            find "${srcdir}/usr/lib/${pkgname%-bin}/resources/app/packages" -type d -name "linux-x64" -exec rm -rf {} +
            ;;
        armv7h)
            find "${srcdir}/usr/lib/${pkgname%-bin}/resources/app/packages" -type d -name "linux-arm64" -o -name "linux-x64" -exec rm -rf {} +
            ;;
        x86_64)
            find "${srcdir}/usr/lib/${pkgname%-bin}/resources/app/packages" -type d -name "linux-arm*" -exec rm -rf {} +
            ;;
    esac
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -a "${srcdir}/usr/lib/${pkgname%-bin}/resources/". "${pkgdir}/usr/lib/${pkgname%-bin}/"
    install -Dm644 "${srcdir}/usr/share/doc/${pkgname%-bin}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/bash-completion/completions/${pkgname%-bin}" -t "${pkgdir}/usr/share/bash-completion/completions"
    install -Dm644 "${srcdir}/lintian-${pkgname%-bin}" "${pkgdir}/usr/share/lintian/overrides/${pkgname%-bin}"
}
