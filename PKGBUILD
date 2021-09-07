# Maintainer: John-Michael Mulesa <jmulesa [at] gmail.com>

pkgname=aoe3-wine-steam
pkgver=1.03
pkgrel=1
arch=('i686' 'x86_64')
makedepends=('steamcmd')
depends=('wine' 'winetricks')
source=("aoe3.sh" "aoe3.desktop" "aoe3.png")
pkgdesc="Age of Empires 3 using WINE with data via Steam"
install=aoe3.install
license=('custom')
url='https://store.steampowered.com/app/105450/Age_of_Empires_III_2007/'
sha256sums=('c1bcb8d0a59a584bd6275f94ed9f2fb3d90fc75556dc401dcfea04910110063f'
            '7a53cc2f88e8ee8d4233428438870803f4e662a4b8ee61a3c05aa1fe8541745c'
            'ec3d23d8b0a15a10ed15141fd236efb523f056745df3aabed29e0a6eb71689b9')

prepare() {
    mkdir -p $srcdir/aoe3

    # Use steamcmd to get data.
    printf "Enter your Steam username:"
    read steam_username
    steamcmd +@sSteamCmdForcePlatformType windows +@ShutdownOnFailedCommand 1 +force_install_dir $srcdir/aoe3 +login $steam_username "+app_update 105450 validate" +quit
}

package() {
    mkdir -p $pkgdir/opt/aoe3

    # Move required files to pkgdir
    cp -r $srcdir/aoe3/bin/* $pkgdir/opt/aoe3/
    
    # Install desktop file.
    install -D -m 644 $srcdir/aoe3.desktop \
             $pkgdir/usr/share/applications/aoe3.desktop

    # Install icon file.
    install -D -m 644 $srcdir/aoe3.png \
             $pkgdir/usr/share/pixmaps/aoe3.png

    # Install bash startup script.
    install -D -m 755 $srcdir/aoe3.sh \
             $pkgdir/usr/bin/aoe3
}
