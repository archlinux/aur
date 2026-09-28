# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=smartsub-bin
_pkgname=SmartSub
_zhsname='妙幕'
pkgver=3.9.0
_electronversion=30
pkgrel=1
pkgdesc="A cross-platform client side tool that can generate subtitle files for video or audio in batches, and supports subtitle translation. It supports Baidu, Volcano, OpenAI, Olama, DeepSeek and other translators."
arch=('x86_64')
url="https://smartsub.lxd.one/"
_ghurl="https://github.com/buxuku/SmartSub"
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
    'python-openai-whisper'
    'ffmpeg'
    'nodejs'
    'python-numpy'
)
makedepends=(
    'dpkg'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${_pkgname}_Linux_${pkgver}_amd64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/buxuku/SmartSub/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('208f14dec45ea03be649780507707bff3b4dd4fbe0a219928a4a07d10bca5693'
            '324178aaf0ebe3ab663803d3a63439cd8cdf02c3a4a40609c9ac6f8af517faed'
            'bd5358d8f323d3c2c2f0733364ee4ea55f551dd86ba0be2a76846210b60897fc')
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
        s/@cfgdirname@/${pkgname%-bin}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    _check_electron_version
    local _app_dir=$(_get_app_dir)
    sed -i "s/\/opt\/${_pkgname}\///g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    ln -sf "/usr/bin/ffmpeg" "${_app_dir}/resources/app.asar.unpacked/node_modules/@ffmpeg-installer/linux-x64/ffmpeg"
    ln -sf "/usr/bin/ffmpeg" "${_app_dir}/resources/app.asar.unpacked/node_modules/ffmpeg-static/ffmpeg"
    asar e "${_app_dir}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    find "${srcdir}/app.asar.unpacked/app" -type f -exec sed -i "s/process.resourcesPath/\'\/usr\/lib\/${pkgname%-bin}\'/g" {} +
    asar p "${srcdir}/app.asar.unpacked" "${_app_dir}/resources/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
	local _app_dir=$(_get_app_dir)
	cp -a "${_app_dir}/resources/." "${pkgdir}/usr/lib/${pkgname%-bin}/"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
        _extension="${_i##*.}"
        _icon_path="${_i#*share/icons/}"
        _target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
        install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
