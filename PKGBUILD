# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=atrust-bin
_pkgname=aTrust
_debname="cn.com.sangfor.${pkgname%-bin}"
pkgver=2.5.16.30
_electronversion=9
pkgrel=4
pkgdesc="Sangfor ssl sdp client.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://www.sangfor.com/"
license=('LicenseRef-unknown')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    'libxss'
    'qt5-base'
    'java-runtime'
    'gtk3'
    'libxrandr'
    'cairo'
    'libxcomposite'
    'at-spi2-core'
    'alsa-lib'
    'libxtst'
    'nodejs'
)
options=(
    '!strip'
    '!emptydirs'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::https://atrustcdn.sangfor.com/standard/linux/${pkgver}/uos/amd64/${_pkgname}Installer_amd64.deb"
    "bsod_checker.js"
    "${pkgname%-bin}.sh"
)
sha256sums=('aa8ba93532ae250dcab3d75d3b103fb01a93b97b49cbc6d9066c5ed1f70b75a6'
            'ae82a7e0575d2ed8778134fc7d5c9c85001c955a7d26710a13101ff2363c53e6'
            'dcd83c90f18567cab33c5734d2b55e0a5331e58634ea224054f7a186fd8b17bd')
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
        s/@appname@/sangfor/g
        s/@runpath@/${_pkgname}/g
        s/@runname@/${_pkgname}Tray/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    _check_electron_version
    sed -i -e "
        s/\/usr\/share\/sangfor\/${_pkgname}\/${_pkgname}Tray/${pkgname%-bin}/g
        s/Icon=${_pkgname}/Icon=${pkgname%-bin}/g
        s/GenericName=sdp client/GenericName=${_pkgname}/g
        /packagename/d
    " "${srcdir}/usr/share/applications/${_debname}.desktop"
    rm -rf \
        "${srcdir}/usr/share/sangfor/${_pkgname}/resources/lib/libstdc++.so.6" \
        "${srcdir}/usr/share/sangfor/${_pkgname}/resources/lib/libqxcb.so" \
        "${srcdir}/usr/share/sangfor/${_pkgname}/resources/lib/libxcb.so.1" \
        "${srcdir}/usr/share/sangfor/${_pkgname}/resources/lib/ libxcb-xinerama.so.0" \
        "${srcdir}/usr/share/sangfor/${_pkgname}/uem/lib/libstdc++.so.6"
    install -Dm644 "${srcdir}/bsod_checker.js" "${srcdir}/usr/share/sangfor/${_pkgname}/resources/app/src/service/bsod_checker.js"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/share"
    cp -Pr --no-preserve=ownership "${srcdir}/usr/share/sangfor" "${pkgdir}/usr/share"
    install -Dm644 "${srcdir}/usr/lib/systemd/system/"* -t "${pkgdir}/usr/lib/systemd/system"
    install -Dm644 "${srcdir}/usr/lib/systemd/user/"* -t "${pkgdir}/usr/lib/systemd/user"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/usr/share/applications/${_debname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/sangfor/${_pkgname}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm755 -d "${pkgdir}/usr/share/sangfor/.${_pkgname}"
    chown -R "${USER}:${USER}" "${pkgdir}/usr/share/sangfor/.${_pkgname}"
}
