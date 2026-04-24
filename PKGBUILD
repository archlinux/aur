# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=handbook-bin
_appname="${pkgname%-bin}"
_pkgname=Handbook
pkgver=1.4.0
_electronversion=41
pkgrel=1
pkgdesc="Create small, movable, and easily concealable windows for quick use. (Prebuilt version. Use system-wide electron)"
arch=('x86_64')
url="https://github.com/ECRomaneli/Handbook"
license=('MIT')
conflicts=("${_appname}")
provides=("${_appname}=${pkgver}")
depends=("electron${_electronversion}")
options=('!emptydirs')
source=(
    "${_appname}-${pkgver}.rpm::${url}/releases/download/${pkgver}/${_appname}-${pkgver}.${CARCH}.rpm"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/ECRomaneli/Handbook/${pkgver}/LICENSE"
    "${_appname}.sh"
)
sha256sums=('dee2dbffffb618090473b388617f65c8234ac0f6a02219d4eaa41139e8779342'
            'f0cf8bd391f773dca303159de1b19dbb8626d86f4aae45a548320031f113283b'
            '3a7ecae1d2c898c1dc66ac8143285a83d068ec2b98e0b06025fc5a49daf2b4d5')

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
    sed -i -e "s/@electronversion@/${_electronversion}/g" \
           -e "s/@appname@/${_appname}/g" \
           -e "s/@runname@/app.asar/g" \
           -e "s/@cfgdirname@/${_pkgname}/g" \
           "${srcdir}/${_appname}.sh"

    _check_electron_version

    sed -i "s/\/opt\/${_pkgname}\///g" "${srcdir}/usr/share/applications/${_appname}.desktop"
}

package() {
    install -Dm755 "${srcdir}/${_appname}.sh" "${pkgdir}/usr/bin/${_appname}"
    install -Dm755 -d "${pkgdir}/usr/lib/${_appname}"
    cp -a "${srcdir}/opt/${_pkgname}/resources/". "${pkgdir}/usr/lib/${_appname}/"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/512x512/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
