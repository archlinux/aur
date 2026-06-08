# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=splayer-bin
_pkgname=SPlayer
pkgver=3.1.1
_electronversion=41
pkgrel=1
pkgdesc="🎵 A music player with Jellyfin / Navidrome / Emby media server support.(Prebuilt version.Use system-wide electron)简约的跨平台音乐播放器，支持逐字歌词、桌面歌词、任务栏歌词、云盘音乐、本地音乐管理及流媒体播放 "
arch=(
    'aarch64'
    'x86_64'
)
url="http://splayer.imsyy.top"
_ghurl="https://github.com/imsyy/SPlayer"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'libvips'
)
makedepends=(
    'asar'
)
source=("${pkgname%-bin}.sh")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-aarch64.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-x86_64.rpm")
sha256sums=('a774c2f54fbbeeaac3cefc0f7250796d30c86d27f0fd40b7eaf9c0fdb021623d')
sha256sums_aarch64=('49de8289eb92456e1686016bd9e92929a4a5f47f625b315eae61593af2936a01')
sha256sums_x86_64=('0050c7606365f4ef73fad18b5e80aec7b39383fcea736c1c283479059f35d942')
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
        s/@cfgdirname@/${pkgname%-bin}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    _check_electron_version
    sed -i -e "
        s/\/opt\/${_pkgname}\/${_pkgname}/${pkgname%-bin}/g
        s/Music;/AudioVideo;/g
        s/Icon=${_pkgname}/Icon=${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${_pkgname}.desktop"
    asar e "${srcdir}/opt/${_pkgname}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    rm -rf "${srcdir}/opt/${_pkgname}/resources/app.asar"
    sed -i "s/process.resourcesPath/\'\/usr\/lib\/${pkgname%-bin}\'/g" "${srcdir}/app.asar.unpacked/out/main/index.js"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/opt/${_pkgname}/resources/app.asar"
    rm -rf "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked/node_modules/font-list/libs/"{darwin,win32}
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
	local _app_dir=$(find "${srcdir}" -type f -name "resources.pak" -exec dirname {} + | head -n 1)
	cp -a "${_app_dir}/resources/". "${pkgdir}/usr/lib/${pkgname%-bin}/"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
        _extension="${_i##*.}"
        _icon_path="${_i#*share/icons/}"
        _target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
        install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
    done
}
