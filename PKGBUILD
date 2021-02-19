# Maintainer: kyndair <kyndair at gmail dot com>
# Place the gog installation file in the same folder as this PKGBUILD
pkgname=gog-battletech
_pkgname=battletech
pkgver=1.9.1.686r
_pkgver=1_9_1_686r
_build=36568
_goggame=1482783682
pkgrel=1
pkgdesc="The year is 3025 and the galaxy is trapped in a cycle of perpetual war, fought with enormous mechanized vehicles called BattleMechs."
arch=('x86_64')
url="https://www.gog.com/game/battletech_game"
license=('custom')
makedepends=('p7zip')
source=("${_pkgname}_${_pkgver}_${_build}.sh::gog://${_pkgname}_${_pkgver}_${_build}.sh"
        "${_pkgname}.desktop")
# don't download anything automatically
DLAGENTS+=("gog::/usr/bin/perl -E print\(\"${RED}\"\ .\ substr\(\"%u\",\ 6\)\ .\ \"\ not\ found.\ \ Check\ the\ PKGBUILD\ for\ further\ information.${ALL_OFF}\\\\n\"\)\;\ exit\ 1")
sha256sums=('a30d90de5969c9880c352824242d9299a1eb2d7e6fb2d385a3d18aecfafd8751'
            '3b11f1ed7e20c62154699541dc7d4039057702d321dbeac185c80b2efce6d2c6')
noextract=("${_pkgname}_${_pkgver}_${_build}.sh"
        "${_pkgname}.desktop")

prepare() {
    7z x -tzip -y ${_pkgname}_${_pkgver}_${_build}.sh
}

package() {
    # install launcher
    install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    # install game icon
    install -Dm644 "${srcdir}/data/noarch/support/icon.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
    # install goggame files
    install -Dm644 "${srcdir}/data/noarch/game/goggame-${_goggame}.hashdb" "${pkgdir}/opt/${_pkgname}/goggame-${_goggame}.hashdb"
    install -Dm644 "${srcdir}/data/noarch/game/goggame-${_goggame}.info" "${pkgdir}/opt/${_pkgname}/goggame-${_goggame}.info"
    # set the correct permissions and move the game data into pkg
    find "${srcdir}/data/noarch/game/BattleTech_Data" -type d -exec chmod 755 {} +
    find "${srcdir}/data/noarch/game/BattleTech_Data" -type f -exec chmod 644 {} +
    mv "${srcdir}/data/noarch/game/BattleTech_Data" "${pkgdir}/opt/${_pkgname}"
    # install executable and link in /usr/bin
    install -Dm755 "${srcdir}/data/noarch/game/BattleTech" "${pkgdir}/opt/${_pkgname}/BattleTech"
    mkdir "${pkgdir}/usr/bin"
    ln -s /opt/${_pkgname}/BattleTech "${pkgdir}/usr/bin/${_pkgname}"
}
