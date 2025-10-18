# Maintainer: Joonas Henriksson <joonas.henriksson at gmail com>
# Contributor:

# lgogdownloader fails to download source with regular URL, so hard code 
# the numeric GOG game ID here, and use it for the download path.
_gog_id='2048763853'

pkgname=gog-cuphead-the-delicious-last-course
pkgver=1.3.9.85531
pkgrel=1
pkgdesc='Cuphead DLC, with new playable character and levels. GOG version, uses Wine.'
arch=('x86_64')
url='https://www.gog.com/game/cuphead_the_delicious_last_course'
license=('custom')
depends=("gog-cuphead>=${pkgver%.*}")
makedepends=('innoextract')
options=('libtool' 'staticlibs' '!strip')
source=(
    "setup_cuphead_-_the_delicious_last_course_${pkgver%.*}_(${pkgver##*.}).exe`
      `::gogdownloader://${_gog_id}/en1installer0"
    "setup_cuphead_-_the_delicious_last_course_${pkgver%.*}_(${pkgver##*.})-1.bin`
      `::gogdownloader://${_gog_id}/en1installer1"
)
sha512sums=('014e284acc7ecf7b0547f8f281dbf26435eb4af41ef747db5ac19c6f41dccb73755f8e74796fb2d8c710e1d288cff17f1be88cf5ffe606d5a03ddf230358ee71'
            '104fa0c0fefda2044baa2012bd27085f048311e17ba4ef9ade3303374252fcc78f3c19bd43a2dd3a34d327ac1dd22b1eec28ea42d59f9d96c1791b2d61d324dc')
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
