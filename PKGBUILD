# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=final2x-bin
_pkgname=Final2x
pkgver=2.1.0
_date=2024-12-14
_electronversion=27
_pyver=3.13
pkgrel=3
pkgdesc="2^x Image Super-Resolution.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
license=('BSD-3-Clause')
conflicts=("${pkgname%-bin}")
url="https://final2x.tohru.top/"
_ghurl="https://github.com/Tohrusky/Final2x"
depends=(
    "electron${_electronversion}"
    'nodejs'
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
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/${_date}/${_pkgname}-linux-pip-x64-deb.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/Tohrusky/Final2x/${_date}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('a3c46e08a0754f223e35d578706eb6a071437a6dd554d10fc60efaf21f49acad'
            '1c242d5b56eacdc11b1bb8460b78ba0212e6cdf1aa6f2809743e0b9d0e064b3d'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i "s/\/opt\/${_pkgname}\///g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    python -m venv ./
    ./bin/pip install "${_pkgname}-core"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_pkgname}/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm755 "${srcdir}/bin/"{f2py,"${_pkgname}-core",numpy-config} -t "${pkgdir}/usr/lib/${pkgname%-bin}/app/resources/${_pkgname}-core"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}/python${_pyver}/site-packages"
    cp -Pr --no-preserve=ownership "${srcdir}/lib/python${_pyver}/site-packages/"* "${pkgdir}/usr/lib/${pkgname%-bin}/python${_pyver}/site-packages"
}