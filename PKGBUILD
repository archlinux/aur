# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=calmly-writer-bin
_pkgname=calmly-writer
pkgver=2.0.48
pkgrel=1
pkgdesc="Calmly Writer is an editor designed to focus on what you want to tell, with a simple, unobtrusive and ease-to-use user interface."
arch=('x86_64')
url="https://www.calmlywriter.com"
license=('custom')
conflicts=('calmly-writer')
depends=(
    'lib32-gcc-libs'
    'nss'
    'alsa-lib'
    'gtk3'
    'at-spi2-core'
)
options=()
source=(
  "${_pkgname}_${pkgver}_amd64.deb::${url}/releases/linux/deb/x64/${_pkgname}_${pkgver}_amd64.deb"
  "LICENSE::https://www.calmlywriter.com/eula.htm"
)
sha512sums=('d40ebc3f38619c204ee27a100782c85883adab11f2f96276a68265fd7d1cb84df8c3a01181f0fc7c033efe5cbe3281e56d18eb0e7a8b7b6ba1c6ac38b9edf55e'
            '25c23e25cb15a98ba6062475ce39087b620989b9a330825b7187ad3b82094ff0997ecac7c78f48d83e52fa6dd74548b41e288577cd63e85e0a0d26057c439b1d')
  
prepare() {
    bsdtar -xf data.tar.xz
    mv "${srcdir}/opt/Calmly Writer" "${srcdir}/opt/${pkgname}"
    mv "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${srcdir}/usr/share/applications/${pkgname}.desktop"
    sed 's/Exec=/#Exec=/g;s/Icon=calmly-writer/Icon=calmly-writer-bin/g' \
        -i "${srcdir}/usr/share/applications/${pkgname}.desktop"
    echo 'Exec="/opt/calmly-writer-bin/calmly-writer" %U' >> "${srcdir}/usr/share/applications/${pkgname}.desktop"
    for i in 16x16 32x32 64x64 128x128 256x256 512x512; do
        mv "${srcdir}/usr/share/icons/hicolor/${i}/apps/${_pkgname}.png" \
            "${srcdir}/usr/share/icons/hicolor/${i}/apps/${pkgname}.png"
    done
}
  
package() {
    cp --parents -a {opt,usr} "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
