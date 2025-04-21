# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=qtvsplayer-bin
_pkgname=QtVsPlayer
pkgver=1.0.52_6
pkgrel=2
pkgdesc="Read local video files of Hikvision devices and display blue, green and red vectors.(Prebuilt version)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/surfzoid/QtVsPlayer"
license=('GPL-3.0-only')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    'freetype2'
    'util-linux-libs'
    'qt5-base'
    'libx11'
    'libglvnd'
    'openal'
)
source=("${pkgname%-bin}.sh")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${url}/releases/download/${pkgver//_/-}/${_pkgname}-${pkgver//_/-}.surf.mlo.aarch64.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${url}/releases/download/${pkgver//_/-}/${_pkgname}-${pkgver//_/-}.surf.mlo.x86_64.rpm")
sha256sums=('bf4d06acb51b2b677a5d01fce315343fc787fe38618d2a26acc2f0701996073b')
sha256sums_aarch64=('54b422fc6aae74d13b96222a212bba9273067a5bdc2a2796b51aa662ece46a7b')
sha256sums_x86_64=('6cdd77d0f287672879d736b2803da203d515314bda12ecce59be90fd5ed8544e')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/
        s/@runname@/${_pkgname}/
    " "${srcdir}/${pkgname%-bin}.sh"
    sed -i -e "
        s/\/usr\/bin\/${_pkgname}/${pkgname%-bin}/g
        s/Icon=${_pkgname}/Icon=${pkgname%-bin}/g
        s/\/usr\/bin/${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${_pkgname}.desktop"
    rm -rf "${srcdir}/usr/lib64/${_pkgname}/"{libcrypto.so,libcrypto.so.1.1,libopenal.so.1,libssl.so,libssl.so.1.1,libz.so.1}
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 "${srcdir}/usr/bin/${_pkgname}" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/usr/lib64/${_pkgname}/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    ln -sf "/usr/lib/libcrypto.so" "${pkgdir}/usr/lib/${pkgname%-bin}/libcrypto.so"
    ln -sf "/usr/lib/libcrypto.so.1.1" "${pkgdir}/usr/lib/${pkgname%-bin}/libcrypto.so.1.1"
    ln -sf "/usr/lib/libopenal.so.1" "${pkgdir}/usr/lib/${pkgname%-bin}/libopenal.so.1"
    ln -sf "/usr/lib/libssl.so" "${pkgdir}/usr/lib/${pkgname%-bin}/libssl.so"
    ln -sf "/usr/lib/libssl.so.1.1" "${pkgdir}/usr/lib/${pkgname%-bin}/libssl.so.1.1"
    ln -sf "/usr/lib/libz.so.1" "${pkgdir}/usr/lib/${pkgname%-bin}/libz.so.1"
    install -Dm644 "${srcdir}/usr/share/${_pkgname}/translations/${_pkgname}_fr_FR.qm" -t "${pkgdir}/usr/lib/${pkgname%-bin}/translations"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}