# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=xunscore-bin
_pkgname=Xunscore
pkgver=1.3.13.03
pkgrel=4
pkgdesc='A music notation software, let you easily create and share sheet music. The editor is called "xūn", is hoping it will be a better balance between the Chinese national music(Prebuilt version)'
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
    'imagemagick'
)
options=(
    '!emptydirs'
)
noextract=("${pkgname%-bin}-${pkgver}.zip")
source=(
    "${pkgname%-bin}-${pkgver}.zip::${url}/${pkgname%-bin}-ubt-${pkgver}.zip"
    "${pkgname%-bin}.ico::${url}/favicon.ico"
    "LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('54adaace209ec36dcdf739a6e5710c002df47c3bab180aa2025721c72d2c1803'
            'e6f9d163300a261baeb5e4865c2d5877ebe16c06127a799c1b3f33c6441023bb'
            '93c773a0b8e2e2926f4178d4626c23a78fe2ce2473198eb0a9bf6f1ae52d928d'
            '20acff6b7caae22bc23e515772f7da6802c9fac0313c0ca272282b89c770046f')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${pkgname%-bin}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --pkgname="${pkgname%-bin}" --pkgdesc="${pkgdesc}" --categories="AudioVideo" --name="${_pkgname}" --exec="${pkgname%-bin} %U"
    install -Dm755 -d "${srcdir}/usr/lib"
    bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}.zip" -C "${srcdir}/usr/lib"
    chmod 644 "${srcdir}/usr/lib/${pkgname%-bin}/soundfonts/metronome.sf2"
    magick "${srcdir}/${pkgname%-bin}.ico" "${srcdir}/${pkgname%-bin}.png"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/usr" "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}