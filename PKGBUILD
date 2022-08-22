# Maintainer: Joonas Henriksson <joonas.henriksson at gmail com>
# Contributor:

# lgogdownloader fails to download source with regular URL, so hard code 
# the numeric GOG game ID here, and use it for the download path.
_gog_id='2048763853'

pkgname=gog-cuphead-the-delicious-last-course
pkgver=1.3.4.58147
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
sha512sums=('bab224b8a54b409762094a81237d8be613bb302235c8f0987f69da7e7f31b3e1a3f4d08a3e3d32fd763202e9b5a856c889cfc369455a7d2ff79af7afacd77239'
            '681f76e09e98ddf44fb732172ad2dfda8c25cbc07ef5dcd7bdae8b9fb1601c9e01b4c3e39403433548665c7703f65f0e852eca2e5d1f1926ea78477073acb216')
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
