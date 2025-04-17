# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=secret-diary-bin
_pkgname=Secret-Diary
pkgver=1.2.16
pkgrel=9
pkgdesc="Desktop diary tool. crypt with AES 256.(Prebuilt version)安全日记本，一个加密信息管理软件，加密强度非常强，只能暴力破解数据，只要密码足够复杂，数据就足够安全。"
arch=("x86_64")
url="http://rocket049.cn/"
_ghurl="https://github.com/rocket049/secret-diary"
license=('Apache-2.0')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'qt5-base'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-ubuntu2204_amd64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('a0d688214e98d391d61b44440bbe9249245041e97e1578e57868bcdcae6ac05b'
            'd51d809af628cc8292bd430a4847adb4adefa9d4b0aee00a55a84ff9630e167c')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runappname@/${pkgname%-bin}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i -e "
        s/\/opt\/${pkgname%-bin}\///g
        s/\/opt\/${pkgname%-bin}\/Sd.png/${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${pkgname%-bin}" "${pkgdir}/usr/lib"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/Sd.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}