# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=anytxt-bin
_pkgname=Anytxt
_debname="com.cbewin.${pkgname%-bin}"
pkgver=1.3.1482
pkgrel=1
pkgdesc="Desktop search tool for file content.(Prebuilt version)"
arch=('x86_64')
url="https://anytxt.net.cn/"
_dlurl="https://mirrors.sdu.edu.cn/spark-store//store"
license=('LicenseRef-freeware')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'openssl-1.1'
    'libxcrypt-compat'
    'pcre'
    'qt5-declarative'
    'qt5-base'
    'libssh'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_dlurl}/office/${_debname}/${_debname}_${pkgver}_amd64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('0380b9e367c088f7cc6a372f151258513fe1acadfd6997659b6ac0f122e6cc4b'
            'db1db4c15024a45337e7e7190046e6414184603321be058797422a54ed5fc85d')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/ATGUI/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i -e "
        s/\/opt\/apps\/${_debname}\/files\/ATGUI/${pkgname%-bin}/g
        s/\/usr\/share\/icons\/hicolor\/256x256\/apps\/${_debname}.png/${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${_debname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/apps/${_debname}/files/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    _icon_sizes=(16x16 32x32 64x64 128x128 256x256 512x512)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_debname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${_debname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}