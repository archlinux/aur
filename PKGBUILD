# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=electron-pdf-viewer-bin
_appname=Electron-PDF-Viewer
pkgver=1.0
_electronversion=2
pkgrel=7
pkgdesc="PDF viewer created using Electron framework and PDF.js"
arch=(
    'armv7h'
    'i686'
    'x86_64'
)
url="https://github.com/praharshjain/Electron-PDF-Viewer"
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}-bin"
)
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.deb::${url}/releases/download/v${pkgver}/${_appname}_${pkgver}.0_armv7l.deb")
source_i686=("${pkgname%-bin}-${pkgver}-i686.deb::${url}/releases/download/v${pkgver}/${_appname}_${pkgver}.0_ia32.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/${_appname}_${pkgver}.0_amd64.deb")
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/praharshjain/Electron-PDF-Viewer/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('70fbb7828155cceb6b104bad95d085832731eec32b74683ff34740e2161e2e42'
            '50b10386d13e5bec806aeb78f819c4edd0208a4d184332e53866c802731217fe')
sha256sums_armv7h=('47ee8289ac564315538e97c8abf7e4907323f0a54120e3aa5dfdaa5af0adef59')
sha256sums_i686=('924b9497d979f39df36b594a2d553b5e9c7f233144943ec51c51831518f33a5f')
sha256sums_x86_64=('5531e0281ebf710ff5f04fb605eb314226c45ff5ecc8888387ab44423b1d9da5')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed "s|Exec=${_appname}|Exec=${pkgname%-bin}|g;s|Icon=${_appname}|Icon=${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    mkdir -p "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/usr/lib/${_appname}/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}