# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
#获取版本号及下载地址：
#https://comate-ide.bj.bcebos.com/updates/stable/linux/arm64/latest.json
#https://comate-ide.bj.bcebos.com/updates/stable/linux/x64/latest.json
pkgname=comate-bin
_pkgname=Comate
pkgver=0.13.1
_version=9e0656fd6bfc10039eb9aadb94e41070f8603a9a-241439519
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
sha256sums=('60888303ea720fa3757c0f113bfeae34d41397d6a99d94d5e22ce84113de3e7c'
            '14807b90c15a2757d9713664db6a69aa4fab3568e53d84f27de2ab7c8ae85446'
            '0c8fee636da036e57fcde0385bdc698126c4b179de663ad315e8299d483abc9d'
            '787bf0078b80c66fa5b8191991700afd6e32e9f285cdb32f69791b8894c86fd5'
            'e0ab2fe87491fabd9c7886f22c6929169edb508be832036a02698760b721f207')
sha256sums_x86_64=('56eb5ee7c8130828be4e44a21f595809cbcaaf0b0b4d02a5c3527216ba53e780')
_get_electron_version() {
    _elec_ver="$(strings "${srcdir}/${_pkgname}-linux-x64/${pkgname%-bin}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
    echo -e "The electron version is: \033[1;31m${_elec_ver}\033[0m"
}
prepare() {
    _get_electron_version
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    sed -i "s/@ELECTRON@/electron${_electronversion}/g" "${srcdir}/${pkgname%-bin}.js"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 "${srcdir}/${pkgname%-bin}.js" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    if find "${srcdir}/${_pkgname}-linux-x64/resources/app" -mindepth 1 -maxdepth 1 -type d | read; then
        for _subdir in "${srcdir}/${_pkgname}-linux-x64/resources/app/"*; do
            if [ -d "${_subdir}" ]; then
                cp -Pr --no-preserve=ownership "${_subdir}" "${pkgdir}/usr/lib/${pkgname%-bin}"
            fi
        done
    fi
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
