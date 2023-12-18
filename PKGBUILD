# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=saber-bin
_appname="com.adilhanney.${pkgname%-bin}"
_pkgname=Saber
pkgver=0.18.5
pkgrel=1
pkgdesc="A (work-in-progress) cross-platform libre handwritten notes app"
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/adil192/saber"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'at-spi2-core'
    'pango'
    'gtk3'
    'libepoxy'
    'libsecret'
    'gdk-pixbuf2'
    'harfbuzz'
    'fontconfig'
    'cairo'
)
options=('!strip')
noextract=("${pkgname%-bin}-${pkgver}-${CARCH}.tar.gz")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_Linux_arm64.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_Linux_x86_64.tar.gz")
source=("${pkgname%-bin}.sh")
sha256sums=('e96039b9cc371e674094ed86db49ee76fc55387ef44d4fb858b156dad7113c99')
sha256sums_aarch64=('ac7fed960ebd51d987c05cd6ede90333d981a9003b784e569d6732428fc4311a')
sha256sums_x86_64=('ca46f5adc9316e259bc86542c1648fbbaae91400b52b3b48f5752a251d9462a7')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${pkgname%-bin}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    mkdir -p "${srcdir}/opt/${pkgname%-bin}"
    bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.tar.gz" -C "${srcdir}/opt/${pkgname%-bin}"
    rm -rf "${srcdir}/opt/${pkgname%-bin}/usr"
    sed "s|${_appname}|${pkgname%-bin}|g" -i "${srcdir}/opt/${pkgname%-bin}/share/applications/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    cp -r "${srcdir}/opt" "${pkgdir}"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/share/icons/hicolor/512x512/apps/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/share/metainfo/${_appname}.metainfo.xml" "${pkgdir}/usr/share/metainfo/${pkgname%-bin}.metainfo.xml"
}