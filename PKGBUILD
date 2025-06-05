# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=qmusicplayer-bin
_pkgname=QMusicPlayer
pkgver=0.2.2_beta
pkgrel=1
pkgdesc="A Simple Local Music Player Based on Qt6 Development.(Prebuilt version)"
arch=('x86_64')
url="https://github.com/CatIsNotFound/QMusicPlayer"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
options=(
    '!strip'
    'staticlibs'
)
depends=(
    'qt6-declarative'
)
source=(
    "${pkgname%-bin}-${pkgver}-x86_64.rpm::${url}/releases/download/v${pkgver//_/-}/${_pkgname}-${pkgver}-1.fc41.${CARCH}.rpm"
    "${pkgname%-bin}.sh"
)
sha256sums=('c4b342a016c67caca8e242e225aef671ccd7a3b6958582100cd1506d4a28fcd6'
            'db1db4c15024a45337e7e7190046e6414184603321be058797422a54ed5fc85d')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_pkgname}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    sed -i -e "
        s/\/opt\/${_pkgname}\/${_pkgname}/${pkgname%-bin}/g
        s/Icon=\/usr\/share\/icons\/hicolor\/scalable\/apps\/${_pkgname}.svg/${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_pkgname}/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg" \
            "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-bin}.svg"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}