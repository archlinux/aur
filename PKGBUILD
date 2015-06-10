# Maintainer: Alex Szczuczko <alex@szc.ca>

pkgname=gunpoint
pkgver=1410971363
pkgrel=1
pkgdesc="A stealth puzzle game that lets you rewire its levels to trick people"
arch=("i686" "x86_64")
url="http://www.gunpointgame.com/"
license=("custom:commercial")
depends=()
source=("${pkgname}.desktop"
        "launch-${pkgname}.sh"
        "GunpointLinux_170914_${pkgver}.tar.gz::hib://GunpointLinux_170914_${pkgver}.tar.gz")
sha256sums=("a43f225c31e995fd6b0225a7743755d991df1b4f45b26ab54d919194f549553e"
            "9e98fd2445561db881c1a555a5141fa0fae18c14ca738dd73ba7d33b781dfa7a"
            "8fe96b3402a48eed890155479138ef84f31b238c9631f5833ca377d08af0e3bd")

# hib scheme catch-all
DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf."; exit 1')

# Modify depends for the arch type
if [ "$CARCH" = "x86_64" ]
then
    depends+=('lib32-libogg' 'lib32-libvorbis' 'lib32-libxrandr' 'lib32-nvidia-cg-toolkit' 'lib32-openal' 'lib32-glibc' 'lib32-gcc-libs' 'lib32-libx11' 'lib32-libpng12' 'lib32-libxcb' 'lib32-libxext' 'lib32-zlib' 'lib32-libxau' 'lib32-libxdmcp' 'lib32-libgl')
else
    depends+=('libogg' 'libvorbis' 'libxrandr' 'nvidia-cg-toolkit' 'openal' 'glibc' 'gcc-libs' 'libx11' 'libpng12' 'libxcb' 'libxext' 'zlib' 'libxau' 'libxdmcp' 'libgl')
fi

# Disable compression of the package
PKGEXT='.pkg.tar'

package() {
    # Binaries
    install -Dm755 "$srcdir/Gunpoint/Gunpoint" "$pkgdir/opt/$pkgname/Gunpoint"
    install -m644 -t "$pkgdir/opt/$pkgname/" "$srcdir/Gunpoint/Gunpoint.wad"

    # Levels
    install -m755 -d "$pkgdir/opt/$pkgname/Levels/Template/"
    install -m644 -t "$pkgdir/opt/$pkgname/Levels/Template/" "$srcdir/Gunpoint/Levels/Template/Template.lvl"

    # Music
    install -m755 -d "$pkgdir/opt/$pkgname/Music/"
    find "$srcdir/Gunpoint/Music/" -maxdepth 1 -type f -print0 | \
        xargs -0 install -m644 -t "$pkgdir/opt/$pkgname/Music/"

    # Scripts
    install -m755 -d "$pkgdir/opt/$pkgname/Scripts/"
    find "$srcdir/Gunpoint/Scripts/" -maxdepth 1 -type f -print0 | \
        xargs -0 install -m644 -t "$pkgdir/opt/$pkgname/Scripts/"

    # Launcher
    install -m755 -t "$pkgdir/opt/$pkgname/" "$srcdir/launch-gunpoint.sh"

    #
    # System integration
    #

    # /bin
    install -m755 -d "$pkgdir/usr/bin/"
    ln -s "/opt/$pkgname/launch-gunpoint.sh" "$pkgdir/usr/bin/$pkgname"

    # License
    #install -m755 -d "$pkgdir/usr/share/licenses/$pkgname/"
    #ln -s "/opt/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Icon
    #install -m755 -d "$pkgdir/usr/share/pixmaps/"
    #ln -s "/opt/$pkgname/Gunpoint.png" "$pkgdir/usr/share/pixmaps/${pkgname}.png"

    # .desktop File
    install -m755 -d "$pkgdir/usr/share/applications/"
    install -m644 -t "$pkgdir/usr/share/applications/" "$srcdir/${pkgname}.desktop"
}
