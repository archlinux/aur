# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor: Joonas Henriksson <joonas.henriksson at gmail com>

pkgname=gog-cuphead
pkgver=1.2.4.29705
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
      `::gogdownloader://${pkgname#gog-}/en1installer1"
    "setup_cuphead_${pkgver%.*}_(${pkgver##*.})-1.bin`
      `::gogdownloader://${pkgname#gog-}/en1installer2"
    'launch_gog-cuphead.bash'
)
sha512sums=('bd2644ae4aa2de1b1d6b90d4f8ba91ca1d34f4083a7ed603c39f00b18660def1f9b35c05bb3f342bff5b465d71f6951821accbc2bd430a603cb7cfbc18a5a554'
            '7e5734aa90213076275cb7cbb570d46ec8924e7cae1c7ec7686f692a50087a5e57d6a7ceedaaeb21d1d3fd21659fb453dc2ab8495bab11d5d16f9d40126dcca2'
            '5d929d62e2e9105252cdbf6d4d31b2b342844250a42abb35dccddf5fc900b251f60d4bec30488d5f811cb3bd85eda95cbf40109d72d951a678344107b5794c91')
DLAGENTS+=('gogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')
PKGEXT=.pkg.tar

prepare() {
    cd "${srcdir}"
    innoextract -c -m --progress=1 \
        "setup_cuphead_${pkgver%.*}_(${pkgver##*.}).exe"
}

package() {
    msg2 'Querying GOG ID'
    _gog_id="$(
      innoextract -s --gog-game-id \
        "${srcdir}/setup_cuphead_${pkgver%.*}_(${pkgver##*.}).exe"
    )"

    msg2 'Packaging game icon'
    install -D -m 644 -T \
        "${srcdir}/app/goggame-"${_gog_id?}".ico" \
        "${pkgdir}/usr/share/pixmaps/${pkgname}.ico"

    msg2 'Packaging game data'
    mkdir -p "${pkgdir}/opt/${pkgname}"
    mv -t "${pkgdir}/opt/${pkgname}" "${srcdir}/app"

    msg2 'Packaging launcher'
    install -D -m 755 -T \
        "${srcdir}/launch_${pkgname}.bash" \
        "${pkgdir}/usr/bin/${pkgname#gog-}"
}
