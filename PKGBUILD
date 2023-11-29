# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=waveterm
_pkgname=Wave
pkgver=0.5.0
_electronversion=27
pkgrel=1
pkgdesc="An open-source, cross-platform terminal for seamless workflows"
arch=(
    'x86_64'
)
url="https://www.waveterm.dev/"
_ghurl="https://github.com/wavetermdev/waveterm"
license=('Apache')
conflicts=("${pkgname}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gcc'
    'yarn'
    'gendesk'
    'npm'
    'nodejs>=20'
    'git'
    'go>=1.18'
    'scripthaus'
)
source=(
    "${pkgname}-${pkgver}::git+${_ghurl}.git#tag=v${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('SKIP'
            'e85053336764cf8115d7ddcfc7a5260db9d7feed643ad7a5b3cdb7c5a41efb4a')
build() {
    gendesk -f -n -q --categories "Utility" --exec "${pkgname}"
    sed -i "s|@electronversion@|${_electronversion}|" "${srcdir}/${pkgname}.sh"
    cd "${srcdir}/${pkgname}-${pkgver}"
    yarn
    scripthaus run electron-rebuild
    scripthaus run build-backend
    scripthaus run build-package
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname}"
    cp -r "${srcdir}/${pkgname}-${pkgver}/out/${_pkgname}-linux-x64/resources/app" "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/src/app/assets/${pkgname}-logo.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}