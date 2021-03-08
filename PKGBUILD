# Maintainer: kyndair <kyndair at gmail dot com>
# Place the gog installation file in the same folder as this PKGBUILD
pkgname=rtcw-data-gog
_pkgname=return_to_castle_wolfenstein
pkgver=1.41
_build=2.0.0.2
pkgrel=1
pkgdesc="Return to Castle Wolfenstein - extracts required game data from the gog windows installer"
arch=('any')
url="https://www.gog.com/game/${_pkgname}"
license=('custom')
makedepends=('innoextract' 'icoutils')
provides=('rtcw-data')
conflicts=('rtcw-data-cd')
source=("setup_${_pkgname}_${_build}.exe::gog://setup_${_pkgname}_${_build}.exe"
        'rtcw-help.patch')
# don't download anything automatically
DLAGENTS+=("gog::/usr/bin/perl -E print\(\"${RED}\"\ .\ substr\(\"%u\",\ 6\)\ .\ \"\ not\ found.\ \ Check\ the\ PKGBUILD\ for\ further\ information.${ALL_OFF}\\\\n\"\)\;\ exit\ 1")
sha256sums=('ffadfd2e2101d5dddbf1a91a9f65fe50a9b2c148e71dc51fca0ddf0f907d484e'
            '1a5b1e54772333b7e736ba3138277094390820590408efbaa431e52655feed90')
noextract=("setup_${_pkgname}_${_build}.exe")

prepare() {
    innoextract -s "setup_${_pkgname}_${_build}.exe"
    wrestool -x -t -14 -o . app/WolfSP.exe
    wrestool -x -t -14 -o . app/WolfMP.exe
    icotool -x -o . app/goggame-1441704976.ico
    icotool -x -o . *.ico
    patch --binary -p1 < "${srcdir}/rtcw-help.patch"
    if [ -e "${srcdir}/app/Docs/Help/index.htm.orig" ]; then
        rm "${srcdir}/app/Docs/Help/index.htm.orig"
    fi
}

package() {
    # install game icons
    install -Dm644 "${srcdir}/goggame-1441704976_1_256x256x32.png" "${pkgdir}/usr/share/pixmaps/rtcw-gog.png"
    install -Dm644 "${srcdir}/WolfSP.exe_14_1_3_128x128x8.png" "${pkgdir}/usr/share/pixmaps/rtcwsp-id.png"
    install -Dm644 "${srcdir}/WolfMP.exe_14_1_1_32x32x8.png" "${pkgdir}/usr/share/pixmaps/rtcwmp-id.png"
    # install game documents
    install -Dm644 "${srcdir}/app/Docs/readme.txt" "${pkgdir}/usr/share/doc/${_pkgname}/readme.txt"
    find "${srcdir}/app/Docs/Help" -type d -exec chmod 755 {} +
    find "${srcdir}/app/Docs/Help" -type f -exec chmod 644 {} +
    mv "${srcdir}/app/Docs/Help" "${pkgdir}/usr/share/doc/${_pkgname}"
    # install gog & id software licenses
    install -Dm644 "${srcdir}/tmp/GOG_EULA.txt"  "${pkgdir}/usr/share/licenses/${_pkgname}/gog-eula.txt"
    install -Dm644 "${srcdir}/app/Docs/License.rtf"  "${pkgdir}/usr/share/licenses/${_pkgname}/id-license.rtf"
    # install rtcw single player and multiplayer data packs
    install -Dm644 "${srcdir}/app/Main/sp_pak3.pk3" "${pkgdir}/opt/${_pkgname}/main/en_pak3.pk3"
    install -Dm644 "${srcdir}/app/Main/"*.pk3 "${pkgdir}/opt/${_pkgname}/main/"
    install -Dm644 "${srcdir}/app/Main/scripts/translation.cfg" "${pkgdir}/opt/${_pkgname}/main/scripts/translation.cfg"
}
