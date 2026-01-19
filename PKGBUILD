# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=github-store-bin
_pkgname=GitHub-Store
pkgver=1.5.1
pkgrel=1
pkgdesc="A free, open-source app store for GitHub releases — browse, discover, and install apps with one click. Powered by Kotlin and Compose Multiplatform for Android & Desktop.(Prebuilt version)"
arch=('x86_64')
url="https://github.com/rainxchzed/Github-Store"
license=('Apache-2.0')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'alsa-lib'
    'java-runtime'
    'libxrender'
    'libx11'
    'libxext'
    'libglvnd'
    'libxi'
    'libxtst'
    'fontconfig'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${url}/releases/download/${pkgver}/${_pkgname//-/.}-${pkgver}_x86_64.rpm"
    "${pkgname%-bin}.sh"
)
sha256sums=('99c619d551cb63efcbd205090532e50e29db888bf5e23fea68e81c8d7da4b19e'
            '81266c37f90d6eef62471250c3c906d0dec1f1c3041f22b7b45f7a3be612f9c1')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_pkgname}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    sed -i -e "
        s/Exec=\/opt\/${pkgname%-bin}\/bin\/${_pkgname}/Exec=${pkgname%-bin}/g
        s/Icon=\/opt\/${pkgname%-bin}\/bin\/${_pkgname}.png/Icon=${pkgname%-bin}/g
    " "${srcdir}/opt/${pkgname%-bin}/lib/${pkgname%-bin}-${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${pkgname%-bin}/"{bin,lib} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/lib/${pkgname%-bin}-${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/lib/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}
