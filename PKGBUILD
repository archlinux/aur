# Maintainer: John-Michael Mulesa <jmulesa [at] gmail.com>

pkgname=cod4-wine-steam
pkgver=1.8
pkgrel=1
arch=('i686' 'x86_64')
makedepends=('steamcmd')
depends=('wine')
source=("cod4.sh" "cod4.desktop" "cod4.png")
pkgdesc="Call of Duty 4 Modern Warfare using WINE with data via Steam"
license=('custom')
url='https://store.steampowered.com/app/7940/Call_of_Duty_4_Modern_Warfare/'
sha256sums=('5c3c872cd5a793ca5ff5b9867100754aac265d9f05a47796c4c4f82f0b13c5fd'
            '4114e972e71dd0283165642d78cfbe9b01a0e86d3d13c85ccc0dbb1dc9cb222f'
            'a9f40a206d1b93869f874afa54d8f45ac76bb2d3ea8491c17f6ec6072564619c')

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
