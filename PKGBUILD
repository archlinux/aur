# Maintainer: John-Michael Mulesa <jmulesa at gmail dot com>
# Contributor: kyndair <kyndair at gmail dot com>

pkgname=quake4-data-gog
_pkgname=quake4
pkgver=1
_pkgver="1.4.3_lang_update_(63131)"
pkgrel=3
pkgdesc="Quake 4 data via GOG"
arch=('any')
url="https://www.gog.com/game/quake_4"
license=('custom')
makedepends=('innoextract' 'icoutils')
provides=('quake4-data')
conflicts=('quake4-data-steam')
source=("setup_quake_iv_${_pkgver}.exe::gogdownloader://quake_4_game/en1installer0"
        "setup_quake_iv_${_pkgver}-1.bin::gogdownloader://quake_4_game/en1installer1")
sha256sums=('b0602978c112116377094c45aa26eb51753bcad4bda8fe3f1016118c154bc8f5'
            'd3870c9dd56a5189acda1330b76d21897a5dcd515880a888586380f4ea2e5ea7')

# If you want to use lgogdownloader add the following to /etc/makepkg.conf
# DLAGENTS+=('gogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')
DLAGENTS+=("gogdownloader::/usr/bin/echo Could not find gog installer file (%u). Manually download it to \"$(pwd)\", or set up a gogdownloader:// DLAGENT in /etc/makepkg.conf. See PKGBUILD for example.")

prepare() {
    innoextract -s "setup_quake_iv_${_pkgver}.exe"
    icotool -x -o . app/goggame-*.ico
}

package() {
    mkdir -p $pkgdir/opt/${_pkgname}/q4base

    # install game icon
    install -Dm644 "${srcdir}/goggame-1836059896_6_128x128x32.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}-gog.png"

    # install data packs
    install -D -m 644 $srcdir/q4base/pak0{01..12}.pk4 $pkgdir/opt/${_pkgname}/q4base/
    install -D -m 644 $srcdir/q4base/zpak*h.pk4 $pkgdir/opt/${_pkgname}/q4base/
}
