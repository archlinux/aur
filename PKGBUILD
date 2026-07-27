# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=taratormusic-bin
_pkgname=TaratorMusic
pkgver=1.9.0
_electronversion=40
pkgrel=1
pkgdesc="A music player application with playlist support and Discord integration.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://github.com/Victiniiiii/TaratorMusic"
license=('GPL-3.0-or-later')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'ffmpeg'
    'python'
    'yt-dlp'
    'nodejs'
)
options=(
    '!emptydirs'
    '!strip'
)
source=(
    "${pkgname%-bin}-${pkgver}-x86_64.AppImage::${url}/releases/download/${pkgver}/${_pkgname}.AppImage"
    "${pkgname%-bin}.sh"
)
sha256sums=('8d860c28fd75a2c709c9333e4744de4ce18bc594891de8d9dcff394f7f9d5234'
            'a774c2f54fbbeeaac3cefc0f7250796d30c86d27f0fd40b7eaf9c0fdb021623d')
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
    if [ ! -x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" ];then
        chmod +x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage"
    fi
    if [ -d "${srcdir}/squashfs-root" ];then
        rm -rf "${srcdir}/squashfs-root"
    fi
    "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    _check_electron_version
    local _app_dir=$(_get_app_dir)
    sed -i -e "
        s/AppRun --no-sandbox/${pkgname%-bin}/g
        s/Audio/AudioVideo/g
    " "${_app_dir}/${pkgname%-bin}.desktop"
    find "${_app_dir}/resources/" -type d -exec chmod 755 {} +
    ln -sf "/usr/bin/ffmpeg" "${_app_dir}/resources/app/node_modules/@ffmpeg-installer/linux-x64/ffmpeg"
    ln -sf "/usr/bin/ffprobe" "${_app_dir}/resources/app/node_modules/ffprobe-static/bin/linux/x64/ffprobe"
    ln -sf "/usr/bin/yt-dlp" "${_app_dir}/resources/bin/yt-dlp_linux"
    rm -rf \
        "${_app_dir}/resources/app/node_modules/ffprobe-static/bin/"{darwin,linux/ia32} \
        "${_app_dir}/resources/app/node_modules/bare-fs/prebuilds/"{android-*,darwin-*,ios-*,win32-*,linux-arm64} \
        "${_app_dir}/resources/app/node_modules/bare-os/prebuilds/"{android-*,darwin-*,ios-*,win32-*,linux-arm64} \
        "${_app_dir}/resources/app/node_modules/bare-url/prebuilds/"{android-*,darwin-*,ios-*,win32-*,linux-arm64}
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
	local _app_dir=$(_get_app_dir)
	cp -a "${_app_dir}/resources/"* "${pkgdir}/usr/lib/${pkgname%-bin}/"
    install -Dm644 "${_app_dir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
		_extension="${_i##*.}"
		_icon_path="${_i#*share/icons/}"
		_target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
		install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
	done
}
