# Maintainer: Joonas Henriksson <joonas.henriksson at gmail com>
# Contributor:

# lgogdownloader fails to download source with regular URL, so hard code 
# the numeric GOG game ID here, and use it for the download path.
_gog_id='2048763853'

pkgname=gog-cuphead-the-delicious-last-course
pkgver=1.3.3.57402
pkgrel=1
pkgdesc='Cuphead DLC, with new playable character and levels. GOG version, uses Wine.'
arch=('x86_64')
url='https://www.gog.com/game/cuphead_the_delicious_last_course'
license=('custom')
depends=('gog-cuphead>=1.3.3')
makedepends=('innoextract')
options=('libtool' 'staticlibs' '!strip')
source=(
    "setup_cuphead_-_the_delicious_last_course_${pkgver%.*}_(${pkgver##*.}).exe`
      `::gogdownloader://${_gog_id}/en1installer0"
    "setup_cuphead_-_the_delicious_last_course_${pkgver%.*}_(${pkgver##*.})-1.bin`
      `::gogdownloader://${_gog_id}/en1installer1"
)
sha512sums=('5ed6d7859424d3cf1ec68ee64e4dc27820b55bc1685a4fc8f7cd6ea50d903d10fbd68ea26db9fa0ef1dd72bdde8ccb188338d81b3e0dde43526d9561c23067b9'
            'f73b829c4a77f194ecfbd01a605bdb385e77eecda592a5ecd0cb6cfe075602d70e49931c498eee2bf0a142eecb0f98dd1a8cf56a137f883581b1c910c989d2d7')
DLAGENTS+=('gogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')
PKGEXT=.pkg.tar

prepare() {
    mkdir -p "${srcdir}/${pkgname#gog-}"
    cd "${srcdir}/${pkgname#gog-}"
    innoextract -c -m --progress=1 \
        "${srcdir}/setup_cuphead_-_the_delicious_last_course_${pkgver%.*}_(${pkgver##*.}).exe"
}

package() {
    msg2 'Packaging game data'
    mkdir -p "${pkgdir}/opt/gog-cuphead"
    mv "${srcdir}/${pkgname#gog-}/Cuphead_Data" -t "${pkgdir}/opt/gog-cuphead"
    mv "${srcdir}/${pkgname#gog-}/goggame-"${_gog_id?}".hashdb" -t "${pkgdir}/opt/gog-cuphead"
    mv "${srcdir}/${pkgname#gog-}/goggame-"${_gog_id?}".info" -t "${pkgdir}/opt/gog-cuphead"
}
