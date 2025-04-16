# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=certmanager-bin
_pkgname=CertManager
_uosname="cn.bitnum.${pkgname%-bin}"
pkgver=1.0.0
pkgrel=5
pkgdesc="A simple and efficient local certificate management tool that provides functions such as certificate installation, certificate management, and certificate verification.(Prebuilt version)一款简单高效的本地证书管理工具,提供证书安装、证书管理、证书验证等功能，支持国密证书."
arch=('x86_64')
url="http://www.bitnum.com/"
_dlurl="https://com-store-packages.uniontech.com/pool/appstore"
license=('LicenseRef-custom')
depends=(
    'qt6-base'
    'libglvnd'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_dlurl}/c/${_uosname}/${_uosname}_${pkgver}_amd64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('e5e15c046381827d6558e4cd351b73934c3812546fc85204259ea2a20e2febd9'
            'd51d809af628cc8292bd430a4847adb4adefa9d4b0aee00a55a84ff9630e167c')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_pkgname}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    rm -rf "${srcdir}/opt/apps/${_uosname}/files/证书管理器"
    sed -i -e "
        s/\/opt\/apps\/${_uosname}\/files\/${_pkgname}/${pkgname%-bin} %U/g
        s/\/opt\/apps\/${_uosname}\/entries\/icons\/icon.png/${pkgname%-bin}/g
    " "${srcdir}/opt/apps/${_uosname}/entries/applications/${_uosname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/apps/${_uosname}/files/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/apps/${_uosname}/entries/applications/${_uosname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/opt/apps/${_uosname}/entries/icons/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}