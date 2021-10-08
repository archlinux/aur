# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor: Joonas Henriksson <joonas.henriksson at gmail com>

pkgname=gog-cuphead
pkgver=1.2.4.29705
pkgrel=2
pkgdesc='Contra-esque action game with retro cartoon visuals. GOG version, uses Wine.'
arch=('x86_64')
url='https://www.gog.com/game/cuphead'
license=('custom')
depends=('wine' 'wine-mono' 'wine-gecko')
makedepends=('innoextract' 'lgogdownloader')
options=('libtool' 'staticlibs' '!strip')
install="${pkgname}.install"
source=(
    "setup_cuphead_${pkgver%.*}_(${pkgver##*.}).exe`
      `::gogdownloader://${pkgname#gog-}/en1installer0"
    "setup_cuphead_${pkgver%.*}_(${pkgver##*.})-1.bin`
      `::gogdownloader://${pkgname#gog-}/en1installer1"
    'launch_gog-cuphead.bash'
    'gog-cuphead.desktop'
)
sha512sums=('bd2644ae4aa2de1b1d6b90d4f8ba91ca1d34f4083a7ed603c39f00b18660def1f9b35c05bb3f342bff5b465d71f6951821accbc2bd430a603cb7cfbc18a5a554'
            '7e5734aa90213076275cb7cbb570d46ec8924e7cae1c7ec7686f692a50087a5e57d6a7ceedaaeb21d1d3fd21659fb453dc2ab8495bab11d5d16f9d40126dcca2'
            '090081b2e86fa38a3b5d3d8f97dbc21abfe1450a895cd6bfae5b66361963ea697cb8e8f82af1594ae75804ac475196989e4afca489513c2d7a47c73d02667ca2'
            '3a57177546ed23f97f038bf5aa2bdf98d9d32cbad99a34c85239d91c0733a4035177d1173f6ffd816b48348316d0df33f93d2f720e1939f54da9996c7c6b5c49')
DLAGENTS+=('gogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')
PKGEXT=.pkg.tar

prepare() {
    mkdir -p "${srcdir}/${pkgname#gog-}"
    cd "${srcdir}/${pkgname#gog-}"
    innoextract -c -m --progress=1 \
        "${srcdir}/setup_cuphead_${pkgver%.*}_(${pkgver##*.}).exe"
}

package() {
    msg2 'Querying GOG ID'
    _gog_id="$(
      innoextract -s --gog-game-id \
        "${srcdir}/setup_cuphead_${pkgver%.*}_(${pkgver##*.}).exe"
    )"

    msg2 'Packaging game icon'
    install -D -m 644 -T \
        "${srcdir}/${pkgname#gog-}/app/goggame-"${_gog_id?}".ico" \
        "${pkgdir}/usr/share/pixmaps/${pkgname}.ico"

    msg2 'Packaging game data'
    mkdir -p "${pkgdir}/opt/"
    mv "${srcdir}/${pkgname#gog-}" "${pkgdir}/opt/${pkgname}"

    msg2 'Packaging launcher'
    install -D -m 755 -T \
        "${srcdir}/launch_${pkgname}.bash" \
        "${pkgdir}/usr/bin/${pkgname#gog-}"

    msg2 'Packaging desktop file'
    install -D -m 755 -T \
        "${srcdir}/${pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
