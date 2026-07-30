# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=douyin-bin
_debname="com.${pkgname%-bin}.otohime"
pkgver=8.1.201
_electronversion=42
pkgrel=1
pkgdesc="Third-party Linux client for Douyin.(Prebuilt version.Use system-wide electron)第三方抖音 Linux 客户端"
arch=(
    'aarch64'
    'x86_64'
)
url="https://www.douyin.com"
_dlurl="https://github.com/kota-rina3/hokeshi"
license=('LicenseRef-douyin')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'nodejs'
)
source=(
    "LICENSE-${pkgver}.html::${url}/draft/douyin_agreement/douyin_agreement_user.html?id=6773906068725565448"
    "${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_dlurl}/releases/download/${pkgname%-bin}${pkgver}/${_debname}_${pkgver}_arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_dlurl}/releases/download/${pkgname%-bin}${pkgver}/${_debname}_${pkgver}_amd64.deb")
sha256sums=('12e8d0a130a2dae1d6f52c9bc18c4ea572ae1366c21b083936310b780b9cf2c7'
            'a774c2f54fbbeeaac3cefc0f7250796d30c86d27f0fd40b7eaf9c0fdb021623d')
sha256sums_aarch64=('bf686de21bca3cba3a9ea2a12caf644dc05527e8062c67baff3d3e954494c057')
sha256sums_x86_64=('9acf2c48052695f71c5341beb410db613b002bf56dccff2168daf3228227c953')
_get_app_dir() {
    find "${srcdir}" -type f -name "resources.pak" -exec dirname {} + | head -n 1
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
        s/Categories=Video;/Categories=AudioVideo;/g
        s/Exec=\/opt\/apps\/${_debname}\/files\/${pkgname%-bin}/Exec=${pkgname%-bin}/g
        s/Icon=\/opt\/apps\/${_debname}\/files\/resources\/app\/${pkgname%-bin}.png/Icon=${pkgname%-bin}/g
    " "${srcdir}/opt/apps/${_debname}/entries/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    local _app_dir=$(_get_app_dir)
    cp -a "${_app_dir}/resources/"* "${pkgdir}/usr/lib/${pkgname%-bin}/"
    install -Dm644 "${srcdir}/opt/apps/${_debname}/entries/applications/${pkgname%-bin}.desktop" \
        -t "${pkgdir}/usr/share/applications"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
        _extension="${_i##*.}"
        _icon_path="${_i#*share/icons/}"
        _target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
        install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
    done
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.html"
}