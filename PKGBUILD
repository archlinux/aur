# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=boxplayer-bin
_pkgname=BoxPlayer
pkgver=5.0.34
_electronversion=40
pkgrel=1
pkgdesc="Unified cloud drive management, smart media library, media servers, and high-speed downloads.多网盘文件管理、媒体库、媒体服务器、AI Agent、音乐播放器和电子书阅读器，放在同一个跨平台桌面App里."
arch=(
    'aarch64'
    'x86_64'
)
url="https://www.xbyvideohub.com/"
_ghurl="https://github.com/gaozhangmin/boxplayer"
license=('GPL-3.0-only')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
    'nodejs'
)
makedepends=(
    'asar'
    'npm'
)
options=(
    '!emptydirs'
)
source=("${pkgname%-bin}.sh")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.AppImage::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-arm64.AppImage")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.AppImage::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-x86_64.AppImage")
sha256sums=('bd5358d8f323d3c2c2f0733364ee4ea55f551dd86ba0be2a76846210b60897fc')
sha256sums_aarch64=('7fb412621bed5bc4427b43e5070e23c7f8cd3f9a00d9f07be7fecc19bb410e46')
sha256sums_x86_64=('cff20d65ff4c98528e472f2f420ffa23d51aedd63ab0466f3786df4f081f270f')
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
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    if [ ! -x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" ];then
        chmod +x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage"
    fi
    if [ -d "${srcdir}/squashfs-root" ];then
        rm -rf "${srcdir}/squashfs-root"
    fi
    "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    _check_electron_version
    local _app_dir="$(_get_app_dir)"
    sed -i "s/AppRun --no-sandbox/${pkgname%-bin}/g" "${_app_dir}/${pkgname%-bin}.desktop"
    asar e "${_app_dir}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    cd "${srcdir}/app.asar.unpacked"
    sed -i '/"packageManager"/d' package.json
    npm config set allow-remote all
    npm install aria2-lib @motrix/nat-api --save
    cd - > /dev/null
    find "${srcdir}/app.asar.unpacked/dist" -type f \
        -exec sed -i -e "
            s/process.resourcesPath/\'\/usr\/lib\/${pkgname%-bin}\'/g
            s/process.execPath/\'\/usr\/lib\/${pkgname%-bin}\'/g\
            " {} +
    asar p "${srcdir}/app.asar.unpacked" "${_app_dir}/resources/app.asar"
    find "${_app_dir}/resources" -type d -perm 700 -exec chmod 755 {} +
    find "${_app_dir}/resources" -type f -name "*.so.*" -perm 777 -exec chmod 644 {} +
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
	local _app_dir="$(_get_app_dir)"
	cp -a "${_app_dir}/resources/." "${pkgdir}/usr/lib/${pkgname%-bin}/"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
		_extension="${_i##*.}"
		_icon_path="${_i#*share/icons/}"
		_target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
		install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
	done
    install -Dm644 "${_app_dir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
