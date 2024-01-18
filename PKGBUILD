# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Siavash Askari Nasr <ciavash@protonmail.com>
pkgname=kaiteki-bin
_pkgname=Kaiteki
pkgver=2024_02
pkgrel=2
pkgdesc="A comfy Fediverse client for microblogging instances, made with Flutter and Dart. Currently with simple Mastodon, Pleroma, Misskey and Calckey support"
arch=('x86_64')
url='https://kaiteki.app'
_ghurl=https://github.com/Kaiteki-Fedi/Kaiteki
license=('AGPL3')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    'gtk3'
    'libhandy'
    'at-spi2-core'
    'cairo'
    'libepoxy'
    'pango'
    'gdk-pixbuf2'
    'fontconfig'
    'harfbuzz'
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.zip::${_ghurl}/releases/download/weekly-${pkgver//_/-}/linux.zip"
    "${pkgname%-bin}.sh"
)
sha256sums=('1d58a8439b0f535ae9b37ffd460bdd391c38f9c74a80d361cd215301c9879b49'
            '1e338ff128b2be2b0d484ea2d00814db6709a5e2cc455a373428d21f8ed690d5')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${pkgname%-bin}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --categories "Network" --name "${_pkgname}" --exec "${pkgname%-bin} --no-sandbox %U" "${startdir}/PKGBUILD"
    chmod 755 "${srcdir}/linux/${pkgname%-bin}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/linux/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/linux/data/flutter_assets/assets/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}