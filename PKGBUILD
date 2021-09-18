# Maintainer: John-Michael Mulesa <jmulesa [at] gmail.com>

pkgname=dirt3-wine-steam
_pkgname=dirt3
pkgver=1.2
pkgrel=1
arch=('i686' 'x86_64')
makedepends=('steamcmd' 'icoutils')
depends=('wine' 'winetricks')
source=("${_pkgname}.sh" "${_pkgname}.desktop"
        "Goldberg_Lan_Steam_Emu_master--a24a9c26.zip::https://gitlab.com/Mr_Goldberg/goldberg_emulator/-/jobs/1590301114/artifacts/download")
pkgdesc="DiRT 3 Complete Edition using WINE with data via Steam"
license=('custom')
install=dirt3.install
url='https://steamdb.info/app/321040/'
sha256sums=('be6a230f3b9ab47988ed51ed5adf400c404c70448a977b929769c54d4974642c'
            '2637145ea2d9d736330fae8207015bc6c231d58f36131898d5e622de8658f92a'
            '3bfe422a3daf85a02fe6458e4351a4f40f29f513ec8df2c838c7e197844e51cb')

prepare() {
    mkdir -p $srcdir/${_pkgname}

    # Use steamcmd to get data.
    printf "Enter your Steam username:"
    read steam_username
    steamcmd +@sSteamCmdForcePlatformType windows +@ShutdownOnFailedCommand 1 +force_install_dir $srcdir/${_pkgname} +login $steam_username "+app_update 321040 validate" +quit
    wrestool -x -t -14 -o . ${_pkgname}/${_pkgname}_game.exe
    icotool -x -o . *.ico
}

package() {
    mkdir -p $pkgdir/opt/${_pkgname}

    # Move required files to pkgdir
    cp -r $srcdir/${_pkgname}/* $pkgdir/opt/${_pkgname}/
    rm -rf $pkgdir/opt/${_pkgname}/steamapps
    $srcdir/linux/tools/find_interfaces.sh $pkgdir/opt/${_pkgname}/steam_api.dll > $pkgdir/opt/${_pkgname}/steam_interfaces.txt || true
    cp $srcdir/steam_api.dll $pkgdir/opt/${_pkgname}/
    echo "321040" > $pkgdir/opt/${_pkgname}/steam_appid.txt

    # Install desktop file.
    install -D -m 644 $srcdir/${_pkgname}.desktop \
             $pkgdir/usr/share/applications/${_pkgname}.desktop

    # Install icon file.
    install -D -m 644 $srcdir/dirt3_game.exe_14_101_2057_1_256x256x32.png \
             $pkgdir/usr/share/pixmaps/${_pkgname}.png

    # Install bash startup script.
    install -D -m 755 $srcdir/${_pkgname}.sh \
             $pkgdir/usr/bin/${_pkgname}
}
