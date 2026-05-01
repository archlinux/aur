# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=handbook-bin
_pkgname=Handbook
pkgver=1.4.1
_electronversion=41
pkgrel=1
pkgdesc="Create small, movable, and easily concealable windows for quick use. (Prebuilt version. Use system-wide electron)"
arch=('x86_64')
url="https://github.com/ECRomaneli/Handbook"
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=("electron${_electronversion}")
options=('!emptydirs')
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${url}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}.${CARCH}.rpm"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/ECRomaneli/Handbook/${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('7fb2f2f8409e7cdc13b9e4a523f76b67413648b9d63bd9323e8e76bf72cbb932'
            'f0cf8bd391f773dca303159de1b19dbb8626d86f4aae45a548320031f113283b'
            'a774c2f54fbbeeaac3cefc0f7250796d30c86d27f0fd40b7eaf9c0fdb021623d')
_check_electron_version() {
    echo "Verifying Electron version..."
    local _app_dir=$(find "${srcdir}" -type f -name "resources.pak" -exec dirname {} + | head -n 1)
    local _main_exe=""
    if [[ -n "${_app_dir}" ]]; then
        _main_exe=$(find "${_app_dir}" -maxdepth 1 -type f -executable -printf '%s %p\n' | sort -nr | head -n 1 | cut -d' ' -f2-)
    fi

    if [[ -n "${_main_exe}" ]]; then
        local _elec_ver=$(strings "${_main_exe}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1 | head -n 1)
        if [[ -n "${_elec_ver}" ]]; then
            if [[ "${_elec_ver}" != "${_electronversion}" ]]; then
                echo -e "\033[1;31mWarning: Electron version mismatch! Detected: ${_elec_ver}, Expected: ${_electronversion}\033[0m"
            else
                echo -e "Electron version verified: \033[1;31m${_elec_ver}\033[0m"
            fi
        fi
    else
        echo -e "\033[1;33mNote: Could not find Electron binary for version verification.\033[0m"
    fi
}
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    _check_electron_version
    sed -i "s/\/opt\/${_pkgname}\///g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    local _app_dir=$(find "${srcdir}" -type f -name "resources.pak" -exec dirname {} + | head -n 1)
	cp -a "${_app_dir}/resources/". "${pkgdir}/usr/lib/${pkgname%-bin}/"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/512x512/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
