# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=haimacloud-bin
_zhsname='海马云电脑'
_debname="com.${pkgname%-bin}.otohime"
pkgver=2.7.3
_electronversion=39
pkgrel=1
pkgdesc="Play 3A with all the special effects, just use the hippocampus cloud computer.特效全开玩3A，就用海马云电脑."
arch=(
    'aarch64'
    'x86_64'
)
url="https://pc.haimacloud.com/"
_ghurl="https://github.com/kota-rina3/hokeshi"
license=('LicenseRef-custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=(
    "${pkgname%-bin}"
)
depends=(
    "electron${_electronversion}"
)
options=(
    '!strip'
    '!emptydirs'
)
source=(
    "LICENSE.html::https://pc.haimacloud.com/agreement/user"
    "${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_ghurl}/releases/download/${pkgname%-bin}${pkgver}/${_debname}_${pkgver}.417_arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_ghurl}/releases/download/${pkgname%-bin}${pkgver}/${_debname}_${pkgver}.417_amd64.deb")
sha256sums=('bdb8db760dbceec14806559b3304ff8bb205f8bb7cb24a49280e5ed45a60642b'
            'fe033c7446c688abcb9a007d75f40eb9ca62756880cfde6be54fdf27a5bd94a8')
sha256sums_aarch64=('993f974261359f5ddf69d1856584943ebb1858dea92cc46bafa5377e516707bc')
sha256sums_x86_64=('3d41c409733e4cdb782b92725ca4006a8d18d1b2e32ce980c89d68e2f69fb9ba')
_get_app_dir() {
    find "${srcdir}" -type f -name "resources.pak" -print 2>/dev/null | while read f; do [ -d "${f%/*}/resources" ] && echo "${f%/*}" && break; done
}
_check_electron_version() {
    echo "Verifying Electron version..."
    local _main_exe=$(find "$(_get_app_dir)" -maxdepth 1 -type f -executable -printf '%s %p\n' | sort -nr | head -1 | cut -d' ' -f2-)
    [[ -z "${_main_exe}" ]] && echo -e "\033[1;33mNote: Could not find Electron binary.\033[0m" && return
    local _elec_ver=$(strings "${_main_exe}" | grep -oP 'Electron/\K[0-9]+' | head -1)
    [[ -z "${_elec_ver}" ]] && echo -e "\033[1;33mNote: Could not determine Electron version.\033[0m" && return
    [[ "${_elec_ver}" != "${_electronversion}" ]] &&
        echo -e "\033[1;31mWarning: Electron version mismatch! Detected: ${_elec_ver}, Expected: ${_electronversion}\033[0m" ||
        echo -e "Electron version verified: \033[1;31m${_elec_ver}\033[0m"
}
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    _check_electron_version
    sed -i -e "
        s/Exec=\/opt\/apps\/${_debname}\/files\//Exec=/g
        s/Icon=\/opt\/apps\/${_debname}\/files\/resources\/${pkgname%-bin}.png/Icon=${pkgname%-bin}/g
    " "${srcdir}/opt/apps/${_debname}/entries/applications/${pkgname%-bin}.desktop"
    local _app_dir="$(_get_app_dir)"
    rm -rf "${_app_dir}/resources/elevate.exe"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    local _app_dir="$(_get_app_dir)"
    cp -a "${_app_dir}/resources/." "${pkgdir}/usr/lib/${pkgname%-bin}/"
    install -Dm644 "${srcdir}/opt/apps/${_debname}/entries/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*entries/icons/*" | while read -r _i; do
        _icon_path="${_i#*entries/icons/}"
        install -Dm644 "${_i}" "${pkgdir}/usr/share/icons/${_icon_path}"
    done
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
