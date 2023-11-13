# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=eudic
pkgname="eusoft-${_pkgname}-bin"
pkgver=2023.11.07
pkgrel=1
pkgdesc="权威的英语词典软件,英语学习者必备的工具,支持学习笔记、生词本多平台同步,让你随时随地学英语."
arch=('x86_64')
url="https://www.eudic.net/v4/en/app/eudic"
license=('custom')
provides=("${_pkgname}=${pkgver}")
conflicts=("${pkgname%-bin}" "${_pkgname}")
options=('!strip')
depends=()
makedepends=('squashfuse')
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::https://www.eudic.net/download/${_pkgname}.AppImage?v=${pkgver//./-}"
    "LICENSE.html"
    "${pkgname%-bin}.sh"
)
sha256sums=('4b24ee5b57fadbe9395c635aab9153d6a8776cfe6ac6faa5755ddbe6c4f0ec7c'
            '8254fc6f96e7362405da60a8ece9d86ad26066b5edac10e775aca4e6d7c0979f'
            '16b06d11928ebbb45468f14a896ebb75424c6aa4a7ee9789b0db5fbc114ab95d')
build() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|/usr/share/${_pkgname}/AppRun %F|${pkgname%-bin}|g;s|com.eusoft.${_pkgname}|${pkgname%-bin}|g" \
        -i "${srcdir}/squashfs-root/default.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.AppImage"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    ln -sf "/usr/lib/qt/plugins/platforminputcontexts/libfcitx"*.so \
        "${pkgdir}/opt/${pkgname%-bin}/"
    install -Dm644 "${srcdir}/squashfs-root/com.eusoft.${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/squashfs-root/default.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}