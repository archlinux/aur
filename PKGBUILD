# Maintainer: John-Michael Mulesa <jmulesa [at] gmail.com>

pkgname=aoe3-wine-steam
_pkgname=aoe3
pkgver=1.03
pkgrel=2
_steamid=105450
arch=('i686' 'x86_64')
makedepends=('steamcmd')
depends=('wine' 'winetricks')
depends_i686=('mpg123')
depends_x86_64=('lib32-mpg123')
source=("${_pkgname}.sh" "${_pkgname}.desktop" "${_pkgname}.png")
pkgdesc="Age of Empires 3 using WINE with data via Steam"
install=aoe3.install
license=('custom')
url='https://store.steampowered.com/app/105450/Age_of_Empires_III_2007/'
sha256sums=('51f4b1145dcbbc8f3c15cd704540d72473c9f7924b5ade8429faecaefa209067'
            '7a53cc2f88e8ee8d4233428438870803f4e662a4b8ee61a3c05aa1fe8541745c'
            'ec3d23d8b0a15a10ed15141fd236efb523f056745df3aabed29e0a6eb71689b9')

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
    cp -r $srcdir/${_pkgname}/bin/* $pkgdir/opt/${_pkgname}/
    
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
