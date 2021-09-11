# Maintainer: John-Michael Mulesa <jmulesa at gmail dot com>

pkgname=flatout2-wine-gog
_pkgname=flatout2
pkgver=1.2
_pkgver=2.1.0.9
pkgrel=2
pkgdesc="FlatOut 2 using WINE with data via GOG"
arch=('i686' 'x86_64')
url="https://www.gog.com/game/flatout_2"
license=('custom')
makedepends=('innoextract' 'icoutils')
install=flatout2.install
source=("setup_${_pkgname}_${_pkgver}.exe::gogdownloader://flatout_2/en1installer1"
        "setup_${_pkgname}_${_pkgver}.bin::gogdownloader://flatout_2/en1installer2"
        "${_pkgname}.desktop" "${_pkgname}.sh")
sha256sums=('b13e87de2e7386a120cd6dfc194e6e9a6bd522fe51fb8a7ad3faad6ab0475df9'
            '9d488e515d6e529127a695998c92fdbfd6d94f4cb35919776116ff4ab073e683'
            '866f48abcb74e0f3196c0ec5e37a80fc0e5144dc7ac5c40ab941bd685888ff36'
            '609bb031cf4b3786f608509968e7d9735861735a0fef35dc45b1fa27bff9958f')

# If you want to use lgogdownloader add the following to /etc/makepkg.conf
# DLAGENTS+=('goggogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')
DLAGENTS+=("gogdownloader::/usr/bin/echo Could not find gog installer file (%u). Manually download it to \"$(pwd)\", or set up a gogdownloader:// DLAGENT in /etc/makepkg.conf. See PKGBUILD for example.")

prepare() {
    innoextract --gog -s "setup_${_pkgname}_${_pkgver}.exe"
    icotool -x -o . game/goggame-*.ico
}

package() {
    mkdir -p $pkgdir/opt/${_pkgname}

    # Install game icon.
    install -Dm644 "${srcdir}/goggame-1207660523_6_256x256x32.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}-gog.png"

    # Install game data.
    cp -r $srcdir/game/* $pkgdir/opt/${_pkgname}/

    # Install desktop file.
    install -D -m 644 $srcdir/${_pkgname}.desktop \
             $pkgdir/usr/share/applications/${_pkgname}.desktop

    # Install bash startup script.
    install -D -m 755 $srcdir/${_pkgname}.sh \
             $pkgdir/usr/bin/${_pkgname}
}
