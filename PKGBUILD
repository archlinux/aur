# Maintainer: kyndair <kyndair at gmail dot com>
# Place the gog installation file in the same folder as this PKGBUILD
pkgname=gog-surviving_mars
_pkgname=surviving_mars
_goggame=2129244347
pkgver=1.5_fuglesang_1011166
_pkgver=1_5_fuglesang_1011166
_build=55908
pkgrel=1
pkgdesc="Stake your claim on the Red Planet and build the first functioning human colonies on Mars!"
arch=('x86_64')
url="https://www.gog.com/en/game/surviving_mars"
license=('custom')
source=("${_pkgname}_${_pkgver}_${_build}.sh::gog://${_pkgname}_${_pkgver}_${_build}.sh"
        "${_pkgname}.desktop")
# don't download anything automatically
DLAGENTS+=("gog::/usr/bin/perl -E print\(\"${RED}\"\ .\ substr\(\"%u\",\ 6\)\ .\ \"\ not\ found.\ \ Check\ the\ PKGBUILD\ for\ further\ information.${ALL_OFF}\\\\n\"\)\;\ exit\ 1")
sha256sums=('5f266336d76a639017dc1391459e4d85f679d08db79d80e74436ff843b1021d7'
            '31fbb9c2de56494bfcbee6b3c431c63f18093851ff33a65c0e0ed593622fa546')
noextract=("${_pkgname}_${_pkgver}_${_build}.sh"
        "${_pkgname}.desktop")
options=("!strip")

prepare() {
    chmod +x ${_pkgname}_${_pkgver}_${_build}.sh
    ./${_pkgname}_${_pkgver}_${_build}.sh -- --silent --destination="${srcdir}"
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
    chmod 755 "${pkgdir}/opt/${_pkgname}/MarsGOG"
}
