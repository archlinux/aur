# Maintainer: John-Michael Mulesa <jmulesa [at] gmail.com>

pkgname=cod4-wine-steam
_pkgname=cod4
pkgver=1.8
pkgrel=2
_steamid=7940
arch=('i686' 'x86_64')
makedepends=('steamcmd')
depends=('wine')
source=("${_pkgname}.sh" "${_pkgname}.desktop" "${_pkgname}.png")
pkgdesc="Call of Duty 4: Modern Warfare using WINE with data via Steam"
license=('custom')
url='https://store.steampowered.com/app/7940/Call_of_Duty_4_Modern_Warfare/'
sha256sums=('5c3c872cd5a793ca5ff5b9867100754aac265d9f05a47796c4c4f82f0b13c5fd'
            '6854931dd152463e9af6d72d4a0eb0ad7792800bd203153d5d6fe02f6f5c048b'
            'a9f40a206d1b93869f874afa54d8f45ac76bb2d3ea8491c17f6ec6072564619c')

prepare() {
    mkdir -p $srcdir/${_pkgname}

    # Use steamcmd to get data.
    printf "Enter your Steam username:"
    read steam_username
    steamcmd +@sSteamCmdForcePlatformType windows +@ShutdownOnFailedCommand 1 +force_install_dir $srcdir/${_pkgname} +login $steam_username "+app_update ${_steamid} validate" +quit
}

package() {
    mkdir -p $pkgdir/opt/${_pkgname}

    # Move required files to pkgdir
    cp -r $srcdir/${_pkgname}/* $pkgdir/opt/${_pkgname}/
    rm -rf $pkgdir/opt/${_pkgname}/steamapps
    rm $pkgdir/opt/${_pkgname}/*.vdf
    
    # Required for player profiles.
    chmod o+w $pkgdir/opt/${_pkgname}

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
