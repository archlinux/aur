# Maintainer: John-Michael Mulesa <jmulesa [at] gmail.com>

pkgname=rocketleague-steam
_pkgname=rocketleague
pkgver=1.0
pkgrel=1
_steamid=252950
arch=('x86_64')
makedepends=('steamcmd')
depends=()
source=("${_pkgname}.sh" "${_pkgname}.desktop" "${_pkgname}.png"
        "Goldberg_Lan_Steam_Emu_master--a24a9c26.zip::https://gitlab.com/Mr_Goldberg/goldberg_emulator/-/jobs/1590301114/artifacts/download")
pkgdesc="Rocket League Linux-native with data via Steam"
license=('custom')
url='https://steamdb.info/app/252950/'
sha256sums=('135f0cf26ee3c626f7116e3c04f6b611d69706a78ee1c8062f211ebf2ba860f8'
            'e33bf02d2b017bfc094bc0f7744a466b64d3c6e22f1ae718b80f7dc84f864a24'
            '1f35b795dd8affc510212103a7b28bd780fd38992e40f00a3b16c97b73f39c2c'
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
    $srcdir/linux/tools/find_interfaces.sh $pkgdir/opt/${_pkgname}/Binaries/Linux/libsteam_api.so > $pkgdir/opt/${_pkgname}/Binaries/Linux/steam_interfaces.txt || true
    cp $srcdir/linux/x86_64/libsteam_api.so $pkgdir/opt/${_pkgname}/Binaries/Linux/libsteam_api.so
    echo "${_steamid}" > $pkgdir/opt/${_pkgname}/Binaries/Linux/steam_appid.txt

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
