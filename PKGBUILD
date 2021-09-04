# Maintainer: John-Michael Mulesa <jmulesa [at] gmail.com>

pkgname=cod4-wine-steam
pkgver=1.7
pkgrel=1
arch=('i686' 'x86_64')
makedepends=('steamcmd')
depends=('wine')
source=("https://github.com/jm2/archlinux-package-cod4-wine-steam/raw/master/iw3mp.exe" "cod4.sh" "cod4.desktop" "cod4.png")
pkgdesc="Call of Duty 4 Modern Warfare using WINE with data via Steam"
license=('custom')
url='https://store.steampowered.com/app/7940/Call_of_Duty_4_Modern_Warfare/'
md5sums=('8c40cde102a9d8297a8674cb149f96ed'
         '456be6eaf152ac61bce80a900c729d0c'
         'a7573fdd0c28d1068c536f3d69f09e6c'
         '71835265ac73665d8837ff45152f808a')

prepare() {
    mkdir -p $srcdir/cod4

    # Use steamcmd to get data.
    printf "Enter your Steam username:"
    read steam_username
    steamcmd +@sSteamCmdForcePlatformType windows +@ShutdownOnFailedCommand 1 +force_install_dir $srcdir/cod4 +login $steam_username "+app_update 7940 validate" +quit
}

package() {
    mkdir -p $pkgdir/opt/cod4

    # Move required files to pkgdir
    cp -r $srcdir/cod4/* $pkgdir/opt/cod4/
    cp $srcdir/iw3mp.exe $pkgdir/opt/cod4/iw3mp.exe
    rm -rf $pkgdir/opt/cod4/steamapps
    rm $pkgdir/opt/cod4/installscript.vdf
    
    # Required for player profiles.
    chmod o+w $pkgdir/opt/cod4

    # Install desktop file.
    install -D -m 644 $srcdir/cod4.desktop \
             $pkgdir/usr/share/applications/cod4.desktop

    # Install icon file.
    install -D -m 644 $srcdir/cod4.png \
             $pkgdir/usr/share/pixmaps/cod4.png

    # Install bash startup script.
    install -D -m 755 $srcdir/cod4.sh \
             $pkgdir/usr/bin/cod4
}
