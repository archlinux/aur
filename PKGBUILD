# Maintainer: kyndair <kyndair at gmail dot com>
# Place the gog installation file in the same folder as this PKGBUILD
# the installer will warn that the folder may not be correct, this can be ignored
pkgname=gog-battletech-shadowhawk
_dlcparent=battletech
_pkgname=battletech_shadow_hawk_pack
pkgver=1.9.1.686r
_pkgver=1_9_1_686r
_build=36568
pkgrel=2
pkgdesc="DLC for the $(echo ${_dlcparent} | sed 's/_/ /g') game."
arch=('x86_64')
url="https://www.gog.com/en/game/battletech_shadowhawk_pack"
license=('custom')
depends=($(echo gog-${_dlcparent}))
source=("${_pkgname}_${_pkgver}_${_build}.sh::gog://${_pkgname}_${_pkgver}_${_build}.sh")
# don't download anything via makepkg
DLAGENTS+=("gog::/usr/bin/perl -E print\(\"${RED}\"\ .\ substr\(\"%u\",\ 6\)\ .\ \"\ not\ found.\ \ Check\ the\ PKGBUILD\ for\ further\ information.${ALL_OFF}\\\\n\"\)\;\ exit\ 1")
sha256sums=('ed853855ad4e1c6e5fb48c626aaef39635f4cf1f09e6b620603fded370f5c158')
noextract=("${_pkgname}_${_pkgver}_${_build}.sh")

prepare() {
    chmod +x ${_pkgname}_${_pkgver}_${_build}.sh
    ./${_pkgname}_${_pkgver}_${_build}.sh -- --silent --skipprompt --skipeulas --skipreadmes --destination="${srcdir}"
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
