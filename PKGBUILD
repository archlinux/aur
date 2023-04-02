# Maintainer: kyndair <kyndair at gmail dot com>
# Place the gog installation file in the same folder as this PKGBUILD
pkgname=gog-pathfinder_kingmaker
_pkgname=pathfinder_kingmaker
_goggame=1982293831
pkgver=2.1.5d
_pkgver=2_1_5d
_build=41987
pkgrel=2
pkgdesc="Explore the Stolen Lands, a region that has been contested territory for centuries. Hundreds of kingdoms have risen and fallen in these lands, and now it is time for you to make your mark by building your own kingdom!"
arch=('x86_64')
url="https://www.gog.com/en/game/pathfinder_kingmaker_explorer_edition"
license=('custom')
makedepends=('gogextract')
source=("${_pkgname}_${_pkgver}_${_build}.sh::gog://${_pkgname}_${_pkgver}_${_build}.sh"
        "${_pkgname}.desktop")
# don't download anything automatically
DLAGENTS+=("gog::/usr/bin/perl -E print\(\"${RED}\"\ .\ substr\(\"%u\",\ 6\)\ .\ \"\ not\ found.\ \ Check\ the\ PKGBUILD\ for\ further\ information.${ALL_OFF}\\\\n\"\)\;\ exit\ 1")
sha256sums=('2af0ace90faf3d3d557e51e975c9519107ccb5dac966d449ba74a2501641455c'
            '25015b70ee3ea11a524aa70649157301bba759a761ecf15059381141156d5e12')
noextract=("${_pkgname}_${_pkgver}_${_build}.sh"
        "${_pkgname}.desktop")
options=("!strip")

prepare() {
    chmod +x ${_pkgname}_${_pkgver}_${_build}.sh
    ./${_pkgname}_${_pkgver}_${_build}.sh -- --silent --destination=${srcdir}
}

package() {
    # install launcher
    install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    # install game icon
    install -Dm644 "${srcdir}/support/icon.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
    # install game documents
    install -Dm644 "${srcdir}/docs/End User License Agreement.txt" "${pkgdir}/usr/share/doc/${_pkgname}/EULA"
    install -Dm644 "${srcdir}/docs/installer_readme.txt" "${pkgdir}/usr/share/doc/${_pkgname}/installer.readme"
    # install game data, executable and link in /usr/bin
    find "${srcdir}/game" -type d -exec chmod 755 {} +
    find "${srcdir}/game" -type f -exec chmod 644 {} +
    mkdir -p "${pkgdir}/opt/${_pkgname}"
    mv "${srcdir}/game/"* "${pkgdir}/opt/${_pkgname}"
    chmod 755 "${pkgdir}/opt/${_pkgname}/Kingmaker.exe"
    mkdir -p "${pkgdir}/usr/bin"
    ln -s /opt/${_pkgname}/Kingmaker.exe "${pkgdir}/usr/bin/${_pkgname}"
}
