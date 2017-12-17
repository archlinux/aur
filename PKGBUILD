# Maintainer: Oystein Sture <oysstu ät gmail dõt cóm>
# Contributor:

pkgname=gog-jazz-jackrabbit-2-christmas-chronicles
_gogver=1.2x
_gogrel=16742
_gamename=${pkgname#gog-}
_gamename=${_gamename//-/_}

pkgver=${_gogver}_${_gogrel}
pkgrel=1
pkgdesc='Jazz Jackrabbit 2 Collection. GOG version (Wine).'
arch=('x86_64')
url='https://www.gog.com/game/jazz_jackrabbit_2_collection'
license=('custom')  # Game does not come with a license file
depends=('wine')
makedepends=('lgogdownloader>=2.25' 'wget' 'grep' 'coreutils')

source=(
    "setup_jazz_jackrabbit_2_cc_${_gogver}_(${_gogrel}).exe::gogdownloader://${_gamename}/en1installer0"
    "${pkgname#gog-}.png"::gogicon://${_gamename}
    "${pkgname#gog-}.bash"
    "${pkgname#gog-}.desktop"
)

sha512sums=(
    'fafce9bb318903970b8ba8e3c08cd261c748180158c162db4f67408d12b436a1a091b2423e2df0859e6c65df5ffe1e7e07d370089b6ebf70f8fc32ff5c260a86'
    '5c91782b50c53b04a4d11931da34136fbb79e2fe5fd3e77cbb43c4b8ff3e5e84975e2c4b8a9fc1f12aeaed96d265342c87b75e0700ac6dd5ad62ba805fc7ed81'
    '641d3cc6afe3d4863f0f4fa7928b595bbba34a05eb583d796c5a6f1daf8177d1fa93a651be0622ab70001f35b7c5a58ae4dcd10b189cc6756637dc65ad0a88ec'
    'f6193a29364d4dd07c224596c6a5da6115aed322fa768db430a95e491656473fa805c969e7d97957938b0ad16ed40d93e1e54bc5507882e7b71e686a7e9a902d'
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
    innoextract -c -m --progress=1 "setup_jazz_jackrabbit_2_cc_${_gogver}_(${_gogrel}).exe"
}

package() {
    msg2 'Packaging game icon'
    install -Dm644 -T "${srcdir}/${pkgname#gog-}.png" "${pkgdir}/usr/share/pixmaps/${pkgname#gog-}.png"
  
    msg2 'Packaging game data'
    mkdir -p "${pkgdir}/opt/${pkgname}"
    mv -T "${srcdir}/app/" "${pkgdir}/opt/${pkgname}"

    msg2 'Packaging launcher'
    install -Dm755 -T "${srcdir}/${pkgname#gog-}.bash" "${pkgdir}/usr/bin/${pkgname#gog-}"
    
    msg2 'Packaging desktop shortcut'
    install -Dm644 "${srcdir}/${pkgname#gog-}.desktop" "${pkgdir}/usr/share/applications/${pkgname#gog-}.desktop"
}
