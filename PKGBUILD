# Maintainer: kyndair <kyndair at gmail dot com>
# Place the gog installation file in the same folder as this PKGBUILD
pkgname=humble-tangledeep
_pkgname=tangledeep
pkgver=1.36b
pkgrel=1
pkgdesc="Trapped in underground villages with no memory of the world at the surface, you must survive an ever-changing labyrinth to discover what lies above."
arch=('i686' 'pentium4' 'x86_64')
url="https://www.humblebundle.com/store/${_pkgname}"
license=('custom')
provides=('tangledeep')
conflicts=('gog-tangledeep')
source=("Tangledeep_136b_LinuxUniversal.zip::humble://Tangledeep_136b_LinuxUniversal.zip"
        "${_pkgname}.desktop")
# don't download anything via makepkg
DLAGENTS+=("humble::/usr/bin/perl -E print\(\"${RED}\"\ .\ substr\(\"%u\",\ 6\)\ .\ \"\ not\ found.\ \ Check\ the\ PKGBUILD\ for\ further\ information.${ALL_OFF}\\\\n\"\)\;\ exit\ 1")
sha256sums=('a5f6da0742e7189d27c902cc8e040a9f6db4758f8ec08707840241c4bf409d7b'
            '13b1809ed2232f90fece7e46dae5d7f1d0dd983e0997501316f9e57703553fd4')
noextract=("${_pkgname}.desktop")

package() {
    # install launcher
    install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    # install game icon
    install -Dm644 "${srcdir}/linuxuniversal/Tangledeep_Data/Resources/UnityPlayer.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
    # set the correct permissions and move the game data into pkg
    mkdir "${pkgdir}/opt"
    mkdir "${pkgdir}/opt/${_pkgname}"
    find "${srcdir}/linuxuniversal/Tangledeep_Data" -type d -exec chmod 755 {} +
    find "${srcdir}/linuxuniversal/Tangledeep_Data" -type f -exec chmod 644 {} +
    mv "${srcdir}/linuxuniversal/Tangledeep_Data" "${pkgdir}/opt/${_pkgname}"
    # remove unneeded libraries and install correct executable
    if [[ "$CARCH" == "x86_64" ]]; then
        rm -r "${pkgdir}/opt/${_pkgname}/Tangledeep_Data/MonoBleedingEdge/x86"
        rm -r "${pkgdir}/opt/${_pkgname}/Tangledeep_Data/Plugins/x86"
        install -Dm755 "${srcdir}/linuxuniversal/Tangledeep.x86_64" "${pkgdir}/opt/${_pkgname}/Tangledeep"
    else
        rm -r "${pkgdir}/opt/${_pkgname}/Tangledeep_Data/MonoBleedingEdge/x86_64"
        rm -r "${pkgdir}/opt/${_pkgname}/Tangledeep_Data/Plugins/x86_64"
        install -Dm755 "${srcdir}/linuxuniversal/Tangledeep.x86" "${pkgdir}/opt/${_pkgname}/Tangledeep"
    fi
    # link executable in /usr/bin
    mkdir "${pkgdir}/usr/bin"
    ln -s /opt/${_pkgname}/Tangledeep "${pkgdir}/usr/bin/Tangledeep"
}
