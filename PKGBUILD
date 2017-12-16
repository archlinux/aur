# Maintainer: Oystein Sture <oysstu ät gmail dõt cóm>
# Contributor:

pkgname=gog-jazz-jackrabbit-2-secret-files
gogver=1.24hf
gogrel=16886

pkgver=${gogver}_${gogrel}
pkgrel=2
pkgbase=${pkgname}
pkgdesc='Jazz Jackrabbit 2 Collection. GOG version (Wine).'
arch=('x86_64')
url='https://www.gog.com/game/jazz_jackrabbit_2_collection'
license=('custom')

_gamename=${pkgname#gog-}
_gamename=${_gamename//-/_}

depends=('wine')
makedepends=('lgogdownloader>=2.25')
source=(
    "setup_jazz_jackrabbit_2_${gogver}_(${gogrel}).exe::gogdownloader://${_gamename}/en1installer0"
    "${pkgname#gog-}.bash"
    "${pkgname#gog-}.desktop"
)
sha512sums=(
    'df6fc47abf24aaa1895df5f897f698b53865fdc499e2454e07b273eddc8fcdeeebe8fc2992292fb27e077da252d3d5728823ce6a2e83412c150fb8742a52116f'
    'b0562ec86e51da42fe8985058b66d82e215e28c64f8df8a2141eb26f738603256bd9d88475c32efd4447ff4040917309de1ebc0b6e7de341475b1a260f0be242'
    'fe00e70800986a37b2b02bb175fe6589dd1f00f216b3c5c858d669f901b12b4022eda64e5c618d99767d01b16de9c70c77c17fc7c474dd52ff98e85d5726e13c'
)

DLAGENTS+=('gogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')

# Prevent compressing final package
PKGEXT='.pkg.tar'

prepare() {
    cd "${srcdir}"
    innoextract -c -m --progress=1 "setup_jazz_jackrabbit_2_${gogver}_(${gogrel}).exe"
}

package() {
    msg2 'Querying GOG ID'
    _gog_id="$( innoextract -s --gog-game-id "setup_jazz_jackrabbit_2_${gogver}_(${gogrel}).exe")"

    msg2 'Packaging game icon'
    install -Dm644 -T "${srcdir}/app/goggame-"${_gog_id?}".ico" "${pkgdir}/usr/share/pixmaps/${pkgname}.ico"
    
    msg2 'Packaging license'
    install -Dm644 "${srcdir}/app/License.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    msg2 'Packaging game data'
    mkdir -p "${pkgdir}/opt/${pkgname}"
    mv -T "${srcdir}/app/" "${pkgdir}/opt/${pkgname}"

    msg2 'Packaging launcher'
    install -Dm755 -T "${srcdir}/${pkgname#gog-}.bash" "${pkgdir}/usr/bin/${pkgname#gog-}"
    
    msg2 'Packaging desktop shortcut'
    install -Dm644 "${srcdir}/${pkgname#gog-}.desktop" "${pkgdir}/usr/share/applications/${pkgname#gog-}.desktop"
}
