# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: yjun <jerrysteve1101 at gmail dot com>
# Contributor: FlyInWind <2518509078@qq.com>
pkgname=ynote-desktop-bin
_zhsname='有道云笔记'
pkgver=8.2.63
_electronversion=22
pkgrel=1
pkgdesc="Netease Youdao Ynote for Linux.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://note.youdao.com/"
license=('LicenseRef-custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'perl'
)
makedepends=(
    'asar'
)
options=(
    '!strip'
    '!emptydirs'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::https://artifact.lx.netease.com/download/ynote-electron/%E6%9C%89%E9%81%93%E4%BA%91%E7%AC%94%E8%AE%B0-web.deb"
    "LICENSE.html::https://note.youdao.com/license.html"
    "${pkgname%-bin}.sh"
)
sha256sums=('587f20acda65eaf5c805ae6edbaf06a07c49b7c6d2ac9d6333f2197fe642828c'
            'a8aec47c7cc6e6d838d525c89b58a962d650c84b0ebec09ecfb8955381fe6460'
            'a774c2f54fbbeeaac3cefc0f7250796d30c86d27f0fd40b7eaf9c0fdb021623d')
pkgver() {
    cd "${srcdir}/app.asar.unpacked"
    grep '"version":' package.json | awk -F'"version": "' '{print $2}' | awk -F',' '{print $1}' | tr -d '"'
}
_get_app_dir() {
    find "${srcdir}" -type f -name "resources.pak" -exec dirname {} + | head -n 1
}
_check_electron_version() {
    echo "Verifying Electron version..."
    local _app_dir=$(_get_app_dir)
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
    bsdtar -xf "${srcdir}/data."*
    _check_electron_version
    local _app_dir=$(_get_app_dir)
    sed -i -e "
        s/\"\/opt\/${_zhsname}\/${pkgname%-bin}\" --no-sandbox/${pkgname%-bin}/g
        s/\/opt\/${_zhsname}\/resources\/build\/icon.svg/${pkgname%-bin}/g
        s/Utility/Office/g
    " "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    asar e "${_app_dir}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    rm -rf "${_app_dir}/resources/app.asar"
    sed -i -e "
        s/process.resourcesPath/\'\/usr\/lib\/${pkgname%-bin}\'/g
        s/\.\.\/dll\/scholar/dll\/scholar/g
    " "${srcdir}/app.asar.unpacked/dist/"{main.js,scholar.js}
    asar p "${srcdir}/app.asar.unpacked" "${_app_dir}/resources/app.asar"
    rm -rf \
        "${_app_dir}/resources/app.asar.unpacked/node_modules/ffi-napi/prebuilds/"{darwin-x64,linux-arm64,win32-ia32,win32-x64} \
        "${_app_dir}/resources/app.asar.unpacked/node_modules/ref-napi/prebuilds/"{darwin-x64,linux-arm64,win32-ia32,win32-x64} \
        "${_app_dir}/resources/app.asar.unpacked/node_modules/node-screenshots-linux-x64-musl" \
        "${_app_dir}/resources/app.asar.unpacked/node_modules/koffi/build/koffi/"{*win*,*bsd*,*arm*,linux_ia32,linux_loong64,linux_riscv64d}
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
	local _app_dir=$(_get_app_dir)
	cp -a "${_app_dir}/resources/". "${pkgdir}/usr/lib/${pkgname%-bin}/"
    install -Dm644  "${_app_dir}/dll/scholar/client.so" -t "${pkgdir}/usr/lib/${pkgname%-bin}/dll/scholar"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
        _extension="${_i##*.}"
        _icon_path="${_i#*share/icons/}"
        _target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
        install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
    done
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
