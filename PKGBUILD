# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=visual-family-tree
pkgname="${_pkgname//-/}-bin"
_appname="Visual Family Tree"
pkgver=1.4.0
pkgrel=4
pkgdesc="Create a family tree with extensive information and pictures about the individual family members."
arch=('x86_64')
url="https://visualfamilytree.jisco.me"
_ghurl="https://github.com/Jisco/VisualFamilyTree"
license=('custom:freeware')
conflits=("${pkgname%-bin}")
depends=(
    'bash'
    'electron11'
    'hicolor-icon-theme'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${_appname// /}.${pkgver}.deb"
    "LICENSE::https://raw.githubusercontent.com/Jisco/VisualFamilyTree/v${pkgver}/README.md"
    "${pkgname%-bin}.sh"
)
sha256sums=('2182a8d0554b1c1811c12e43d093300a50fd438e305272e65da2db72d8eabc5a'
            '5bbd06a727b2ef99ef6738e5e7a4f060175cc823d55ea3d18fbac7a180a9ef28'
            'cc3d9ec7e0d1a4ab982e3d4f4271d8468c20ba0d51107d4249e3fad224d8937b')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|\"/opt/${_appname}/${_pkgname}\" %U|${pkgname%-bin}|g;s|Icon=${_pkgname}|Icon=${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_appname}/resources/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_appname}/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/swiftshader"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
}