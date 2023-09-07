# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=sunbible
_pkgname=SunBible
pkgver=2.0.001_beta
pkgrel=2
pkgdesc="Bible Desktop App"
arch=('any')
url="https://sunbible-dev.github.io/SunBible/"
_githuburl="https://github.com/SunBible-dev/SunBible"
license=('MIT')
provides=("${pkgname}")
conflicts=("${pkgname}")
depends=('libxcomposite' 'mesa' 'libdrm' 'pango' 'hicolor-icon-theme' 'libxfixes' 'libxext' 'libcups' 'libx11' 'libxdamage' 'gcc-libs' \
    'libxkbcommon' 'cairo' 'libxrandr' 'alsa-lib' 'gtk3' 'nss' 'at-spi2-core' 'nspr' 'expat' 'glibc' 'glib2' 'dbus' 'libxcb')
makedepends=('yarn' 'npm' 'gendesk')
source=("${pkgname}-${pkgver}.tar.gz::${_githuburl}/archive/refs/tags/${pkgver//_/-}.tar.gz")
sha256sums=('20f6415de9e17d2dc39c7c61b75d1e4c0b672e538b351433bb616284fbcb074f')
build() {
    cd "${srcdir}/${_pkgname}-${pkgver//_/-}"
    yarn install
    yarn AppImage
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname}",usr/bin}
    cp -r "${srcdir}/${_pkgname}-${pkgver//_/-}/dist/linux-unpacked/"* "${pkgdir}/opt/${pkgname}"
    ln -sf "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256;do
        install -Dm644 "${srcdir}/${_pkgname}-${pkgver//_/-}/build/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname}.png"
    done
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver//_/-}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    gendesk -f -n --categories "Utility" --name "${_pkgname}" --exec "${pkgname} --no-sandbox %U"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}