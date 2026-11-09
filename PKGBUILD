# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=android-knot-bin
_pkgname=Knot
pkgver=26.11.08
pkgrel=1
pkgdesc="An intelligent multi-scenario recording tool inspired by the minimalist concept of ancient 'knot-tying' memorization."
arch=('x86_64')
url="https://github.com/ic005k/Knot"
license=("MIT")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'sqlite'
    'openssl'
    'libgpg-error'
    'nss'
    'nspr'
    'gmp'
    'e2fsprogs'
)
optdepends=(
    'fcitx5-qt: Fcitx5 input method support'
    'ibus: IBus input method support'
    'cups: Print support'
)
options=(
    '!strip'
    '!emptydirs'
)
source=(
    "${pkgname%-bin}-${pkgver}-x86_64.rpm::${url}/releases/download/${pkgver}/${_pkgname}-Linux-${CARCH}.rpm"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/ic005k/Knot/${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('fe3a61a4fd3d391e293639088111be7d7ed55cc92d392af7e2d0243569645dc5'
            '5076e0113e6e491d04559dd9ec0a80a35392bec88928393d47b8dd620aa96d66'
            '216b754c5be3b7d33ebc915743a3bc4d6663a63b0a07468c88cc26bf20908cb4')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_pkgname}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    sed -i -e "
        s/Exec=${_pkgname}/Exec=${pkgname%-bin}/g
        s/icon/${pkgname%-bin}/g
        s/Application;/Utility;/g
        s/Name=${_pkgname}/Name=Android ${_pkgname}/g
    " "${srcdir}/opt/${_pkgname}/default.desktop"
    find "${srcdir}/opt/${_pkgname}" -type d -perm 700 -exec chmod 755 {} +
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -a "${srcdir}/opt/${_pkgname}/." "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/default.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/opt/${_pkgname}/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
