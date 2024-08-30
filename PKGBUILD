# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=xunscore-bin
_pkgname=Xunscore
pkgver=1.3.13.03
pkgrel=1
pkgdesc='A music notation software, let you easily create and share sheet music. The editor is called "xūn", is hoping it will be a better balance between the Chinese national music'
arch=('x86_64')
url="https://www.xunscore.cn"
_giteeurl="https://gitee.com/xunscore/xunapp"
license=('LicenseRef-custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'libglvnd'
    'libxrender'
    'libx11'
    'gst-plugins-base-libs'
    'libxext'
    'libxkbcommon'
    'fontconfig'
    'libxkbcommon-x11'
    'gstreamer'
    'libpulse'
    'freetype2'
    'libxcb'
    'alsa-lib'
    'libsndfile'
    'qt5-base'
)
makedepends=(
    'gendesk'
)
noextract=("${pkgname%-bin}-${pkgver}.zip")
source=(
    "${pkgname%-bin}-${pkgver}.zip::${url}/${pkgname%-bin}-ubt-${pkgver}.zip"
    "LICENSE::${_giteeurl}/blob/master/README.md"
    "${pkgname%-bin}.sh"
)
sha256sums=('54adaace209ec36dcdf739a6e5710c002df47c3bab180aa2025721c72d2c1803'
            '0ad40f17100d4b295b26f82a558eec8cb1e8b7ff64cb55806fd671d8ef190ec1'
            '956aa0a14e61e4903d7a2c4f71c9b9cb6ed4e45d6527671fb4e6e4409c95fc60')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${pkgname%-bin}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --pkgname="${pkgname%-bin}" --pkgdesc="${pkgdesc}" --categories="AudioVideo" --name="${_pkgname}" --exec="${pkgname%-bin} %U"
    install -Dm755 -d "${srcdir}/usr/lib"
    bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}.zip" -C "${srcdir}/usr/lib"
    chmod 644 "${srcdir}/usr/lib/${pkgname%-bin}/soundfonts/metronome.sf2"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    cp -r "${srcdir}/usr" "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    #install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}