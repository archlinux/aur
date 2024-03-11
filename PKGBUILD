# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=p3x-onenote-bin
_pkgname=P3X-OneNote
pkgver=2024.4.142
_electronversion=29
pkgrel=1
pkgdesc="Linux Electron Onenote - A Linux compatible version of OneNote"
arch=(
    "aarch64"
    "armv7h"
    "x86_64"
)
url="https://www.corifeus.com/onenote/"
_ghurl="https://github.com/patrikx3/onenote"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'hicolor-icon-theme'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_arm64.deb")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_armv7l.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/patrikx3/onenote/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('9610dab5a4ed91d2caa7d0eee497dcf618fda2715bcdeb3281acbf9c93b7a038'
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
sha256sums_aarch64=('0e7613dd5be23d81fe3cb96236fd102e1b1b9c01918d04c587584cdeadffc5e1')
sha256sums_armv7h=('14d13dddd8a753a52cb741d51a03a23628e98e3a7985b1c867bd72c1a859f639')
sha256sums_x86_64=('727e50d76bdec5b93f5ef21d9725a39aa0edd2a8ec83eed9f416e6bb55cb326d')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed "s|/opt/${_pkgname}/${pkgname%-bin}|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 128x128 256x256;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}