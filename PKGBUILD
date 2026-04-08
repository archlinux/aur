# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Thanks maoyaotang <maoyaotang@163.com> ,who made the deb package.
pkgname=aliyun-adrive-bin
_pkgname=aDrive
_debname=com.aliyun.pan
_zhsname='阿里云盘'
pkgver=4.11.0
_electronversion=41
pkgrel=8
pkgdesc="Aliyun aDrive.(Ported from Windows version.Prebuilt version.Use system-wide electron).${_zhsname}"
arch=('x86_64')
url="https://www.aliyundrive.com"
_dlurl="https://github.com/zxp19821005/My_AUR_Files"
license=('LicenseRef-custom')
conflicts=(
    "${pkgname%-bin}"
    "deepin-wine-adrive"
    "adrive"
)
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_dlurl}/releases/download/${pkgname%-bin}/${_debname}_${pkgver}-4_amd64.deb"
    "LICENSE.html"
    "${pkgname%-bin}.sh"
)
sha256sums=('e7dae0d062c94b8cd339d284b9451e47d3462e7a58186a115ee3b1e7f6e3513b'
            'ee4bf71493d9425c0270f59a72778d52b53a9bdcb981f462d1e699d347e9246e'
            '31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@//g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i -e "
        s/\/opt\/apps\/${_debname}\/files\/aliyunpan/${pkgname%-bin}/g
        s/Icon=aliyunpan/Icon=${pkgname%-bin}/g
    " "${srcdir}/opt/apps/${_debname}/entries/applications/${_debname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/apps/${_debname}/files/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/apps/${_debname}/entries/applications/${_debname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/opt/apps/${_debname}/entries/icons/hicolor/256x256/apps/aliyunpan.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
