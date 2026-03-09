# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=github-store-bin
_pkgname=GitHub-Store
pkgver=1.6.2
pkgrel=1
pkgdesc="A free, open-source app store for GitHub releases — browse, discover, and install apps with one click. Powered by Kotlin and Compose Multiplatform for Android & Desktop.(Prebuilt version)"
arch=('x86_64')
url="https://www.github-store.org/"
_ghurl="https://github.com/rainxchzed/Github-Store"
license=('Apache-2.0')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'alsa-lib'
    'java-runtime>=21'
    'libxrender'
    'libx11'
    'libxext'
    'libglvnd'
    'libxi'
    'libxtst'
    'fontconfig'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${_ghurl}/releases/download/${pkgver}/${_pkgname}-${pkgver}.x86_64.rpm"
    "${pkgname%-bin}.sh"
)
sha256sums=('902dc2d164f1707dca20b972a71be52645a7e3e4b0c39b49442597f9690fec65'
            '81266c37f90d6eef62471250c3c906d0dec1f1c3041f22b7b45f7a3be612f9c1')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_pkgname}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    sed -i -e "
        s/Exec=\/opt\/${pkgname%-bin}\/bin\/${_pkgname}/Exec=${pkgname%-bin}/g
        s/Icon=\/opt\/${pkgname%-bin}\/lib\/${_pkgname}.png/Icon=${pkgname%-bin}/g
        s/Development/Development;/g
    " "${srcdir}/opt/${pkgname%-bin}/lib/${pkgname%-bin}-${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${pkgname%-bin}/"{bin,lib} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/lib/${pkgname%-bin}-${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/lib/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}
