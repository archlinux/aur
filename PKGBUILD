# Maintainer: John-Michael Mulesa <jmulesa [at] gmail.com>

pkgname=dirt2-wine-steam
_pkgname=dirt2
pkgver=1.1
pkgrel=1
arch=('i686' 'x86_64')
makedepends=('steamcmd' 'icoutils')
depends=('wine')
source=("xlive.dll" "xlive.ini" "${_pkgname}.sh" "${_pkgname}.desktop")
pkgdesc="Colin McRae: DiRT 2 using WINE with data via Steam"
license=('custom')
install=dirt2.install
url='https://steamdb.info/app/12840/'
sha256sums=('5bbe4cd8ee97fbd22eb5ab457963db73c5d7889ba77952eea318cf2da6d934c8'
            'd4b3617b616551290c4d174f48b9b3130f35d2013cd16993208a70dc1cee213e'
            '452adc9a777431b19921c6ac7a981517340bf0cc336c1a56071a0e4cc719f6da'
            '7f32805ab9dbe118efead3ad6a3c348d061a266d7bb5b7312b7dab2127abede3')

prepare() {
    mkdir -p $srcdir/${_pkgname}

    # Use steamcmd to get data.
    printf "Enter your Steam username:"
    read steam_username
    steamcmd +@sSteamCmdForcePlatformType windows +@ShutdownOnFailedCommand 1 +force_install_dir $srcdir/${_pkgname} +login $steam_username "+app_update 12840 validate" +quit
    icotool -x -o . ${_pkgname}/*.ico
}

package() {
    mkdir -p $pkgdir/opt/${_pkgname}

    # Move required files to pkgdir
    cp -r $srcdir/${_pkgname}/* $pkgdir/opt/${_pkgname}/
    cp $srcdir/xlive.dll $pkgdir/opt/${_pkgname}/
    cp $srcdir/xlive.ini $pkgdir/opt/${_pkgname}/
    rm -rf $pkgdir/opt/${_pkgname}/steamapps
    
    # Install desktop file.
    install -D -m 644 $srcdir/${_pkgname}.desktop \
             $pkgdir/usr/share/applications/${_pkgname}.desktop

    # Install icon file.
    install -D -m 644 $srcdir/dirt2_1_256x256x32.png \
             $pkgdir/usr/share/pixmaps/${_pkgname}.png

    # Install bash startup script.
    install -D -m 755 $srcdir/${_pkgname}.sh \
             $pkgdir/usr/bin/${_pkgname}
}
