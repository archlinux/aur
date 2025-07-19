# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=pipelab-bin
_pkgname=Pipelab
pkgver=1.27.0
_electronversion=32
pkgrel=1
pkgdesc="A visual tool to create task automation workflows.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://pipelab.app/"
_ghurl="https://github.com/CynToolkit/pipelab"
license=('LicenseRef-FSL-1.1-MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'python'
    'python-typing_extensions'
    'python-packaging'
    'python-setuptools'
)
makedepends=(
    'gendesk'
)
options=(
    '!emptydirs'
    '!strip'
)
source=(
    "${pkgname%-bin}-${pkgver}-x86_64.zip::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-linux-x64-${pkgver}.zip"
    "LICENSE-${pkgver}.md::https://raw.githubusercontent.com/CynToolkit/pipelab/v${pkgver}/LICENSE.md"
    "${pkgname%-bin}.sh"
)
sha256sums=('de6b0278bc2452dd13ae3e45fdce973baa1faffb9b3e051bfb3c53863c7db1f4'
            '92ddb84a1531980e4142c76f4936b1ff8ea132777df206d4bf6da123c094f8f4'
            'f2fe8c189974ffb9d445e9a42bd4f1d5b60185607c3fcafae79ab44be224e013')
_get_electron_version() {
    _electronversion="$(strings "${srcdir}/${_pkgname}-linux-x64/${_pkgname}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
    echo -e "The electron version is: \033[1;31m${_electronversion}\033[0m"
}
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app/g
        s/@cfgdirname@/@${pkgname%-bin}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    _get_electron_version
    gendesk -q -f -n \
        --pkgname="${pkgname%-bin}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Utility" \
        --name="${_pkgname}" \
        --exec="${pkgname%-bin} %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/${_pkgname}-linux-x64/resources/"{app,assets}  "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
    install -Dm644 "${srcdir}/${_pkgname}-linux-x64/resources/assets/build/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
