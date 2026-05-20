# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
#获取版本号及下载地址：
#https://comate-ide.bj.bcebos.com/updates/stable/linux/arm64/latest.json
#https://comate-ide.bj.bcebos.com/updates/stable/linux/x64/latest.json
pkgname=comate-bin
_pkgname=Comate
pkgver=2.0.0
_version=69f76118f431176dda6c10db268f694dea1f3b78-253535543
_electronversion=39
pkgrel=1
pkgdesc="Code as you like, one step ahead, and understand your intelligent code assistant better.(Prebuilt version)"
arch=(
    'x86_64'
)
url="https://comate.baidu.com"
license=('LicenseRef-custom')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
    'python'
    'python-fonttools'
    'perl'
    'libxkbfile'
    'libsecret'
    'webkit2gtk-4.1'
    'python-yaml'
    'python-pillow'
    'python-requests'
)
optdepends=(
    'bash'
    'zsh'
)
options=(
    '!emptydirs'
    '!strip'
)
source=(
    "LICENSE-${pkgver}::https://cloud.baidu.com/doc/COMATE/s/glxiygwdx"
    "${pkgname%-bin}.js"
    "${pkgname%-bin}.desktop"
    "${pkgname%-bin}-url-handler.desktop"
    "${pkgname%-bin}.sh"
)
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::https://comate-ide.cdn.bcebos.com/download/stable/${_version}/${_pkgname}-linux-x64.tar.gz")
sha256sums=('ab16553a480ab238ca376fec78f44ad8399cb7a08aa4b43a14fe28773e0da3ae'
            'df2535dcf1679b8681a27f35a445c08300d34b0336af0dea07f0fbcd5ef5e946'
            '0c8fee636da036e57fcde0385bdc698126c4b179de663ad315e8299d483abc9d'
            '787bf0078b80c66fa5b8191991700afd6e32e9f285cdb32f69791b8894c86fd5'
            '700067aa4b354a91ab3374b5495af9eb3093855a3d8016a8303e88abf3470599')
sha256sums_x86_64=('c29b8da495e6a5471f9ca0a20ea412ef1304b5133484c2f5adc8eecfdb9bfe0e')
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
    _check_electron_version
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app/g
        s/@cfgdirname@/${_pkgname}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    sed -i "s/@ELECTRON@/electron${_electronversion}/g" "${srcdir}/${pkgname%-bin}.js"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 "${srcdir}/${pkgname%-bin}.js" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
	local _app_dir=$(find "${srcdir}" -type f -name "resources.pak" -exec dirname {} + | head -n 1)
	cp -a "${_app_dir}/resources/app/". "${pkgdir}/usr/lib/${pkgname%-bin}/"
    install -Dm644 "${srcdir}/${_pkgname}-linux-x64/resources/app/resources/linux/code.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}"*.desktop -t "${pkgdir}/usr/share/applications"
    if [ -x "/usr/bin/bash" ];then
        install -Dm644 "${srcdir}/${_pkgname}-linux-x64/resources/completions/bash/${pkgname%-bin}" -t "${pkgdir}/usr/share/bash-completion/completions"
    fi
    if [ -x "/usr/bin/zsh" ];then
        install -Dm644 "${srcdir}/${_pkgname}-linux-x64/resources/completions/zsh/_${pkgname%-bin}" -t "${pkgdir}/usr/share/zsh/site-functions"
    fi
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
