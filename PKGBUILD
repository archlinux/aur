# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=saber-bin
_appname="com.adilhanney.${pkgname%-bin}"
_pkgname=Saber
pkgver=0.21.3
pkgrel=1
pkgdesc="A (work-in-progress) cross-platform libre handwritten notes app"
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/adil192/saber"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'libsecret'
)
options=('!strip')
noextract=("${pkgname%-bin}-${pkgver}-${CARCH}.tar.gz")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_Linux_arm64.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_Linux_x86_64.tar.gz")
source=("${pkgname%-bin}.sh")
sha256sums=('840eb0ad528d294064aa09b2b6df7a0e4a800249f43305c756cf78bee627fe1d')
sha256sums_aarch64=('79a02b7a2fe6743cffc0d1184720618691d8b27723cddea3585c7dc588d93cab')
sha256sums_x86_64=('1a342f1e8017a85f64e4434f3cc0a7323cde9d6b8aa15f7e66d7e20b2af19049')
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