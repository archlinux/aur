# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=jet-pilot-bin
_pkgname='JET Pilot'
pkgver=1.32.0
pkgrel=1
pkgdesc="An open-source Kubernetes desktop client that focuses on less clutter, speed and good looks.(Prebuilt version)"
arch=('x86_64')
url="https://jet-pilot.app/"
_ghurl="https://github.com/unxsist/jet-pilot"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname// /.}-${pkgver}-1.${CARCH}.rpm"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/unxsist/jet-pilot/v${pkgver}/LICENSE"
)
sha256sums=('22334fde6130ad570ad70bb683ca62b4c8f46d790ca57689826fb8f2c4a5d608'
            '508a77d2e7b51d98adeed32648ad124b7b30241a8e70b2e72c99f92d8e5874d1')
prepare() {
    sed -e "
        s/Exec=\"${_pkgname}\"/Exec=${pkgname%-bin}/g
        s/Icon=${_pkgname}/Icon=${pkgname%-bin}/g
    " -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    _icon_sizes=(32x32 128x128 256x256@2)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}