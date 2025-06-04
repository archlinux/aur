# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=wenku
pkgname="baidu${_pkgname}-bin"
_zhsname='百度文库'
pkgver=3.2.3
_electronversion=22
pkgrel=1
pkgdesc="Baidu wenku Client.(Prebuilt version.Use system-wide electron)一款由百度发布的供网友在线分享文档的平台"
arch=('x86_64')
url="https://wenku.baidu.com"
license=('LicenseRef-custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=(
    "${pkgname%-bin}"
    "deepin-wine-${pkgname%-bin}"
)
depends=(
    "electron${_electronversion}"
    'nodejs'
)
makedepends=(
    '7zip'
    'asar'
    'gendesk'
    'curl'
)
options=(
    '!strip'
    '!emptydirs'
)
source=(
    "${pkgname%-bin}-${pkgver}.exe::https://edu-wenku.bdimg.com/v1/na/0807/PC%E5%AE%A2%E6%88%B7%E7%AB%AF%E7%89%88%E6%9C%AC%E5%8C%85/${_pkgname}-Setup-${pkgver}.exe"
    "LICENSE.html::https://edu-wenku.bdimg.com/v1/pc/protocols/help24-new.htm"
    "${pkgname%-bin}.sh"
)
sha256sums=('70401d9b7b39f5c38ff9f73041a2e87f18619c9b5f565ef6176711a9d48023ce'
            'eb85aa9b3586dcd16b0f18b4b467b46b076688f9d1f723dea7f2eb92cd797ce7'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app/g
        s/@cfgdirname@/${_pkgname}-pc/g
        s/@options@//g
    " "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n \
        --pkgname="${pkgname%-bin}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Office" \
        --name="${pkgname%-bin}" \
        --exec="${pkgname%-bin} %U" \
        --custom="Name[zh_CN]=${_zhsname}"
    rm -rf "${srcdir}/tmp"
    install -Dm755 -d "${srcdir}/tmp"
    7z x -aoa "${srcdir}/${pkgname%-bin}-${pkgver}.exe" -o"${srcdir}/tmp"
    asar e "${srcdir}/tmp/resources/app.asar" "${srcdir}/app.asar.unpacked"
    cp "${srcdir}/tmp/winbuild/app.png" "${srcdir}/app.asar.unpacked/static/icons/icon.png"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}/app"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/tmp/winbuild/app.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}