# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=issie-bin
pkgver=5.3.1
_electronversion=32
pkgrel=1
pkgdesc="An intuitive cross-platform hardware design application."
arch=('x86_64')
url="https://tomcl.github.io/issie"
_ghurl="https://github.com/tomcl/issie"
license=('GPL-3.0-only')
conflits=("${pkgname%-bin}")
depends=(
    'gtk3'
    'alsa-lib'
    'nss'
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
)
noextract=("${pkgname%-bin}-${pkgver}.zip")
source=(
    "${pkgname%-bin}-${pkgver}.zip::${_ghurl}/releases/download/v5.3.2/${pkgname%-bin}-${pkgver}-linuxx64.zip"
)
sha256sums=('4f93f937dd216ca9ca71bf109617f215be2776be43f1b89927ccbf97609e2de1')
prepare() {
    install -Dm755 -d "${srcdir}/usr/lib/${pkgname%-bin}"
    bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}.zip" -C "${srcdir}/usr/lib/${pkgname%-bin}"
    _file_list=(chrome_100_percent.pak chrome_200_percent.pak chrome_crashpad_handler chrome-sandbox icudtl.dat libEGL.so libffmpeg.so \
        libGLESv2.so libvk_swiftshader.so libvulkan.so.1 resources.pak vk_swiftshader_icd.json)
    for _files in "${_file_list[@]}";do
        rm -rf "${srcdir}/usr/lib/${pkgname%-bin}/${_files}"
        ln -sf "/usr/lib/electron${_electronversion}/${_files}" "${srcdir}/usr/lib/${pkgname%-bin}/${_files}"
    done
    gendesk -q -f -n --pkgname="${pkgname%-bin}" --pkgdesc="${pkgdesc}" --categories="Utility" --name="${pkgname%-bin}" --exec="${pkgname%-bin} --no-sandbox %U"
}
package() {
    cp -r "${srcdir}/usr" "${pkgdir}"
    install -Dm755 -d "${pkgdir}/usr/bin"
    ln -sf "/usr/lib/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/lib/${pkgname%-bin}/resources/static/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}