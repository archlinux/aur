# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=komi-store-bin
_pkgname=Komi-Store
_orgi_name=github-store
pkgver=1.9.1
pkgrel=1
pkgdesc="A free, open-source app store for GitHub releases — browse, discover, and install apps with one click. Powered by Kotlin and Compose Multiplatform for Android & Desktop.(Prebuilt version)"
arch=('x86_64')
url="https://www.github-store.org/"
_ghurl="https://github.com/kurikomi-labs/komi-store"
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
    "${pkgname%-bin}-${pkgver}.rpm::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-1-${CARCH}.pkg.tar.zst"
    "${pkgname%-bin}.sh"
)
sha256sums=('d46a1b8275fcde65d7954476557fbcb2b1c036c50d288857f00ee83a610713a6'
            'b76d13cfeadef3a08745465c31ad8047d0039a1759d56af45953c8e507d34365')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_pkgname}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    sed -i "s/Icon=${_orgi_name}/Icon=${pkgname%-bin}/g" "${srcdir}/opt/${_orgi_name}/${_orgi_name}.desktop"
    rm -rf "${srcdir}/opt/${_orgi_name}/bin/${_orgi_name}-launcher.sh"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_orgi_name}/"{bin,lib} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_orgi_name}/${_orgi_name}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/opt/${_orgi_name}/${_orgi_name}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}
