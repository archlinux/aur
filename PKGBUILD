# Maintainer: John-Michael Mulesa <jmulesa [at] gmail.com>

pkgname=serioussamfusion-steam
_pkgname=serioussamfusion
pkgver=1.0
pkgrel=1
_steamid=564310
arch=('x86_64')
makedepends=('steamcmd')
depends=()
source=("${_pkgname}.sh" "${_pkgname}.desktop" "${_pkgname}.png"
        "Goldberg_Lan_Steam_Emu_master--a24a9c26.zip::https://gitlab.com/Mr_Goldberg/goldberg_emulator/-/jobs/1590301114/artifacts/download")
pkgdesc="Serious Sam Fusion 2017 Linux-native with data via Steam"
license=('custom')
url='https://store.steampowered.com/app/564310/Serious_Sam_Fusion_2017_beta/'
sha256sums=('8a73032f555fbc542cdbcad75b4d122918a22c62405936a407a6adf2c27163f8'
            '33cc7df159d93822788a5b08e99f0177c4e0aca3ee9c94ca2966d72a7486b999'
            '6eae4389da60c96c04587a867edcc82f516c0231494488fe8c94e90325f3fd0a'
            '3bfe422a3daf85a02fe6458e4351a4f40f29f513ec8df2c838c7e197844e51cb')

prepare() {
    mkdir -p $srcdir/${_pkgname}

    # Use steamcmd to get data.
    printf "Enter your Steam username:"
    read steam_username
    steamcmd +@sSteamCmdForcePlatformType linux +@ShutdownOnFailedCommand 1 +force_install_dir $srcdir/${_pkgname} +login $steam_username "+app_update ${_steamid} validate" +quit
}

package() {
    mkdir -p $pkgdir/opt/${_pkgname}

    # Move required files to pkgdir
    cp -r $srcdir/${_pkgname}/* $pkgdir/opt/${_pkgname}/
    rm -rf $pkgdir/opt/${_pkgname}/steamapps
    $srcdir/linux/tools/find_interfaces.sh $pkgdir/opt/${_pkgname}/Bin/x64/libsteam_api.so > $pkgdir/opt/${_pkgname}/Bin/x64/steam_interfaces.txt || true
    cp $srcdir/linux/x86_64/libsteam_api.so $pkgdir/opt/${_pkgname}/Bin/x64
    echo "${_steamid}" > $pkgdir/opt/${_pkgname}/Bin/x64/steam_appid.txt

    # Install desktop file.
    install -D -m 644 $srcdir/${_pkgname}.desktop \
             $pkgdir/usr/share/applications/${_pkgname}.desktop

    # Install icon file.
    install -D -m 644 $srcdir/${_pkgname}.png \
             $pkgdir/usr/share/pixmaps/${_pkgname}.png

    # Install bash startup script.
    install -D -m 755 $srcdir/${_pkgname}.sh \
             $pkgdir/usr/bin/${_pkgname}
}
