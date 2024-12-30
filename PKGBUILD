# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=aliyun-adrive-bin
_pkgname=aDrive
_zhsname='阿里云盘'
pkgver=4.11.0
_electronversion=22
pkgrel=7
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
makedepends=(
    'gendesk'
    'p7zip'
)
source=(
    "${pkgname%-bin}-${pkgver}.exe::${_dlurl}/releases/download/${_pkgname}${pkgver}/${_pkgname}-${pkgver}.exe"
    "LICENSE.html"
    "${pkgname%-bin}.sh"
)
sha256sums=('507bf86e5dffe75fc9cdd8caea0e1b284dd10dfeba435e331040c305958df7a6'
            'ee4bf71493d9425c0270f59a72778d52b53a9bdcb981f462d1e699d347e9246e'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
build() {
    sed -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@//g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --pkgname="${pkgname%-bin}" --pkgdesc="${pkgdesc}" --categories="Network" --name="${pkgname%-bin}${_zhsname}" --exec="${pkgname%-bin} %U"
    install -Dm755 -d "${srcdir}/tmp"
    7z x -aoa "${srcdir}/${pkgname%-bin}-${pkgver}.exe" -o"${srcdir}/tmp"
    find "${srcdir}/tmp/resources" -type d -exec chmod 755 {} \;
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/tmp/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/tmp/resources/"{app.asar.unpacked,resource} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/tmp/\$TEMP/aDriveSetup/res/form/logo.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
