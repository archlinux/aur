# Maintainer: John-Michael Mulesa <jmulesa [at] gmail.com>

pkgname=dirt4-wine-steam
_pkgname=dirt4
pkgver=1.12
pkgrel=1
_steamid=421020
arch=('x86_64')
makedepends=('steamcmd' 'icoutils')
depends=('wine' 'winetricks')
source=("${_pkgname}.sh" "${_pkgname}.desktop"
        "Goldberg_Lan_Steam_Emu_master--a24a9c26.zip::https://gitlab.com/Mr_Goldberg/goldberg_emulator/-/jobs/1590301114/artifacts/download")
pkgdesc="DiRT 4 using WINE with data via Steam"
license=('custom')
install=dirt4.install
url='https://store.steampowered.com/app/421020/DiRT_4/'
sha256sums=('279ea715ad9af75cf06c3f977c246e0450297a0368f7a43069080420b6f96b44'
            'ef00e7e096d5649c180a1b7a1b977c6a640d08a32c27d0ace0ec36aa9feee58e'
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
    rm $pkgdir/opt/${_pkgname}/*.vdf
    $srcdir/linux/tools/find_interfaces.sh $pkgdir/opt/${_pkgname}/steam_api64.dll > $pkgdir/opt/${_pkgname}/steam_interfaces.txt || true
    cp $srcdir/steam_api64.dll $pkgdir/opt/${_pkgname}/
    echo "${_steamid}" > $pkgdir/opt/${_pkgname}/steam_appid.txt

    # Install desktop file.
    install -D -m 644 $srcdir/${_pkgname}.desktop \
             $pkgdir/usr/share/applications/${_pkgname}.desktop

    # Install icon file.
    install -D -m 644 $srcdir/dirt4.exe_14_101_0_4_256x256x32.png \
             $pkgdir/usr/share/pixmaps/${_pkgname}.png

    # Install bash startup script.
    install -D -m 755 $srcdir/${_pkgname}.sh \
             $pkgdir/usr/bin/${_pkgname}
}
