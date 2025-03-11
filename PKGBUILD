# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=yidongbangong-bin
_debname="com.cmic.${pkgname%-bin}"
pkgver=1.0.6
_electronversion=13
pkgrel=1
pkgdesc="A newly created one-stop office solution that integrates 5G communication, basic office and industry applications in order to meet the communication needs of integrated products in the 5G background.(Prebuilt version.Use system-wide electron)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://oa.cmzq-office.com/web/ydbg/hebangong"
license=('LicenseRef-custom')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
)
options=(
    '!emptydirs'
    '!strip'
)
source=(
    "LICENSE.html::${url}/about-service.html"
    "${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::https://dlydbg.cmzq-office.com/pc/uos_${pkgver}_arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::https://dlydbg.cmzq-office.com/pc/uos_${pkgver}_amd64.deb")
sha256sums=('7627ead55b09367210eafcc5d0aa8a5270ad79fc2f5994d956d532b7e1280ac6'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
sha256sums_aarch64=('0a12f1d6951993ba40caa17365648d63d9cae8dc52df1fb8f431c58b3de23b37')
sha256sums_x86_64=('1dc913e6075fa7b294d8e91cc3eee2e4a064ff0ad559f082dbd5b29277fa9caa')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-bin}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i -e "
        s/\/opt\/apps\/${_debname}\/files\/${pkgname%-bin} --no-sandbox/${pkgname%-bin}/g
        s/Icon=${_debname}/Icon=${pkgname%-bin}/g
    " "${srcdir}/opt/apps/${_debname}/entries/applications/${_debname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/apps/${_debname}/files/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/apps/${_debname}/files/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    _icon_sizes=(16x16 32x32 48x48 64x64 128x128 256x256 512x512)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/opt/apps/${_debname}/entries/icons/hicolor/${_icons}/apps/${_debname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/opt/apps/${_debname}/entries/applications/${_debname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}