# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=qtvsplayer-bin
_pkgname=QtVsPlayer
pkgver=1.0.52_1
pkgrel=2
pkgdesc="QtVsPlayer for Hikvision, QtVsPlayer can read local video files of Hikvision and display blue, green and red vector.It read real time live stream"
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/surfzoid/QtVsPlayer"
license=("GPL3")
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    'freetype2'
    'util-linux-libs'
    'qt5-base'
    'libx11'
    'libglvnd'
    'openal'
    'openssl-1.1'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${url}/releases/download/${pkgver//_/-}/${_pkgname}_${pkgver//_/-}_bullseye-arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${url}/releases/download/${pkgver//_/-}/${_pkgname}_${pkgver//_/-}_ubuntu-latest-amd64.deb")
sha256sums_aarch64=('a8040dc4af3920829ce5f86880f32fa57dac836def528209f8264e21e7e4fca3')
sha256sums_x86_64=('2361f785132b356a061391eee5600781be964d9383ddd7819f20ac907d29d909')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/usr/bin/${_pkgname}|${pkgname%-bin}|g;s|Icon=${_pkgname}|Icon=${pkgname%-bin}|g;s|/usr/bin|/opt/${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
    echo "/opt/${pkgname%-bin}/" >> "${srcdir}/${pkgname%-bin}.conf"
    echo "/opt/${pkgname%-bin}/HCNetSDKCom/" >> "${srcdir}/${pkgname%-bin}.conf"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${_pkgname}" -t "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.conf" -t "${pkgdir}/etc/ld.so.conf.d"
    cp -r "${srcdir}/usr/lib64/${_pkgname}/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/bin"
    ln -sf "/opt/${pkgname%-bin}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}