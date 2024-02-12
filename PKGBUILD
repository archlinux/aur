# Maintainer: kyndair <kyndair at gmail dot com>
# Place the gog installation file in the same folder as this PKGBUILD
# the installer will warn that the folder may not be correct, this can be ignored
pkgname=gog-surviving_mars_space_race
_dlcparent=surviving_mars
_pkgname=surviving_mars_space_race
pkgver=1.5_fuglesang_1011166
_pkgver=1_5_fuglesang_1011166
_build=55908
pkgrel=1
pkgdesc="DLC for the $(echo ${_dlcparent} | sed 's/_/ /g') game."
arch=('x86_64')
url="https://www.gog.com/en/game/${_pkgname}"
license=('custom')
depends=($(echo gog-${_dlcparent}))
source=("${_pkgname}_${_pkgver}_${_build}.sh::gog://${_pkgname}_${_pkgver}_${_build}.sh")
# don't download anything via makepkg
DLAGENTS+=("gog::/usr/bin/perl -E print\(\"${RED}\"\ .\ substr\(\"%u\",\ 6\)\ .\ \"\ not\ found.\ \ Check\ the\ PKGBUILD\ for\ further\ information.${ALL_OFF}\\\\n\"\)\;\ exit\ 1")
sha256sums=('7e497743e1027f8d0ddeac8cec70c23ca09b9697a8750cc6d04b8f4057609191')
noextract=("${_pkgname}_${_pkgver}_${_build}.sh")

prepare() {
    chmod +x ${_pkgname}_${_pkgver}_${_build}.sh
    ./${_pkgname}_${_pkgver}_${_build}.sh -- --silent --destination="${srcdir}"
}

package() {
    # install game documents
    install -Dm644 "${srcdir}/docs/"*"/End User License Agreement.txt" "${pkgdir}/usr/share/doc/${_pkgname}/EULA"
    install -Dm644 "${srcdir}/docs/"*"/installer_readme.txt" "${pkgdir}/usr/share/doc/${_pkgname}/installer.readme"
    # install game data, executable and link in /usr/bin
    find "${srcdir}/game" -type d -exec chmod 755 {} +
    find "${srcdir}/game" -type f -exec chmod 644 {} +
    mkdir -p "${pkgdir}/opt/${_dlcparent}"
    mv "${srcdir}/game/"* "${pkgdir}/opt/${_dlcparent}"
}
