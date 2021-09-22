# Maintainer: John-Michael Mulesa <jmulesa [at] gmail.com>

pkgname=codwaw-wine-steam
_pkgname=codwaw
pkgver=1.7
pkgrel=1
_steamid=10090
arch=('i686' 'x86_64')
makedepends=('steamcmd' 'icoutils')
depends=('wine')
source=("${_pkgname}.sh" "${_pkgname}.desktop"
        "https://github.com/jm2/archlinux-package-codwaw-wine-steam/raw/master/CoDWaW.exe"
        "https://github.com/jm2/archlinux-package-codwaw-wine-steam/raw/master/CoDWaWmp.exe")
pkgdesc="Call of Duty: World at War using WINE with data via Steam"
license=('custom')
url='https://store.steampowered.com/app/10090/Call_of_Duty_World_at_War/'
sha256sums=('84437aa7bf7baf82596c636d0a026933ee9197e67efd2887de59fb03c5aa8715'
            'd3f8517b127a1cb03e991d963c40df17bbe6de57f5e8a662fbc6598e43e797db'
            'f751d06799ed27f30c61d157ed292aa3adce73fbf9c30b92a5657b29624e8b31'
            'b0e265592901cd248b7358e8b37c8c1b5c85c6b24fb3cb378f62d601378e4fae')

prepare() {
    mkdir -p $srcdir/${_pkgname}

    # Use steamcmd to get data.
    printf "Enter your Steam username:"
    read steam_username
    steamcmd +@sSteamCmdForcePlatformType windows +@ShutdownOnFailedCommand 1 +force_install_dir $srcdir/${_pkgname} +login $steam_username "+app_update ${_steamid} validate" +quit
    wrestool -x -t -14 -o . ${_pkgname}/CoDWaW.exe
    icotool -x -o . *.ico
}

package() {
    mkdir -p $pkgdir/opt/${_pkgname}

    # Move required files to pkgdir
    cp -r $srcdir/${_pkgname}/* $pkgdir/opt/${_pkgname}/
    cp $srcdir/CoDWaW{,mp}.exe $pkgdir/opt/${_pkgname}/
    rm -rf $pkgdir/opt/${_pkgname}/steamapps
    rm $pkgdir/opt/${_pkgname}/*.vdf
    
    # Required for player profiles.
    chmod o+w $pkgdir/opt/${_pkgname}

    # Install desktop file.
    install -D -m 644 $srcdir/${_pkgname}.desktop \
             $pkgdir/usr/share/applications/${_pkgname}.desktop

    # Install icon file.
    install -D -m 644 $srcdir/CoDWaW.exe_14_ID_ICON1_1024_5_256x256x24.png \
             $pkgdir/usr/share/pixmaps/${_pkgname}.png

    # Install bash startup script.
    install -D -m 755 $srcdir/${_pkgname}.sh \
             $pkgdir/usr/bin/${_pkgname}
}
