# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=saber-bin
_appname="com.adilhanney.${pkgname%-bin}"
_pkgname=Saber
pkgver=1.35.0
pkgrel=1
pkgdesc="The cross-platform open-source app built for handwriting.(Prebuilt version)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://saber.adil.hanney.org/"
_ghurl="https://github.com/saber-notes/saber"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'libsecret'
    'webkit2gtk-4.1'
    'libxmu'
)
options=('!strip')
noextract=("${pkgname%-bin}-${pkgver}-${CARCH}.tar.gz")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${_ghurl}/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_Linux_arm64.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${_ghurl}/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_Linux_x86_64.tar.gz")
source=("${pkgname%-bin}.sh")
sha256sums=('3b8311438e88f47eb507322a43c7a4156bfebb8c0f6e7b7436ef70842fb4c745')
sha256sums_aarch64=('187775b1fb22ed41678792c41f0d68411c0514705568399ed3bd328a4824b150')
sha256sums_x86_64=('2c4a2ce9308b4d2105c81b207384d86a12733976d07d5acf310084570061e338')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${pkgname%-bin}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    install -Dm755 -d "${srcdir}/usr/lib/${pkgname%-bin}"
    bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.tar.gz" -C "${srcdir}/usr/lib/${pkgname%-bin}"
    rm -rf "${srcdir}/usr/lib/${pkgname%-bin}/usr"
    sed -i "s/${_appname}/${pkgname%-bin}/g" "${srcdir}/usr/lib/${pkgname%-bin}/share/applications/${_appname}.desktop"
    sed -i "s/${_appname}/${pkgname%-bin}/g" "${srcdir}/usr/lib/${pkgname%-bin}/share/metainfo/${_appname}.metainfo.xml"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    cp -a "${srcdir}/usr" "${pkgdir}"
    rm -rf "${pkgdir}/usr/lib/${pkgname%-bin}/share"
    install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}/share/icons/hicolor/scalable/apps/${_appname}.svg" \
        "${pkgdir}/usr/share/hicolor/scalable/apps/${pkgname%-bin}.svg"
    install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}/share/metainfo/${_appname}.metainfo.xml" "${pkgdir}/usr/share/metainfo/${pkgname%-bin}.metainfo.xml"
}
