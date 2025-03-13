# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=geolocator-bin
_pkgname=Geolocator
pkgver=1.0.0
pkgrel=1
pkgdesc="A desktop app to geolocalise your pictures.(Prebuilt version)"
arch=('x86_64')
url="https://github.com/Minigrim0/Geolocator"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk'
    'libsoup'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/Minigrim0/Geolocator/v${pkgver}/LICENSE"
)
sha256sums=('00167e4d10799f8d337fc26efd717147e085e26b8a96fa121f3776048621a060'
            'f4e2ca638c8f86a679d266f719d7f793ab19cd04f333e15379d384358df52e53')
prepare() {
    bsdtar -xf "${srcdir}/data."*
    sed -i -e "
        s/Categories=/Categories=Utility/g
        s/Comment=${_pkgname}/Comment=${pkgdesc}/g
    " "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    _icon_sizes=(32x32 128x128 256x256@2)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}