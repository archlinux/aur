# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=musicat-bin
_pkgname=Musicat
pkgver=0.10.0
pkgrel=1
pkgdesc="A sleek desktop music player and tagger for offline music 🪕 With experimental features like map view, GPT analysis, artist toolkit.Prebuilt version."
arch=('x86_64')
url="https://github.com/basharovV/musicat"
license=('GPL-3.0-only')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    'gtk3'
    'alsa-lib'
    'webkit2gtk-4.1'
)
source=("${pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('d5a5ae2626b5053748d4d310e22b0bf60ccde4da7025c7ac48a70e6399fcd2b0')
build() {
    bsdtar -xf "${srcdir}/data."*
    sed -e "
        s/app/${pkgname%-bin}/g
        s/Development/AudioVideo/g
    " -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/app" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/lib/${_pkgname}/resources/log4rs.yml" -t "${pkgdir}/usr/lib/${_pkgname}/resources"
    for _icons in 32x32 128x128 256x256@2;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/app.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-git}.desktop"
}