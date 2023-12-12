# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=secret-diary-bin
_pkgname=Secret-Diary
pkgver=1.2.16
pkgrel=5
pkgdesc="Desktop diary tool. crypt with AES 256. 安全日记本，一个加密信息管理软件，加密强度非常强，只能暴力破解数据，只要密码足够复杂，数据就足够安全。"
arch=("x86_64")
url="http://rocket049.cn/"
_ghurl="https://github.com/rocket049/secret-diary"
license=('Apache')
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
            '0532bec6588d7b9d6cba26c488fc638b28d35b1c21e1ed16510c0a8f8df54450')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runappname@|${pkgname%-bin}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data.tar.zst"
    sed -e "s|/opt/${pkgname%-bin}/${pkgname%-bin}|${pkgname%-bin}|g" \
        -e "s|/opt/${pkgname%-bin}/Sd.png|${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    cp -r "${srcdir}/opt" "${pkgdir}"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/Sd.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}