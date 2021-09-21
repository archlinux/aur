# Maintainer: John-Michael Mulesa <jmulesa [at] gmail.com>

pkgname=dirtrally2-wine-steam
_pkgname=dirtrally2
pkgver=1.18
pkgrel=1
_steamid=690790
arch=('x86_64')
makedepends=('steamcmd' 'icoutils')
depends=('wine' 'winetricks')
source=("${_pkgname}.sh" "${_pkgname}.desktop"
        "Goldberg_Lan_Steam_Emu_master--a24a9c26.zip::https://gitlab.com/Mr_Goldberg/goldberg_emulator/-/jobs/1590301114/artifacts/download")
pkgdesc="DiRT Rally 2.0 using WINE with data via Steam"
license=('custom')
install=dirtrally2.install
url='https://store.steampowered.com/app/690790/DiRT_Rally_20/'
sha256sums=('54efc57383072f7464aa892d2042d598b43f78fe9395953edc5ab6be9912b86a'
            '6e861a168f8d5418646a12e8596cebe01b0f1f0ab6fbd542bff298c3d7c4988b'
            '3bfe422a3daf85a02fe6458e4351a4f40f29f513ec8df2c838c7e197844e51cb')

prepare() {
    mkdir -p $srcdir/${_pkgname}

    # Use steamcmd to get data.
    printf "Enter your Steam username:"
    read steam_username
    steamcmd +@sSteamCmdForcePlatformType windows +@ShutdownOnFailedCommand 1 +force_install_dir $srcdir/${_pkgname} +login $steam_username "+app_update ${_steamid} validate" +quit
    wrestool -x -t -14 -o . ${_pkgname}/${_pkgname}.exe
    icotool -x -o . *.ico
}

package() {
    mkdir -p $pkgdir/opt/${_pkgname}

    # Move required files to pkgdir
    cp -r $srcdir/${_pkgname}/* $pkgdir/opt/${_pkgname}/
    rm -rf $pkgdir/opt/${_pkgname}/steamapps
    $srcdir/linux/tools/find_interfaces.sh $pkgdir/opt/${_pkgname}/steam_api64.dll > $pkgdir/opt/${_pkgname}/steam_interfaces.txt || true
    cp $srcdir/steam_api64.dll $pkgdir/opt/${_pkgname}/
    echo "${_steamid}" > $pkgdir/opt/${_pkgname}/steam_appid.txt

    # Install desktop file.
    install -D -m 644 $srcdir/${_pkgname}.desktop \
             $pkgdir/usr/share/applications/${_pkgname}.desktop

    # Install icon file.
    install -D -m 644 $srcdir/dirtrally2.exe_*_256x256x32.png \
             $pkgdir/usr/share/pixmaps/${_pkgname}.png

    # Install bash startup script.
    install -D -m 755 $srcdir/${_pkgname}.sh \
             $pkgdir/usr/bin/${_pkgname}
}
