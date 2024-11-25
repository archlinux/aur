# Maintainer: kyndair <kyndair at gmail dot com>
# Place the gog installation file in the same folder as this PKGBUILD
# the installer will warn that the folder may not be correct, this can be ignored
pkgname=gog-x4_cradle_of_humanity
_dlcparent=x4_foundations
_pkgname=x4_cradle_of_humanity
pkgver=7.10_hotfix_3
_pkgver=7_10_hotfix_3
_build=76760
pkgrel=1
pkgdesc="DLC for the $(echo ${_dlcparent} | sed 's/_/ /g') game."
arch=('x86_64')
url="https://www.gog.com/en/game/${_pkgname}"
license=('custom')
depends=($(echo gog-${_dlcparent}))
source=("${_pkgname}_${_pkgver}_${_build}.sh::gog://${_pkgname}_${_pkgver}_${_build}.sh")
# don't download anything via makepkg
DLAGENTS+=("gog::/usr/bin/perl -E print\(\"${RED}\"\ .\ substr\(\"%u\",\ 6\)\ .\ \"\ not\ found.\ \ Check\ the\ PKGBUILD\ for\ further\ information.${ALL_OFF}\\\\n\"\)\;\ exit\ 1")
sha256sums=('1b725dad05d9eaffc78c729230db63e483886e507bd8648fc8a8639a3e7d40f0')
noextract=("${_pkgname}_${_pkgver}_${_build}.sh")
options=("!strip")

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
    mv "${srcdir}/game/extensions" "${pkgdir}/opt/${_dlcparent}"
    mv "${srcdir}/game/__game/"* "${pkgdir}/opt/${_dlcparent}"
}
