# Maintainer: kyndair <kyndair at gmail dot com>
# Place the gog installation file in the same folder as this PKGBUILD
pkgname=gog-pillars_of_eternity_ii_deadfire
_pkgname=pillars_of_eternity_ii_deadfire
pkgver=5.0.0.0040
_pkgver=v5_0_0_0040
_build=29222
pkgrel=1
pkgdesc="Pursue a rogue god over land and sea in the sequel to the RPG Pillars of Eternity"
arch=('x86_64')
url="https://www.gog.com/en/game/pillars_of_eternity_ii_deadfire_obsidian_edition_release"
license=('custom')
makedepends=('gogextract')
source=("${_pkgname}_${_pkgver}_${_build}.sh::gog://${_pkgname}_${_pkgver}_${_build}.sh"
        "${_pkgname}.desktop")
# don't download anything automatically
DLAGENTS+=("gog::/usr/bin/perl -E print\(\"${RED}\"\ .\ substr\(\"%u\",\ 6\)\ .\ \"\ not\ found.\ \ Check\ the\ PKGBUILD\ for\ further\ information.${ALL_OFF}\\\\n\"\)\;\ exit\ 1")
sha256sums=('e976deeeacb2b9ef24c4eb8a081ee4f3b9ade5cbeaff452bf742ac16ec212998'
            '95edb413c00dbf8f1390440912acfe89ac160912004d6655810fdb300c99660d')

prepare() {
    gogextract ${_pkgname}_${_pkgver}_${_build}.sh
    bsdtar -xf data.zip
}

package() {
    # install launcher
    install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    # install game icon
    install -Dm644 "${srcdir}/data/noarch/support/icon.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
    # install game documents
    find "${srcdir}/data/noarch/game/Docs" -type d -exec chmod 755 {} +
    find "${srcdir}/data/noarch/game/Docs" -type f -exec chmod 644 {} +
    mkdir -p "${pkgdir}/usr/share/doc/${_pkgname}"
    mv "${srcdir}/data/noarch/game/Docs/"* "${pkgdir}/usr/share/doc/${_pkgname}"
    # set the correct permissions and move the game data into pkg
    find "${srcdir}/data/noarch/game/PillarsOfEternityII_Data" -type d -exec chmod 755 {} +
    find "${srcdir}/data/noarch/game/PillarsOfEternityII_Data" -type f -exec chmod 644 {} +
    mkdir -p "${pkgdir}/opt/${_pkgname}"
    mv "${srcdir}/data/noarch/game/PillarsOfEternityII_Data" "${pkgdir}/opt/${_pkgname}"
    # install executable and link in /usr/bin
    install -Dm755 "${srcdir}/data/noarch/game/PillarsOfEternityII" "${pkgdir}/opt/${_pkgname}/PillarsOfEternityII"
    install -Dm644 "${srcdir}/data/noarch/game/Galaxy64.dll" "${pkgdir}/opt/${_pkgname}/Galaxy64.dll"
    install -Dm644 "${srcdir}/data/noarch/game/GalaxyCSharpGlue.dll" "${pkgdir}/opt/${_pkgname}/GalaxyCSharpGlue.dll"
    install -Dm644 "${srcdir}/data/noarch/game/GalaxyPeer64.dll" "${pkgdir}/opt/${_pkgname}/GalaxyPeer64.dll"
    mkdir -p "${pkgdir}/usr/bin"
    ln -s /opt/${_pkgname}/PillarsOfEternityII "${pkgdir}/usr/bin/${_pkgname}"
}
