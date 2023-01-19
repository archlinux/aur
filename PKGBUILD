# Maintainer: kyndair <kyndair at gmail dot com>
# Place the gog installation file in the same folder as this PKGBUILD
pkgname=gog-pillars_of_eternity
_pkgname1=pillars_of_eternity_en
_pkgname2=pillars_of_eternity
pkgver=3.07.0.1318
_pkgver=3_07_0_1318
_build=17461
pkgrel=1
pkgdesc="Come to the original and incredible world of Eora, and go on an unforgettable adventure where the choices you make and the paths you choose shape your destiny."
arch=('x86_64')
url="https://www.gog.com/en/game/pillars_of_eternity_definitive_edition"
license=('custom')
makedepends=('gogextract')
source=("${_pkgname1}_${_pkgver}_${_build}.sh::gog://${_pkgname1}_${_pkgver}_${_build}.sh"
        "${_pkgname2}.desktop")
# don't download anything automatically
DLAGENTS+=("gog::/usr/bin/perl -E print\(\"${RED}\"\ .\ substr\(\"%u\",\ 6\)\ .\ \"\ not\ found.\ \ Check\ the\ PKGBUILD\ for\ further\ information.${ALL_OFF}\\\\n\"\)\;\ exit\ 1")
sha256sums=('fcf826d65e520a74b6c52296c1ac88e540014ac1c044a8404e1f87f5766b0b79'
            '05e8bc4670cb965a2757048ffc330808725eb2da6e8648f5dd185f8ca632300a')

prepare() {
    gogextract ${_pkgname1}_${_pkgver}_${_build}.sh
    bsdtar -xf data.zip
}

package() {
    # install launcher
    install -Dm644 "${srcdir}/${_pkgname2}.desktop" "${pkgdir}/usr/share/applications/${_pkgname2}.desktop"
    # install game icon
    install -Dm644 "${srcdir}/data/noarch/support/icon.png" "${pkgdir}/usr/share/pixmaps/${_pkgname2}.png"
    # set the correct permissions and move the game data into pkg
    find "${srcdir}/data/noarch/game/PillarsOfEternity_Data" -type d -exec chmod 755 {} +
    find "${srcdir}/data/noarch/game/PillarsOfEternity_Data" -type f -exec chmod 644 {} +
    mkdir -p "${pkgdir}/opt/${_pkgname2}"
    mv "${srcdir}/data/noarch/game/PillarsOfEternity_Data" "${pkgdir}/opt/${_pkgname2}"
    # install executable and link in /usr/bin
    install -Dm755 "${srcdir}/data/noarch/game/PillarsOfEternity" "${pkgdir}/opt/${_pkgname2}/PillarsOfEternity"
    install -Dm644 "${srcdir}/data/noarch/game/Galaxy.dll" "${pkgdir}/opt/${_pkgname2}/Galaxy.dll"
    install -Dm644 "${srcdir}/data/noarch/game/GalaxyCSharpGlue.dll" "${pkgdir}/opt/${_pkgname2}/GalaxyCSharpGlue.dll"
    install -Dm644 "${srcdir}/data/noarch/game/SteamworksNative.dll" "${pkgdir}/opt/${_pkgname2}/SteamworksNative.dll"
    install -Dm644 "${srcdir}/data/noarch/game/steam_api.dll" "${pkgdir}/opt/${_pkgname2}/steam_api.dll"
    install -Dm644 "${srcdir}/data/noarch/game/steam_appid.txt" "${pkgdir}/opt/${_pkgname2}/steam_appid.txt"
    mkdir -p "${pkgdir}/usr/bin"
    ln -s /opt/${_pkgname2}/PillarsOfEternity "${pkgdir}/usr/bin/${_pkgname2}"
}
