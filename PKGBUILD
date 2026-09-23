# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=yuanbao-bin
_debname="com.tencent.${pkgname%-bin}.otohime"
pkgver=2.83.10
_electronversion=42
pkgrel=1
pkgdesc="Unofficial Linux version of yuanbao client.Tencent's all-round AI assistant.元宝客户端非官方Linux版,腾讯旗下全能AI助手。"
arch=(
    'aarch64'
    'x86_64'
)
url="https://yuanbao.tencent.com"
_ghurl="https://github.com/kota-rina3/hokeshi"
license=('LicenseRef-custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
source=(
    "LICENSE.html::https://rule.tencent.com/rule/202403110001"
    "${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_ghurl}/releases/download/${pkgname%-bin}${pkgver}/${_debname}_${pkgver}_arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_ghurl}/releases/download/${pkgname%-bin}${pkgver}/${_debname}_${pkgver}_amd64.deb")
sha256sums=('906d172585f954560e014adbca98524b28e475c4ab69e5b8ead65e8560e8fbd8'
            '5ec6b59a287204cbcbac040071f19d88897a0cb3156e794e6f05847cf5449a9e')
sha256sums_aarch64=('c6a5adeb2a4bbffa3e8ba0f4c5f6f311240fbd7610b42576f36ababf9df247d0')
sha256sums_x86_64=('d3aa0f26cf54027a77116487c6dd8bea34656c449d9ab1b802cb20eec52ae477')
_get_app_dir() {
    find "${srcdir}" -type d -name "node_modules" -prune -o -type f -name "resources.pak" -print0 | xargs -0 dirname | head -n 1
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
        s/@cfgdirname@/${pkgname%-bin}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    _check_electron_version
    sed -i -e "
        s/\/opt\/apps\/${_debname}\/files\/${pkgname%-bin}/${pkgname%-bin} %U/g
        s/\/opt\/apps\/${_debname}\/files\/resources\/app\/${pkgname%-bin}.png/${pkgname%-bin}/g
    " "${srcdir}/opt/apps/${_debname}/entries/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    local _app_dir=$(_get_app_dir)
    cp -a "${_app_dir}/resources/." "${pkgdir}/usr/lib/${pkgname%-bin}/"
    install -Dm644 "${srcdir}/opt/apps/${_debname}/entries/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*entries/icons/*" | while read -r _i; do
        _icon_path="${_i#*entries/icons/}"
        install -Dm644 "${_i}" "${pkgdir}/usr/share/icons/${_icon_path}"
    done
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}