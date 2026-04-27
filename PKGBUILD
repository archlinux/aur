# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=lotti-bin
_pkgname=Lotti
_debname="com.matthiasn.${pkgname%-bin}"
pkgver=0.9.976_3984
pkgrel=1
pkgdesc="Achieve your goals and keep your data private with Lotti. This life tracking app is designed to help you stay motivated and on track, all while keeping your personal information safe and secure. Now with on-device speech recognition.(Prebuilt version)"
arch=('x86_64')
url="https://github.com/matthiasn/lotti"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'pango'
    'gdk-pixbuf2'
    'mpv'
    'gtk3'
    'libkeybinder3'
    'libsecret'
    'libepoxy'
    'cairo'
    'at-spi2-core'
    'harfbuzz'
    'libxmu'
    'gstreamer'
    'gst-plugins-base-libs'
)
source=(
    "${pkgname%-bin}-${pkgver}.tar.gz::${url}/releases/download/${pkgver//_/+}/linux.x64.tar.gz"
    "${pkgname%-bin}.sh"
)
noextract=("${pkgname%-bin}-${pkgver}.tar.gz")
sha256sums=('be2c4bc98edef5e9bb13b55ec4cac10887e184118f1e93e48fabe6e2d214537d'
            '6c653ecadf03d9566022c30e03185a6cbfc1ab8de1c9ddec899bac356c4d40d7')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${pkgname%-bin}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    install -Dm755 -d "${srcdir}/usr/lib/${pkgname%-bin}"
    bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}.tar.gz" -C "${srcdir}/usr/lib/${pkgname%-bin}"
    sed -i "s/Icon=${_debname}/Icon=${pkgname%-bin}/g" -i "${srcdir}/usr/lib/${pkgname%-bin}/share/applications/${_debname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/usr" "${pkgdir}"
    rm -rf "${pkgdir}/usr/lib/${pkgname%-bin}/share"
    install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}/share/applications/${_debname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    _icon_sizes=(16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}/share/icons/hicolor/${_icons}/apps/com.matthiasnehlsen.${pkgname%-bin}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
}
