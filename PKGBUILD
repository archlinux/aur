# Maintainer: John-Michael Mulesa <jmulesa [at] gmail.com>

pkgname=serioussam3-steam
_pkgname=serioussam3
pkgver=1.0
pkgrel=1
_steamid=41070
arch=('i686' 'x86_64')
makedepends=('steamcmd')
depends=()
source=("${_pkgname}.sh" "${_pkgname}.desktop" "${_pkgname}.png"
        "Goldberg_Lan_Steam_Emu_master--a24a9c26.zip::https://gitlab.com/Mr_Goldberg/goldberg_emulator/-/jobs/1590301114/artifacts/download")
pkgdesc="Serious Sam 3 BFE Linux-native with data via Steam"
license=('custom')
url='https://store.steampowered.com/app/41070/Serious_Sam_3_BFE/'
sha256sums=('3b0320ce691539ce5013bb9e5b50cc6aa80707296e6e67761e46c2f95b9f9b4d'
            'b34af72b78b9a30cb2bc0499e8c69cb9d879958ea4d2ecb84da5702c4fdffea5'
            '327b16903ef25e0953aa1b9046895dd374a8859225062acab4c0e92313ff0ba6'
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
    $srcdir/linux/tools/find_interfaces.sh $pkgdir/opt/${_pkgname}/Bin/libsteam_api.so > $pkgdir/opt/${_pkgname}/Bin/steam_interfaces.txt || true
    cp $srcdir/linux/x86/libsteam_api.so $pkgdir/opt/${_pkgname}/Bin/
    echo "${_steamid}" > $pkgdir/opt/${_pkgname}/Bin/steam_appid.txt

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
