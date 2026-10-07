# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=final2x-bin
_pkgname=Final2x
pkgver=4.1.0
_electronversion=27
_pyver=3.14
pkgrel=1
pkgdesc="2^x Image Super-Resolution."
arch=('x86_64')
license=('BSD-3-Clause')
conflicts=("${pkgname%-bin}")
url="https://final2x.tohru.top/"
_ghurl="https://github.com/Tohrusky/Final2x"
depends=(
    "electron${_electronversion}"
    'vulkan-icd-loader'
    'python-pydantic'
    'python-pyopenssl'
    'python-pydantic-core'
    'libsm'
    'python-attrs'
    'python-pytest'
    'python-filelock'
    'python-sniffio'
    'python-setuptools'
    'python-docutils'
    'python-typing_extensions'
    'python-cffi'
    'vapoursynth'
    'python-charset-normalizer'
    'python'
    'python-loguru'
    'python-annotated-types'
    'python-pip'
    'python-colorama'
    'libice'
    'python-yaml'
    'python-pillow'
    'python-cryptography'
    'python-psutil'
    'python-pytorch'
    'python-tornado'
)
options=(
    '!strip'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-linux-pip-x64-deb.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/Tohrusky/Final2x/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('8f5ce2654e1312b561fba97fbf8a25132188ce7d60513685813e8dce5803b196'
            '1c242d5b56eacdc11b1bb8460b78ba0212e6cdf1aa6f2809743e0b9d0e064b3d'
            'fe033c7446c688abcb9a007d75f40eb9ca62756880cfde6be54fdf27a5bd94a8')
_get_app_dir() {
	find "${srcdir}" -type f -name "resources.pak" -print 2>/dev/null | while read f; do [ -d "${f%/*}/resources" ] && echo "${f%/*}" && break; done
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
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    _check_electron_version
    sed -i "s/\/opt\/${_pkgname}\///g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    python -m venv ./
    ./bin/pip install "${_pkgname}-core"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
	local _app_dir="$(_get_app_dir)"
	cp -a "${_app_dir}/resources/." "${pkgdir}/usr/lib/${pkgname%-bin}/"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
		_extension="${_i##*.}"
		_icon_path="${_i#*share/icons/}"
		_target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
		install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
	done
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}/python${_pyver}/site-packages"
    cp -a "${srcdir}/lib/python${_pyver}/site-packages/." "${pkgdir}/usr/lib/${pkgname%-bin}/python${_pyver}/site-packages"
}