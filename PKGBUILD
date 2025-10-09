# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=final2x-bin
_pkgname=Final2x
pkgver=4.0.0
_electronversion=27
_pyver=3.13
pkgrel=1
pkgdesc="2^x Image Super-Resolution.(Prebuilt version.Use system-wide electron)"
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
sha256sums=('6e92ea9e0497afd9af9832c7023809476672d7c98f8dddba25c4cd9a1e38ce2f'
            '1c242d5b56eacdc11b1bb8460b78ba0212e6cdf1aa6f2809743e0b9d0e064b3d'
            '31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6')
_get_electron_version() {
    _elec_ver="$(strings "${srcdir}/opt/${_pkgname}/${pkgname%-bin}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
    echo -e "The electron version is: \033[1;31m${_elec_ver}\033[0m"
}
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    _get_electron_version
    sed -i "s/\/opt\/${_pkgname}\///g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    python -m venv ./
    ./bin/pip install "${_pkgname}-core"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_pkgname}/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm755 "${srcdir}/bin/"{f2py,"${_pkgname}-core",numpy-config} -t "${pkgdir}/usr/lib/${pkgname%-bin}/app/resources/${_pkgname}-core"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/1024x1024/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}/python${_pyver}/site-packages"
    cp -Pr --no-preserve=ownership "${srcdir}/lib/python${_pyver}/site-packages/"* "${pkgdir}/usr/lib/${pkgname%-bin}/python${_pyver}/site-packages"
}