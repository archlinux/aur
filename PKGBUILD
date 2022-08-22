# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor: Joonas Henriksson <joonas.henriksson at gmail com>

pkgname=gog-cuphead
pkgver=1.3.4.58147
pkgrel=1
pkgdesc='Contra-esque action game with retro cartoon visuals. GOG version, uses Wine.'
arch=('x86_64')
url='https://www.gog.com/game/cuphead'
license=('custom')
depends=('wine' 'wine-mono' 'wine-gecko')
makedepends=('innoextract' 'imagemagick')
optdepends=('gog-cuphead-the-delicious-last-course: The Delicious Last Course DLC')
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
sha512sums=('0d2689dfe47ab38257d43cdc5b4d09300a9b8e0c117bd0d2075584d8b8a4a9876b7e3b3ec535021a09ef403017887b160e6a7cdd0929e7fd3d726a91846cfe40'
            '200f503b8aa32e60a034e21c1b1ada5df2c9273d082545b408f3ccd8b216d8ef79246ce164cea2b498900602641eb47868f02d141eeb7bc0304e86fe1e88f70b'
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
    mkdir -p "${pkgdir}/usr/share/pixmaps/"
    # The compressed .ico consists of 7 pixmaps of different sizes.
    # Last image in the sequence is scaled up from a smaller icon
    # and therefore blurry, so pick the largest non-blurry icon.
    convert -delete 0,1,2,3,4,6 \
        "${srcdir}/${pkgname#gog-}/app/goggame-"${_gog_id?}".ico" \
        "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

    msg2 'Packaging game data'
    rm -rf \
        "${srcdir}/${pkgname#gog-}/app" \
        "${srcdir}/${pkgname#gog-}/commonappdata" \
        "${srcdir}/${pkgname#gog-}/__redist"
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
