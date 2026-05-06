# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=webgal-terre-bin
_appname=WebGAL_Terre
pkgver=4.5.20
_electronversion=29
pkgrel=1
pkgdesc="Galgame Editing. Redefined(Prebuilt version) / 视觉小说编辑，再进化"
arch=(
    'aarch64'
    'x86_64'
)
url="https://openwebgal.com/"
_ghurl="https://github.com/OpenWebGAL/WebGAL_Terre"
license=('MPL-2.0')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'nspr'
    'nss'
    'libxext'
    'java-runtime'
    'alsa-lib'
    'gtk3'
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
)
options=(
    '!strip'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.zip::${_ghurl}/releases/download/${pkgver}/${_appname}_Linux_Arm64_${pkgver}.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::${_ghurl}/releases/download/${pkgver}/${_appname}_Linux_${pkgver}.zip")
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/MakinoharaShoko/WebGAL_Terre/${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('1f256ecad192880510e84ad60474eab7589218784b9a50bc7ceee34c2b91f1d5'
            'd51d809af628cc8292bd430a4847adb4adefa9d4b0aee00a55a84ff9630e167c')
sha256sums_aarch64=('9f01f231952342d22e09ba414009a0e0683de2c500d5965bc986dfaf16b177e3')
sha256sums_x86_64=('73e2c90aec21ccd414de02c76e54db4cd020fffe295f6dbb491fe6a52834878e')
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
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_appname}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    _check_electron_version
    gendesk -q -f -n \
        --pkgname="${pkgname%-bin}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Game" \
        --name="${_appname//_/ }" \
        --exec="${pkgname%-bin} --no-sandbox %U"
    _file_list=(chrome_100_percent.pak chrome_200_percent.pak chrome-sandbox icudtl.dat libEGL.so libffmpeg.so \
		libGLESv2.so libvk_swiftshader.so libvulkan.so.1 resources.pak vk_swiftshader_icd.json)
	for _files in "${_file_list[@]}";do
		ln -sf "/usr/lib/electron${_electronversion}/${_files}" "${srcdir}/release/assets/templates/WebGAL_Electron_Template/${_files}"
	done
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -a "${srcdir}/release/". "${pkgdir}/usr/lib/${pkgname%-bin}/"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${pkgdir}/usr/lib/${pkgname%-bin}/assets/templates/WebGAL_Android_Template/app/src/main/ic_launcher-playstore.png" \
        "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
