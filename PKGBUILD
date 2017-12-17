# Maintainer: Oystein Sture <oysstu ät gmail dõt cóm>
# Contributor:

pkgname=gog-jazz-jackrabbit-2-secret-files
_gogver=1.24hf
_gogrel=16886
_gamename=${pkgname#gog-}
_gamename=${_gamename//-/_}

pkgver=${_gogver}_${_gogrel}
pkgrel=4
pkgdesc='Jazz Jackrabbit 2 Collection. GOG version (Wine).'
arch=('x86_64')
url='https://www.gog.com/game/jazz_jackrabbit_2_collection'
license=('custom')

depends=('wine')
makedepends=('lgogdownloader>=2.25' 'wget' 'grep' 'coreutils')

source=(
    "setup_jazz_jackrabbit_2_${_gogver}_(${_gogrel}).exe::gogdownloader://${_gamename}/en1installer0"
    "${pkgname#gog-}.png"::gogicon://${_gamename}
    "${pkgname#gog-}.bash"
    "${pkgname#gog-}.desktop"
)

sha512sums=(
    'df6fc47abf24aaa1895df5f897f698b53865fdc499e2454e07b273eddc8fcdeeebe8fc2992292fb27e077da252d3d5728823ce6a2e83412c150fb8742a52116f'
    '333138a7f999c4e4dbab53acd57c323f5147f17850ab28d479c123bfb0dd83947069de5ee9dd8044cabfb9b8319f17a6fe47f6e7062e7fb705d84e3f3094d081'
    'b0562ec86e51da42fe8985058b66d82e215e28c64f8df8a2141eb26f738603256bd9d88475c32efd4447ff4040917309de1ebc0b6e7de341475b1a260f0be242'
    '58814bf283e3a551f068ae9abbc196e6f393377d806a46802c8e771ffa97b2640010675408877a4052a2989576f31ce88aa47a8c2c4b282e71f6716fdf8e5ae6'
)

# Download manager function for gog icons
icon_dl(){
  icon_url=$(/usr/bin/lgogdownloader --game "${_gog_gamename}" --list-details | grep "icon: http" | cut -d " " -f 2)
  /usr/bin/wget $icon_url -O ${_gog_iconpath}
}

# Export inline function to be callable outside of local script
_gog_gamename=$_gamename
_gog_iconpath="${pkgname#gog-}.png"
export -f icon_dl
export _gog_gamename
export _gog_iconpath

DLAGENTS+=('gogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')
DLAGENTS+=("gogicon::/usr/bin/bash -c 'icon_dl'")

# Prevent compressing final package
PKGEXT='.pkg.tar'

prepare() {
    cd "${srcdir}"
    innoextract -c -m --progress=1 "setup_jazz_jackrabbit_2_${_gogver}_(${_gogrel}).exe"
}

package() {
    msg2 'Querying GOG ID'
    _gog_id="$( innoextract -s --gog-game-id "setup_jazz_jackrabbit_2_${_gogver}_(${_gogrel}).exe")"

    msg2 'Packaging game icon'
    install -Dm644 -T "${srcdir}/${pkgname#gog-}.png" "${pkgdir}/usr/share/pixmaps/${pkgname#gog-}.png"
    
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
