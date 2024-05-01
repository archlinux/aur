# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=qtvsplayer-bin
_pkgname=QtVsPlayer
pkgver=1.0.52_4
pkgrel=1
pkgdesc="Read local video files of Hikvision devices and display blue, green and red vectors."
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/surfzoid/QtVsPlayer"
license=("GPL-3.0-only")
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
sha256sums=('b557fd5718a13641f40fbf227a9d6a2b48834c36f003dbbc54275215a16afc68')
sha256sums_aarch64=('01bf54745fdbbef997b38f82d55a07638e08be5ea2b70afb8b96a2359ffa5fe6')
sha256sums_x86_64=('c5c912dec069ae90b9ae02e1067cc2b68a04a8ed5ca75bc51acc21d0cc33e603')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${_pkgname}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    sed "s|/usr/bin/${_pkgname}|${pkgname%-bin}|g;s|Icon=${_pkgname}|Icon=${pkgname%-bin}|g;s|/usr/bin|/opt/${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
    rm -rf "${srcdir}/usr/lib64/${_pkgname}/"{libcrypto.so,libcrypto.so.1.1,libopenal.so.1,libssl.so,libssl.so.1.1,libz.so.1}
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 "${srcdir}/usr/bin/${_pkgname}" -t "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/usr/lib64/${_pkgname}/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/usr/lib/libcrypto.so" "${pkgdir}/opt/${pkgname%-bin}/libcrypto.so"
    ln -sf "/usr/lib/libcrypto.so.1.1" "${pkgdir}/opt/${pkgname%-bin}/libcrypto.so.1.1"
    ln -sf "/usr/lib/libopenal.so.1" "${pkgdir}/opt/${pkgname%-bin}/libopenal.so.1"
    ln -sf "/usr/lib/libssl.so" "${pkgdir}/opt/${pkgname%-bin}/libssl.so"
    ln -sf "/usr/lib/libssl.so.1.1" "${pkgdir}/opt/${pkgname%-bin}/libssl.so.1.1"
    ln -sf "/usr/lib/libz.so.1" "${pkgdir}/opt/${pkgname%-bin}/libz.so.1"
    install -Dm644 "${srcdir}/usr/share/${_pkgname}/translations/${_pkgname}_fr_FR.qm" -t "${pkgdir}/opt/${pkgname%-bin}/translations"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}