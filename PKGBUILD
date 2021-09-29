# Maintainer: John-Michael Mulesa <jmulesa [at] gmail.com>

pkgname=codmw2-wine-steam
_pkgname=codmw2
pkgver=1.2
pkgrel=1
_steamid=10190
arch=('i686' 'x86_64')
makedepends=('steamcmd' 'icoutils' 'zip')
depends=('wine')
source=("${_pkgname}.sh" "${_pkgname}.desktop"
        "https://github.com/XLabsProject/iw4x-client/releases/download/v0.6.1/iw4x.dll"
        "git+https://github.com/XLabsProject/iw4x-rawfiles.git"
        "Goldberg_Lan_Steam_Emu_master--a24a9c26.zip::https://gitlab.com/Mr_Goldberg/goldberg_emulator/-/jobs/1590301114/artifacts/download")
pkgdesc="Call of Duty: Modern Warfare 2 using WINE with data via Steam"
license=('custom')
url='https://store.steampowered.com/app/10180/Call_of_Duty_Modern_Warfare_2/'
sha256sums=('4d36bd2dcd4afd39e113440391e2fb821b6de01f02c3f8a3c948c35b0f08e9c1'
            '0f80bbdc2a58a085e624b853bb8aa9efb78353cc432f8e19841421628e1ae9f6'
            'aac196ca85ee1f79080ac236b82397b6a8c7bf70f152c273e6a0fa334e87373c'
            'SKIP'
            '3bfe422a3daf85a02fe6458e4351a4f40f29f513ec8df2c838c7e197844e51cb')

prepare() {
    mkdir -p $srcdir/${_pkgname}

    # Use steamcmd to get data.
    printf "Enter your Steam username:"
    read steam_username
    steamcmd +@sSteamCmdForcePlatformType windows +@ShutdownOnFailedCommand 1 +force_install_dir $srcdir/${_pkgname} +login $steam_username "+app_update ${_steamid} validate" +quit
    wrestool -x -t -14 -o . ${_pkgname}/iw4mp.exe
    icotool -x -o . *.ico
}

package() {
    mkdir -p $pkgdir/opt/${_pkgname}

    # Move required files to pkgdir
    cp -r $srcdir/${_pkgname}/* $pkgdir/opt/${_pkgname}/
    rm -rf $pkgdir/opt/${_pkgname}/steamapps
    rm $pkgdir/opt/${_pkgname}/*.vdf
    $srcdir/linux/tools/find_interfaces.sh $pkgdir/opt/${_pkgname}/steam_api.dll > $pkgdir/opt/${_pkgname}/steam_interfaces.txt || true
    cp $srcdir/steam_api.dll $pkgdir/opt/${_pkgname}/
    echo "${_steamid}" > $pkgdir/opt/${_pkgname}/steam_appid.txt
    
    # Install iw4x for local multiplayer.
    cp $srcdir/iw4x.dll $pkgdir/opt/${_pkgname}/
    cp -r $srcdir/iw4x-rawfiles/* $pkgdir/opt/${_pkgname}/
    cd $pkgdir/opt/${_pkgname}/iw4x/iw4x_00
    zip -r ../iw4x_00.iwd *
    cd $pkgdir/opt/${_pkgname}/iw4x/iw4x_01
    zip -r ../iw4x_01.iwd *
    rm -rf $pkgdir/opt/${_pkgname}/iw4x/iw4x_0{0,1}

    # Required for player profiles.
    chmod o+w $pkgdir/opt/${_pkgname}

    # Install desktop file.
    install -D -m 644 $srcdir/${_pkgname}.desktop \
             $pkgdir/usr/share/applications/${_pkgname}.desktop

    # Install icon file.
    install -D -m 644 $srcdir/iw4mp.exe_*_256x256x8.png \
             $pkgdir/usr/share/pixmaps/${_pkgname}.png

    # Install bash startup script.
    install -D -m 755 $srcdir/${_pkgname}.sh \
             $pkgdir/usr/bin/${_pkgname}
}
