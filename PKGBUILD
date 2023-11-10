# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=beaker-ng-bin
_pkgname="${pkgname%-ng-bin}-browser"
_appname="Beaker Browser"
pkgver=1.2.3
pkgrel=4
pkgdesc="An experimental peer-to-peer Web browser - Compiler optimized, community maintained fork."
arch=('x86_64')
url="https://github.com/Alex313031/beaker-ng"
_githuburl="https://github.com/Alex313031/beaker-ng"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}" "${_pkgname}")
depends=(
    'electron13'
    'hicolor-icon-theme'
    'perl'
    'python-six'
    'make'
    'python-setuptools'
    'lib32-gcc-libs'
    'python'
    'lib32-glibc'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/${pkgver}/${_pkgname}_${pkgver}_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/Alex313031/beaker-ng/${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('ccb8672acecf930b9784d34de2a10c2ada6086e6df87d8dc30475e9e40e9e577'
            'eb791f2db5b80ad689773f5a5087942dabc577d5a22b5f5618d9c19f82facc17'
            'eb830547b1845465633955b944e3e5af324433878769c64ee6f50f901f332d5c')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|\"/opt/${_appname}/${_pkgname}\" %U|${pkgname%-bin} --no-sandbox %U|g;s|Icon=${_pkgname}|Icon=${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_appname}/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/swiftshader"
    cp -r "${srcdir}/opt/${_appname}/resources/"{app,wvconf.json} "${pkgdir}/usr/lib/${pkgname%-bin}"
    for _icons in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 144x144 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}