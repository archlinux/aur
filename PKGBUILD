# Maintainer: John-Michael Mulesa <jmulesa [at] gmail.com>

pkgname=ut3-wine-steam
_pkgname=ut3
pkgver=2.1
pkgrel=1
arch=('i686' 'x86_64')
makedepends=('steamcmd')
depends=('wine')
source=("${_pkgname}.desktop" "${_pkgname}.sh" "${_pkgname}.png")
pkgdesc="Unreal Tournament 3 Black using WINE with data via Steam"
license=('custom')
url='https://store.steampowered.com/app/13210/Unreal_Tournament_3_Black/'
sha256sums=('7fa682a9a2c15facd1d1c6361754cddca1dd2c9913d0c90585ff694fa45d62d9'
            'e6accb8e23cf06bdd4c70ac8ef095208423777da65b479177b43efe8e03cfb10'
            '1f9441dc8dbae60187883799125393c4333f22eb2eb33fea5bf4a6270bdaa055')

prepare() {
    mkdir -p $srcdir/${_pkgname}

    # Use steamcmd to get data.
    printf "Enter your Steam username:"
    read steam_username
    steamcmd +@sSteamCmdForcePlatformType windows +@ShutdownOnFailedCommand 1 +force_install_dir $srcdir/${_pkgname} +login $steam_username "+app_update 13210 validate" +quit
}

package() {
    mkdir -p $pkgdir/opt/${_pkgname}

    # Move required files to pkgdir
    cp -r $srcdir/${_pkgname}/* $pkgdir/opt/${_pkgname}/
    rm -rf $pkgdir/opt/${_pkgname}/steamapps
    rm $pkgdir/opt/${_pkgname}/installscript.vdf

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
