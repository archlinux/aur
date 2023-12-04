# Maintainer: zxp19821005 <zxp19821005 at 163 dot com> / ihipop <ihipop at gmail dot com>
_pkgname=eudic
pkgname="eusoft-${_pkgname}-bin"
pkgver=2023.12.01
pkgrel=1
pkgdesc="权威的英语词典软件,英语学习者必备的工具,支持学习笔记、生词本多平台同步,让你随时随地学英语."
arch=('x86_64')
url="https://www.eudic.net/v4/en/app/eudic"
license=('custom')
provides=("${_pkgname}=${pkgver}")
conflicts=("${pkgname%-bin}" "${_pkgname}")
options=('!strip')
depends=()
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::https://cn.francochinois.com/beta_release/linux/2023-12-01/${_pkgname}-13.5.2-x86_64.AppImage?v=${pkgver//./-}"
    "LICENSE.html::https://www.eudic.net/v4/en/home/privacy"
)
sha256sums=(
            '5b5e107fc99b700bfb519d2ecaf6877bbf117ceee7cc8f784c784e0be8b0a2a3'
            'SKIP'
           )
build() {
    rm -rf "${srcdir}/squashfs-root/"
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    rm -f  "${srcdir}"*.AppImage
    sed "s|/usr/share/${_pkgname}/AppRun|${pkgname%-bin}|g;s|Icon=com.eusoft.${_pkgname}|Icon=/opt/${pkgname%-bin}/com.eusoft.${_pkgname}|g" \
        -i "${srcdir}/squashfs-root/default.desktop"
    ln -sf "/usr/lib/qt/plugins/platforminputcontexts/libfcitx"*.so "${srcdir}/squashfs-root/plugins/platforminputcontexts/"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/${pkgname%-bin},usr/bin,usr/share/applications}
    cp -r "${srcdir}/squashfs-root/." "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/AppRun" "${pkgdir}/usr/bin/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/default.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/opt/${pkgname%-bin}"
}