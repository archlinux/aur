# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=qtvsplayer-bin
_pkgname=QtVsPlayer
pkgver=1.0.51_3
pkgrel=2
pkgdesc="QtVsPlayer for Hikvision, QtVsPlayer can read local video files of Hikvision and display blue, green and red vector.It read real time live stream"
arch=('aarch64' 'x86_64')
url="https://github.com/surfzoid/QtVsPlayer"
license=("GPL3")
depends=('freetype2' 'zlib' 'util-linux-libs' 'glibc' 'qt5-base' 'libx11' 'libglvnd' 'gcc-libs' 'openal' 'openssl-1.1')
conflicts=("${pkgname%-bin}")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${url}/releases/download/${pkgver//_/-}/${_pkgname}_${pkgver//_/-}_bullseye-arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${url}/releases/download/${pkgver//_/-}/${_pkgname}_${pkgver//_/-}_ubuntu-latest-amd64.deb")
sha256sums_aarch64=('9831ed2ca84c2d36920f19f821c8586a0c407e30d7c16b61674b78f0997ea7bf')
sha256sums_x86_64=('01de6b381b38829190ef684da106da0d45c343edc43cd35819d6190e5052eb47')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/usr/bin/${_pkgname}|${pkgname%-bin}|g;s|Icon=${_pkgname}|Icon=${pkgname%-bin}|g;s|/usr/bin|/opt/${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
    echo "/opt/${pkgname%-bin}/" >> "${srcdir}/${pkgname%-bin}.conf"
    echo "/opt/${pkgname%-bin}/HCNetSDKCom/" >> "${srcdir}/${pkgname%-bin}.conf"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${_pkgname}" -t "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.conf" -t "${pkgdir}//etc/ld.so.conf.d"
    cp -r "${srcdir}/usr/lib64/${_pkgname}/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/bin"
    ln -sf "/opt/${pkgname%-bin}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}