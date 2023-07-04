# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="sunbible"
pkgver=2.0.001beta
_pkgver=2.0.001-beta
pkgrel=1
pkgdesc="Bible Desktop App"
arch=('any')
url="https://sunbible-dev.github.io/SunBible/"
_githuburl="https://github.com/SunBible-dev/SunBible"
license=('MIT')
conflicts=("${pkgname}" "${pkgname}-appimage")
depends=('libxcomposite' 'mesa' 'libdrm' 'pango' 'hicolor-icon-theme' 'libxfixes' 'libxext' 'libcups' 'libx11' 'libxdamage' 'gcc-libs' \
    'libxkbcommon' 'cairo' 'libxrandr' 'alsa-lib' 'gtk3' 'nss' 'at-spi2-core' 'nspr' 'expat' 'glibc' 'glib2' 'dbus' 'libxcb')
makedepends=('yarn' 'electron' 'gendesk')
source=("${pkgname}-${pkgver}.tar.gz::${_githuburl}/archive/refs/tags/${_pkgver}.tar.gz")
sha256sums=('20f6415de9e17d2dc39c7c61b75d1e4c0b672e538b351433bb616284fbcb074f')
build() {
    cd "${srcdir}/SunBible-${_ pkgver}"
    yarn install && yarn dist
}
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname}"
    cp -r "${srcdir}/SunBible-${_pkgver}/dist/linux-unpacked/"* "${pkgdir}/opt/${pkgname}"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256;do
        install -Dm644 "${srcdir}/SunBible-${_pkgver}/build/icons/${_icons}.png" "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname}.png"
    done
    install -Dm644 "${srcdir}/SunBible-${_pkgver}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    gendesk -f --icon "${pkgname}" --categories "Utility" --name "SunBible" --exec "/opt/${pkgname%}/${pkgname} %U"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}