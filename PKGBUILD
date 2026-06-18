# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=rendertune-bin
_pkgname=RenderTune
pkgver=2.0.12
_electronversion=33
pkgrel=1
pkgdesc="A free electron app that uses ffmpeg to combine audio.+image file(s) into video files.(Prebuilt version.Use system-wide electron)"
arch=(
    'aarch64'
    'armv7h'
    'x86_64'
)
url="https://rendertune.com/"
_ghurl="https://github.com/MartinBarker/RenderTune"
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
    'ffmpeg'
)
makedepends=(
    'gendesk'
    'asar'
)
source=(
    "LICENSE::https://raw.githubusercontent.com/MartinBarker/RenderTune/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.bz2::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-linux-arm64.tar.bz2")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.tar.bz2::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-linux-armv7l.tar.bz2")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.bz2::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-linux-x64.tar.bz2")
sha256sums=('a4348cc85713d60937c1fda0c0c9affa177c97f2bf7151db7850b20d58095b1c'
            'a774c2f54fbbeeaac3cefc0f7250796d30c86d27f0fd40b7eaf9c0fdb021623d')
sha256sums_aarch64=('5fe2d43c6a741f53ca7d972f84947508454b3475464244e47e368b8b69bd4c5c')
sha256sums_armv7h=('f4da08f581a2cb4e3f9f1bad4c324a63916fdcc521f8e6effda822323c8a9b29')
sha256sums_x86_64=('0d2e61461ed7190636b8e0ff2ca1ccc46605b164375981e39da9ee45b221236b')
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
        s/@cfgdirname@/${_pkgname}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    _check_electron_version
    gendesk -q -f -n \
        --pkgname="${pkgname%-bin}" \
        --pkgdesc="${pkgdesc}" \
        --categories="AudioVideo" \
        --name="${_pkgname}" \
        --exec="${pkgname%-bin} %U"
    local _app_dir=$(_get_app_dir)
    ln -sf "/usr/bin/ffmpeg" "${_app_dir}/resources/ffmpeg"
    ln -sf "/usr/bin/ffprobe" "${_app_dir}/resources/ffprobe"
    asar e "${_app_dir}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    rm -rf "${_app_dir}/resources/app.asar"
    find "${srcdir}/app.asar.unpacked" -type f -name "*.js" -exec sed -i "s/process.resourcesPath/\'\/usr\/lib\/${pkgname%-bin}\'/g" {} +
    ln -sf "/usr/bin/ffplay" "${srcdir}/app.asar.unpacked/ffmpeg/linux-"*/extracted/bin/ffplay
    ln -sf "/usr/bin/ffmpeg" "${srcdir}/app.asar.unpacked/ffmpeg/linux-"*/lib/ffmpeg
    ln -sf "/usr/bin/ffprobe" "${srcdir}/app.asar.unpacked/ffmpeg/linux-"*/lib/ffprobe
    rm -rf "${srcdir}/app.asar.unpacked/ffmpeg/linux-"*/ffmpeg-ffprobe.xz
    asar p "${srcdir}/app.asar.unpacked" "${_app_dir}/resources/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
	local _app_dir=$(_get_app_dir)
	cp -a "${_app_dir}/resources/". "${pkgdir}/usr/lib/${pkgname%-bin}/"
    install -Dm644 "${srcdir}/${_pkgname}-linux-"*/resources/build/svg/"${_pkgname}LogoWhite.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-bin}.svg"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
