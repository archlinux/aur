# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Isabella Basso do Amaral <isabbasso at riseup dot net>
pkgname=leanote
pkgver=2.7.0
_electronversion=12
pkgrel=2
pkgdesc="Note-taking app.(Prebuilt version.Use system-wide electron)"
arch=(
    'i686'
    'x86_64'
)
url="https://leanote.com/"
_ghurl="https://github.com/leanote/desktop-app"
license=("GPL-2.0-only")
depends=(
    "electron${_electronversion}"
    'nodejs'
)
makedepends=(
    'gendesk'
)
options=(
    '!strip'
)
source=("${pkgname}.sh")
source_i686=("${pkgname}-${pkgver}-i686.zip::${_ghurl}/releases/download/v${pkgver}/${pkgname}-desktop-linux-ia32-v${pkgver}.zip")
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::${_ghurl}/releases/download/v${pkgver}/${pkgname}-desktop-linux-x64-v${pkgver}.zip")
sha256sums=('291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
sha256sums_i686=('236c7b16e7e8367cb8c956c0fd15f033873acc2e3e915611bb36902a4eb1740d')
sha256sums_x86_64=('fe9821230b07e0e826e06ccab389b45c440051fb7a50a6626dd5deead244d984')
prepare() {
    sed -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname}/g
        s/@runname@/app/g
        s/@cfgdirname@/${_pkgname}-Desktop/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " -i "${srcdir}/${pkgname}.sh"
    gendesk -q -f -n --pkgname="${pkgname}" --pkgdesc="${pkgdesc}" --categories="Utility" --name="${_pkgname}" --exec="${pkgname} %U"
}
package() {
   install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
   install -Dm755 -d "${pkgdir}/usr/lib/${pkgname}"
   cp -Pr --no-preserve=ownership "${srcdir}/resources/app"  "${pkgdir}/usr/lib/${pkgname}"
   install -Dm644 "${srcdir}/resources/app/public/images/logo/${pkgname}.png" -t "${pkgdir}/usr/share/pixmaps"
   install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}