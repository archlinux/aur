# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=apple-music-bin
_pkgname="Apple Music"
pkgver=2.1.1
_electronversion=22
pkgrel=1
pkgdesc="An Electron app that provides a native Apple Music experience for Linux & Windows."
arch=('x86_64')
url="https://github.com/Alex313031/apple-music-desktop"
license=('BSD-3-Clause')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    'nspr'
    'nss'
    'alsa-lib'
    'hicolor-icon-theme'
    'gtk3'
)
options=(
    '!strip'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
)
sha256sums=('223cd587d54ff764ac95e0c1d516aa6d0415aac98b309ff40bb84572d95b4174')
build() {
    bsdtar -xf "${srcdir}/data."*
    sed "s|\"/opt/${_pkgname}/${pkgname%-bin}\"|${pkgname%-bin} --no-sandbox|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/opt/${_pkgname}/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/opt/${_pkgname}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}