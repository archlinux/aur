# Maintainer: Alex Szczuczko <alex@szc.ca>

pkgname=torchlight2-hib
_hibver=2015-04-01
pkgver=20150401
pkgrel=1
pkgdesc="An action RPG dungeon crawler"
arch=("i686" "x86_64")
url="http://www.torchlight2game.com/"
license=("custom:commercial")
depends=("bzip2" "fmodex" "freeimage" "freetype2" "gcc-libs" "glibc" "libgl" "libutil-linux" "libx11" "libxau" "libxdmcp" "libxext" "libxft" "sdl2" "zlib")
options=("!strip")
source=("${pkgname}.desktop"
        "Torchlight2-linux-${_hibver}.sh::hib://Torchlight2-linux-${_hibver}.sh")
sha256sums=("9c6690eb23404539da0f3960811f5dd035a4b579b3d5e98780edf10be9860970"
            "c469f4144ac0c253d68ba294a68747bff70cf6bfcff7193890ebb755a653db0d")

DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf."; exit 1')

# Disable compression of the package
PKGEXT='.pkg.tar'

package() {
    # Data
    install -m755 -d "$pkgdir/opt/$pkgname/"
    # Hardlink files to save the disk space and time spent copying them (they are large)
    cp -Ral -t "$pkgdir/opt/$pkgname/" "$srcdir/data/noarch/."
    find "$pkgdir/opt/$pkgname/" -type d -print0 | xargs -0 chmod 755
    find "$pkgdir/opt/$pkgname/" -type f -print0 | xargs -0 chmod 644

    # Binaries
    if [ "$CARCH" = "x86_64" ]
    then
        install -m755 -d "$pkgdir/opt/$pkgname/lib64/"
        find "$srcdir/data/x86_64/lib64/" -maxdepth 1 -type f '(' \
            -name '*CEGUI*' -or -name '*Ogre*' -or -name '*Plugin*' -or -name '*RenderSystem*' ')' -print0 | \
            xargs -0 install -m644 -t "$pkgdir/opt/$pkgname/lib64/"
        find "$srcdir/data/x86_64/" -maxdepth 1 -type f -name '*.bin.*' -print0 | \
            xargs -0 install -m755 -t "$pkgdir/opt/$pkgname/"
        ln -s "Torchlight2.bin.x86_64" "$pkgdir/opt/$pkgname/Torchlight2"
        ln -s "ModLauncher.bin.x86_64" "$pkgdir/opt/$pkgname/ModLauncher"
    else
        install -m755 -d "$pkgdir/opt/$pkgname/lib/"
        find "$srcdir/data/x86/lib/" -maxdepth 1 -type f '(' \
            -name '*CEGUI*' -or -name '*Ogre*' -or -name '*Plugin*' -or -name '*RenderSystem*' ')' -print0 | \
            xargs -0 install -m644 -t "$pkgdir/opt/$pkgname/lib/"
        find "$srcdir/data/x86/" -maxdepth 1 -type f -name '*.bin.*' -print0 | \
            xargs -0 install -m755 -t "$pkgdir/opt/$pkgname/"
        ln -s "Torchlight2.bin.x86" "$pkgdir/opt/$pkgname/Torchlight2"
        ln -s "ModLauncher.bin.x86" "$pkgdir/opt/$pkgname/ModLauncher"
    fi

    # Docs
    install -m755 -d "$pkgdir/opt/$pkgname/EULA/"
    find "$srcdir/data/EULA/" -maxdepth 1 -type f -print0 | \
        xargs -0 install -m644 -t "$pkgdir/opt/$pkgname/EULA/"

    #
    # System integration
    #

    # /bin
    install -m755 -d "$pkgdir/usr/bin/"
    ln -s "/opt/$pkgname/Torchlight2" "$pkgdir/usr/bin/$pkgname"

    # License
    install -m755 -d "$pkgdir/usr/share/licenses/$pkgname/"
    ln -s "/opt/$pkgname/EULA/en.txt" "$pkgdir/usr/share/licenses/$pkgname/en.txt"

    # Icon
    install -m755 -d "$pkgdir/usr/share/pixmaps/"
    ln -s "/opt/$pkgname/Delvers.png" "$pkgdir/usr/share/pixmaps/${pkgname}.png"

    # .desktop File
    install -m755 -d "$pkgdir/usr/share/applications/"
    install -m644 -t "$pkgdir/usr/share/applications/" "$srcdir/${pkgname}.desktop"
}
