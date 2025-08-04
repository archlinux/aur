# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=stackzy-bin
_pkgname=Stackzy
pkgver=1.2.11
pkgrel=1
pkgdesc="A cross-platform desktop application to identify libraries used inside an android application. Made possible by Compose Desktop.(Prebuilt version)"
arch=('x86_64')
url="https://github.com/theapache64/stackzy"
license=("Apache-2.0")
provides=("${pkgname%-bin}=${pkgver}")
confilcts=("${pkgname%-bin}")
depends=(
    'java-runtime'
    'libxrender'
    'alsa-lib'
    'libxi'
    'libxtst'
    'libglvnd'
    'fontconfig'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}-1_amd64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('3a6bdf4f436635aea008e4a1a49b18917f03c8b10f07c42e54ab9d4b32abb00a'
            '0b2d50b001b1fa7a0a1a18e86827b31f13dabc8258e39c54266cb9ab6210f568')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_pkgname}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i -e "
        s/\/opt\/${pkgname%-bin}\/bin\/${_pkgname}/${pkgname%-bin}/g
        s/\/opt\/${pkgname%-bin}\/lib\/${_pkgname}.png/${pkgname%-bin}/g
        s/Unknown/Development;/g
    " "${srcdir}/opt/${pkgname%-bin}/lib/${pkgname%-bin}-${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${pkgname%-bin}" "${pkgdir}/usr/lib"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/lib/${pkgname%-bin}-${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/lib/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}
