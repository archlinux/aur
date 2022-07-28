# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor: Joonas Henriksson <joonas.henriksson at gmail com>

pkgname=gog-cuphead
pkgver=1.3.3.57402
pkgrel=1
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
sha512sums=('8bb3bc80b2db9ed2d1d28f54616fa320a6e00815f4a43b9e8006c4cde8d7eab2259f64d282cc66956f18e412c2b95b4c1fe268a38498be74ad81619ba07a6b7f'
            '94fab5bedee31e96b02d543de3af67175d5ce9ec3bcdb46c360f875d0bbba0abcb6e2996193c30be6eb1e8cc740529c614460589bf58e7387e10a2506325b791'
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
