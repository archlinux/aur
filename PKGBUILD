# Maintainer: John-Michael Mulesa <jmulesa [at] gmail.com>

pkgname=codghosts-wine-steam
_pkgname=codghosts
pkgver=1.18
pkgrel=1
_steamid=209170
arch=('x86_64')
makedepends=('steamcmd' 'icoutils')
depends=('wine' 'winetricks')
source=("${_pkgname}.sh" "${_pkgname}.desktop" "https://github.com/XLabsProject/iw6x-client/releases/download/v2.0.2/iw6x-v2.0.2.zip"
        "Goldberg_Lan_Steam_Emu_master--a24a9c26.zip::https://gitlab.com/Mr_Goldberg/goldberg_emulator/-/jobs/1590301114/artifacts/download")
pkgdesc="Call of Duty: Ghosts using WINE with data via Steam"
license=('custom')
url='https://store.steampowered.com/app/209160/Call_of_Duty_Ghosts/'
sha256sums=('1a93d386ae13d174e9be41fbe08e1d11db252a353e30df23338e17eb3ff8976f'
            '4994037527dda02cf2dcf70de80c2069a15ee5a309ef708fe23b2a0fa904399b'
            'c1a151c025ef67acfbd32c802fa18e7461444c62e356b72dd893ac196c62ed17'
            '3bfe422a3daf85a02fe6458e4351a4f40f29f513ec8df2c838c7e197844e51cb')

prepare() {
    mkdir -p $srcdir/${_pkgname}

    # Use steamcmd to get data.
    printf "Enter your Steam username:"
    read steam_username
    steamcmd +@sSteamCmdForcePlatformType windows +@ShutdownOnFailedCommand 1 +force_install_dir $srcdir/${_pkgname} +login $steam_username "+app_update ${_steamid} validate" +quit
    wrestool -x -t -14 -o . ${_pkgname}/iw6mp64_ship.exe
    icotool -x -o . *.ico
}

package() {
    mkdir -p $pkgdir/opt/${_pkgname}

    # Move required files to pkgdir
    cp -r $srcdir/${_pkgname}/* $pkgdir/opt/${_pkgname}/
    rm -rf $pkgdir/opt/${_pkgname}/steamapps
    rm $pkgdir/opt/${_pkgname}/*.vdf
    $srcdir/linux/tools/find_interfaces.sh $pkgdir/opt/${_pkgname}/steam_api64.dll > $pkgdir/opt/${_pkgname}/steam_interfaces.txt || true
    cp $srcdir/steam_api64.dll $pkgdir/opt/${_pkgname}/
    echo "${_steamid}" > $pkgdir/opt/${_pkgname}/steam_appid.txt
    cp $srcdir/iw6x.exe $pkgdir/opt/${_pkgname}/ 

    # Required for player profiles.
    chmod o+w $pkgdir/opt/${_pkgname}

    # Install desktop file.
    install -D -m 644 $srcdir/${_pkgname}.desktop \
             $pkgdir/usr/share/applications/${_pkgname}.desktop

    # Install icon file.
    install -D -m 644 $srcdir/iw6mp64_ship.exe_*_256x256x32.png \
             $pkgdir/usr/share/pixmaps/${_pkgname}.png

    # Install bash startup script.
    install -D -m 755 $srcdir/${_pkgname}.sh \
             $pkgdir/usr/bin/${_pkgname}
}
