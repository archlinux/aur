# Maintainer: John-Michael Mulesa <jmulesa [at] gmail.com>

pkgname=codaw-wine-steam
_pkgname=codaw
pkgver=1.16
pkgrel=1
_steamid=209660
arch=('x86_64')
makedepends=('steamcmd' 'icoutils')
depends=('wine' 'winetricks')
source=("${_pkgname}.sh" "${_pkgname}.desktop" "https://github.com/XLabsProject/s1x-client/releases/download/v1.0.4/s1x-v1.0.4.zip"
        "Goldberg_Lan_Steam_Emu_master--a24a9c26.zip::https://gitlab.com/Mr_Goldberg/goldberg_emulator/-/jobs/1590301114/artifacts/download")
pkgdesc="Call of Duty: Advanced Warfare using WINE with data via Steam"
license=('custom')
url='https://store.steampowered.com/app/209650/Call_of_Duty_Advanced_Warfare__Gold_Edition/'
sha256sums=('9f839f1cbf2bc36ca65f962dacc024692d7c3dbbc8a112920e513c9fa7133318'
            'a696a2148946a4278bc40ee237d0a3cf702c785f27893f4ec145d18291e2dd77'
            '4808a884caddacdd0d53a6b075e649181485bb71e7263bd2556903f554fdcf85'
            '3bfe422a3daf85a02fe6458e4351a4f40f29f513ec8df2c838c7e197844e51cb')

prepare() {
    mkdir -p $srcdir/${_pkgname}

    # Use steamcmd to get data.
    printf "Enter your Steam username:"
    read steam_username
    steamcmd +@sSteamCmdForcePlatformType windows +@ShutdownOnFailedCommand 1 +force_install_dir $srcdir/${_pkgname} +login $steam_username "+app_update ${_steamid} validate" +quit
    wrestool -x -t -14 -o . ${_pkgname}/s1_mp64_ship.exe
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
    cp $srcdir/s1x.exe $pkgdir/opt/${_pkgname}/ 

    # Required for player profiles.
    chmod o+w $pkgdir/opt/${_pkgname}

    # Install desktop file.
    install -D -m 644 $srcdir/${_pkgname}.desktop \
             $pkgdir/usr/share/applications/${_pkgname}.desktop

    # Install icon file.
    install -D -m 644 $srcdir/s1_mp64_ship.exe_*_256x256x24.png \
             $pkgdir/usr/share/pixmaps/${_pkgname}.png

    # Install bash startup script.
    install -D -m 755 $srcdir/${_pkgname}.sh \
             $pkgdir/usr/bin/${_pkgname}
}
