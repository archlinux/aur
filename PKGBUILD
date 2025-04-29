# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_officalname=suwell-reader
pkgname="${_officalname}-bin"
_pkgname=SuwellReader
_appname="cn.${_officalname//-/.}"
_zhsname='数科OFD阅读器'
pkgver=3.0.22.0916
pkgrel=10
pkgdesc="OFD Reader Professional 3.0 From Suwell .LTD.(Prebuilt version)"
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
arch=('x86_64')
url="https://www.suwell.cn/"
_downurl="https://com-store-packages.uniontech.com"
license=('LicenseRef-custom')
depends=(
    'gtk2'
    'libpng12'
    'glu'
    'libjpeg6-turbo'
    'libice'
    'libxt'
    'libsm'
)
options=(
    '!strip'
    '!emptydirs'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_downurl}/appstore/pool/appstore/c/${_appname}.appstore/${_appname}.appstore_${pkgver}-1_amd64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('69e56165f999ca8a168d64d0e22180755c67091b700fca1e339910580b127d1f'
            '2144461f37fe70f8ba576fbcf33ba7cc8179d133295a58519aa51c0ff5a48d2b')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_pkgname}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i -e "
        s/\/usr\/bin\/${_officalname//-/}/${pkgname%-bin}/g
        /serverice/d
        /^#/d
        s/\/opt\/apps\/${_appname}\/entries\/icons\/hicolor\/256x256\/mimetypes\/${_appname}.app-x-${_officalname//-/}.png/${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/apps/${_appname}/files/bin/suwell/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/fonts/cesi_font/"*.ttf -t "${pkgdir}/usr/share/fonts/cesi-font"
    install -Dm644 "${srcdir}/usr/share/mime/packages/"*.xml -t "${pkgdir}/usr/share/mime/packages"
    for _icons in 16x16 24x24 32x32 64x64 96x96 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_appname}.app-x-suwellreader.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
}