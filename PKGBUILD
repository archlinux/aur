# Maintainer: Moviuro <moviuro+aur at gmail dot com>

_pkgname=towerfall
pkgname=${_pkgname}-hib
_yearpkgver=2016
_restpkgver=0721
pkgver="${_yearpkgver}${_restpkgver}"
_retard_pkgver=${_restpkgver}${_yearpkgver}
pkgrel=1
pkgdesc="Towerfall is an archery combat platformer for up to 4 players."
arch=("i686" "x86_64")
url="http://www.towerfall-game.com/"
depends=(dbus expat flac icu libasyncns libdrm libedit libelf libffi libgcrypt
         libglvnd libgpg-error libogg libpulse libsndfile libsystemd libvorbis
         libx11 libxau libxcb libxcursor libxdamage libxdmcp libxext libxfixes
         libxi libxinerama libxml2 libxrandr libxrender libxshmfence libxxf86vm
         llvm-libs lm_sensors lz4 mesa ncurses xz zlib)
license=("custom:commercial")
source=("hib://${_pkgname}-${_retard_pkgver}-bin")
sha256sums=("8378611a675dc31157d98745d4c71f14ff1655ed573710288cf1329ea80078b4")

# Disable compression of the package
PKGEXT='.pkg.tar'

package() {
    # Data
    mkdir -p "$pkgdir/opt/$pkgname/data/"
    # Hardlink files to save the disk space and time spent copying them (they are large)
    cp -Ral -t "$pkgdir/opt/$pkgname/data/" "$srcdir/data/"*
    find "$pkgdir/opt/$pkgname/data" -type d -print0 | xargs -0 chmod 755
    find "$pkgdir/opt/$pkgname/data" -type f -print0 | xargs -0 chmod 644

    # Binaries
    chmod +x "$pkgdir/opt/$pkgname/data/TowerFall.bin.x86"
    chmod +x "$pkgdir/opt/$pkgname/data/TowerFall.bin.x86_64"

    # And now, welcome stupid
    # The game simply won't run if you don't allow +w on those
    chmod -R a+w "$pkgdir/opt/$pkgname/data/Content/Atlas/"*.png
    chmod -R a+w "$pkgdir/opt/$pkgname/data/Content/SFX/"*.wav

    #
    # System integration
    #

    # /bin
    install -m755 -d "$pkgdir/usr/bin/"
    ln -s "/opt/$pkgname/data/TowerFall.bin.x86_64" "$pkgdir/usr/bin/$pkgname"

    # License
    # None to be found in the archive

    # Icon
    install -m755 -d "$pkgdir/usr/share/pixmaps/"
    ln -s "/opt/$pkgname/data/TowerFall.png" "$pkgdir/usr/share/pixmaps/${pkgname}.png"
}
