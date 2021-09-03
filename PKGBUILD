# Maintainer: John-Michael Mulesa <jmulesa@gmail.com>
#

pkgname=serioussam2-steam
pkgver=2.07
pkgrel=1
arch=('i686' 'x86_64')
makedepends=('steamcmd' 'xf86miscproto')
depends=('lib32-openal' 'lib32-libxxf86misc')
pkgdesc="Serious Sam 2 Linux using Steam game data"
source=("flibitSam2_2070b.tar.gz::http://www.flibitijibibo.com/fedora/installers/flibitSam2_2070b.tar.gz" "serioussam2.desktop")
license=('custom')
url='https://store.steampowered.com/app/204340/Serious_Sam_2/'
md5sums=('4ce30037da426e61465b667f75189cd0'
         'db1a519bd95d85014f72f98bfc505f7e')

package() {
    mkdir -p $pkgdir/opt/serioussam2
    mkdir -p $srcdir/ss2
    cd $pkgdir/opt/serioussam2
    export DESTDIR=`pwd`
    sed -i 's/STEAMDIR="$HOME\/.wine\/drive_c\/Program Files\/Steam\/steamapps\/common\/serious sam 2"/STEAMDIR="$DESTDIR"/' $srcdir/Install/install.sh
    # Use steamcmd to get data.
    printf "Enter your Steam username:"
    read steam_username
    steamcmd +@sSteamCmdForcePlatformType windows +@ShutdownOnFailedCommand 1 +force_install_dir $srcdir/ss2 +login $steam_username "+app_update 204340 validate" +quit

    cp -r $srcdir/Install $pkgdir/opt/serioussam2/
    # Move required files to pkgdir
    mkdir -p $pkgdir/opt/serioussam2
    cp -r $srcdir/ss2/* $pkgdir/opt/serioussam2/
    cd $pkgdir/opt/serioussam2/Install
    yes | ./install.sh
    chmod +x $pkgdir/opt/serioussam2/serioussam2*
    rm -rf $pkgdir/opt/serioussam2/steamapps
    ln -s /usr/lib32/libopenal.so.1 $pkgdir/opt/serioussam2/libopenal.so.0
    mkdir -p $pkgdir/usr/bin
    ln -s /opt/serioussam2/serioussam2 $pkgdir/usr/bin/serioussam2
    install -Dm644 "${srcdir}/serioussam2.desktop" \
      "${pkgdir}/usr/share/applications/serioussam2.desktop"
}
