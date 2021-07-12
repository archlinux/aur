# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor: Joonas Henriksson <joonas.henriksson at gmail com>

pkgname=gog-cuphead
pkgver=20170929.15295
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
    "setup_cuphead_${pkgver%.*}_(${pkgver#*.}).exe`
      `::gogdownloader://${pkgname#gog-}/en1installer1"
    "setup_cuphead_${pkgver%.*}_(${pkgver#*.})-1.bin`
      `::gogdownloader://${pkgname#gog-}/en1installer2"
    'launch_gog-cuphead.bash'
)
sha512sums=(
    'e4f7f068b1a62d3854e1f7cba83b46efb9eb1020e93f3638caa745c0241e6699e6a801fb8fe80b690545113428839a84fa385c9533eeeab2a0ea3a7ee78907b5'
    'c9fc8aa7d3287181f63ebc5e087eff132a513f5612821e1def992498e7b16723aaa25a2bb016ccb6a282e89c27f854ee496cbf6f065d4df2d8944c180fc23e4b'
    '5d929d62e2e9105252cdbf6d4d31b2b342844250a42abb35dccddf5fc900b251f60d4bec30488d5f811cb3bd85eda95cbf40109d72d951a678344107b5794c91'
)
DLAGENTS+=('gogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')
PKGEXT=.pkg.tar

prepare() {
    cd "${srcdir}"
    innoextract -c -m --progress=1 \
        "setup_cuphead_${pkgver%.*}_(${pkgver#*.}).exe"
}

package() {
    msg2 'Querying GOG ID'
    _gog_id="$(
      innoextract -s --gog-game-id \
        "${srcdir}/setup_cuphead_${pkgver%.*}_(${pkgver#*.}).exe"
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
