# Maintainer: kyndair <kyndair at gmail dot com>
# Place the gog installation file in the same folder as this PKGBUILD
pkgname=gog-x4_foundations
_pkgname=x4_foundations
_goggame=1588366064
pkgver=7.10_hotfix_3
_pkgver=7_10_hotfix_3
_build=76760
pkgrel=1
pkgdesc="X4 is a living, breathing space sandbox running entirely on your PC."
arch=('x86_64')
url="https://www.gog.com/en/game/${_pkgname}"
license=('custom')
depends=('glibc' 'bzip2' 'gcc-libs' 'vulkan-icd-loader' 'libx11' 'util-linux-libs')
source=("${_pkgname}_${_pkgver}_${_build}.sh::gog://${_pkgname}_${_pkgver}_${_build}.sh"
    "${_pkgname}.desktop")
# don't download anything automatically
DLAGENTS+=("gog::/usr/bin/perl -E print\(\"${RED}\"\ .\ substr\(\"%u\",\ 6\)\ .\ \"\ not\ found.\ \ Check\ the\ PKGBUILD\ for\ further\ information.${ALL_OFF}\\\\n\"\)\;\ exit\ 1")
sha256sums=('fbe9fa423757c526d86ce74aceb87f169fe9059963f91510901368989fef04dd'
    '0ed55646207b2970dda3face988057ff56ed20613b961fa36a929d37675083a5')
noextract=("${_pkgname}_${_pkgver}_${_build}.sh"
    "${_pkgname}.desktop")
options=("!strip")

prepare() {
    chmod +x ${_pkgname}_${_pkgver}_${_build}.sh
    ./${_pkgname}_${_pkgver}_${_build}.sh -- --silent --skipprompt --skipeulas --skipreadmes --destination="${srcdir}"
}

package() {
    # install launcher
    install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    # install game icon
    install -Dm644 "${srcdir}/support/icon.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
    # install game documents
    install -Dm644 "${srcdir}/docs/End User License Agreement.txt" "${pkgdir}/usr/share/doc/${_pkgname}/EULA"
    install -Dm644 "${srcdir}/docs/installer_readme.txt" "${pkgdir}/usr/share/doc/${_pkgname}/installer.readme"
    install -Dm644 "${srcdir}/game/licences.txt" "${pkgdir}/usr/share/doc/${_pkgname}/licences"
    # install game data, executable and link in /usr/bin if required
    find "${srcdir}/game" -type d -exec chmod 755 {} +
    find "${srcdir}/game" -type f -exec chmod 644 {} +
    mkdir -p "${pkgdir}/opt/${_pkgname}"
    mv "${srcdir}/game/"* "${pkgdir}/opt/${_pkgname}"
    chmod 755 "${pkgdir}/opt/${_pkgname}/testandlaunch"
    chmod 755 "${pkgdir}/opt/${_pkgname}/testcommon"
    chmod 755 "${pkgdir}/opt/${_pkgname}/X4"
}
