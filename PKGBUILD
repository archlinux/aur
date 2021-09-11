# Maintainer: John-Michael Mulesa <jmulesa at gmail dot com>

pkgname=grid-wine-gog
_pkgname=grid
pkgver=1.3
_pkgver="1.0_(18584)"
pkgrel=1
pkgdesc="Race Driver GRID (2008) using WINE with data via GOG"
arch=('i686' 'x86_64')
url="https://www.gog.com/forum/race_driver_grid"
license=('custom')
install=grid.install
depends=('wine')
depends_i686=('openal')
depends_x86_64=('lib32-openal')
makedepends=('innoextract' 'icoutils')
source=("setup_race_driver_${_pkgname}_${_pkgver}.exe::gogdownloader://race_driver_grid/en1installer0"
        "setup_race_driver_${_pkgname}_${_pkgver}-1.bin::gogdownloader://race_driver_grid/en1installer1"
        "setup_race_driver_${_pkgname}_${_pkgver}-2.bin::gogdownloader://race_driver_grid/en1installer2"
        "${_pkgname}.desktop" "${_pkgname}.sh" "hardware_settings_restrictions.xml")
sha256sums=('cd3484b6908f89c3b6df0bf8b75b62fced56de2458cdad184006fc72ac29324c'
            '17cbdf2d1844607bf17b678a497bbfa77c9b726b12c46e01320618e32f37eafb'
            '8d0d40d65ce960ed86ddad7bd41d9ec0e04a69f3598822694ee282ab51b3ec8e'
            '8b5e6750df1caede6213ca1cd151fa61d96856e2656ef776ce7864160969acd9'
            'a274a8674ee847d859d854c96cb715b46f53b599c172b34799461eeed76b4184'
            '05a812157a3d99608236b2e276b6d77959ed93295a7d18fad9cd242f82aa21d2')

# If you want to use lgogdownloader add the following to /etc/makepkg.conf
# DLAGENTS+=('gogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')
DLAGENTS+=("gogdownloader::/usr/bin/echo Could not find gog installer file (%u). Manually download it to \"$(pwd)\", or set up a gogdownloader:// DLAGENT in /etc/makepkg.conf. See PKGBUILD for example.")

prepare() {
    innoextract --gog -s "setup_race_driver_${_pkgname}_${_pkgver}.exe"
    icotool -x -o . app/goggame-*.ico
}

package() {
    mkdir -p $pkgdir/opt/${_pkgname}

    # Install game icon.
    install -Dm644 "${srcdir}/goggame-1207659233_6_256x256x32.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}-gog.png"

    # Install game data.
    cp -r $srcdir/app/* $pkgdir/opt/${_pkgname}/
    cp $srcdir/hardware_settings_restrictions.xml $pkgdir/opt/${_pkgname}/system/

    # Install desktop file.
    install -D -m 644 $srcdir/${_pkgname}.desktop \
             $pkgdir/usr/share/applications/${_pkgname}.desktop

    # Install bash startup script.
    install -D -m 755 $srcdir/${_pkgname}.sh \
             $pkgdir/usr/bin/${_pkgname}
}
