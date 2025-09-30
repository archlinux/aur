# Maintainer: John-Michael Mulesa <jmulesa [at] gmail.com>

pkgname=wreckfest2-wine-steam
_pkgname=wreckfest2
pkgver=1.0
pkgrel=1
_steamid=1203190
arch=('x86_64')
makedepends=('steamcmd' 'icoutils')
depends=('umu-launcher')
source=("${_pkgname}.sh" "${_pkgname}.desktop"
        "Goldberg_Lan_Steam_Emu_master--475342f0.zip::https://gitlab.com/Mr_Goldberg/goldberg_emulator/-/jobs/4247811310/artifacts/download")
pkgdesc="Wreckfest 2 using WINE/Proton (umu-launcher) with data via Steam"
license=('custom')
install=wreckfest2.install
url='https://store.steampowered.com/app/1203190/Wreckfest_2/'
sha256sums=('1076030e8d5ceace65df340d936d013de12c7586951f21ef25153f8b438737d2'
            '15b9d2d39a2f0bf8e10fc25d7a51806a4f275d53d7ba0648f981d25b763b8030'
            '8465984b01b42a75f5faea8f2d884bbd6085a695c40c2b90eb0385f0a5081266')

prepare() {
    mkdir -p $srcdir/${_pkgname}

    # Use steamcmd to get data.
    printf "Enter your Steam username:"
    read steam_username
    steamcmd +@sSteamCmdForcePlatformType windows +@ShutdownOnFailedCommand 1 +force_install_dir $srcdir/${_pkgname} +login $steam_username "+app_update ${_steamid} validate" +quit
    wrestool -x -t -14 -o . ${_pkgname}/Wreckfest2.exe
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
    cp $srcdir/steam_api.dll $pkgdir/opt/${_pkgname}/
    echo "${_steamid}" > $pkgdir/opt/${_pkgname}/steam_appid.txt

    # Install desktop file.
    install -D -m 644 $srcdir/${_pkgname}.desktop \
             $pkgdir/usr/share/applications/${_pkgname}.desktop

    # Install icon file.
    install -D -m 644 $srcdir/Wreckfest2.exe_*_256x256x32.png \
             $pkgdir/usr/share/pixmaps/${_pkgname}.png

    # Install bash startup script.
    install -D -m 755 $srcdir/${_pkgname}.sh \
             $pkgdir/usr/bin/${_pkgname}
}
