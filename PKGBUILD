# Maintainer: Alex Szczuczko <alex@szc.ca>

pkgname=thiswarofmine-gog
pkgver=1.2.0.3
pkgrel=1
pkgdesc="Experience war not as a soldier, but as a group of civilians in a besieged city."
arch=("i686" "x86_64")
url="http://www.gog.com/game/this_war_of_mine"
license=("custom:commercial")
options=(!strip)
depends=()
source=("${pkgname}.desktop"
        "launch-thiswarofmine.sh"
        "gog_this_war_of_mine_${pkgver}.tar.gz::file://gog_this_war_of_mine_${pkgver}.tar.gz")
sha256sums=("ce9720a6f72402c354bfc12dace96609b847c96c496c2f706080a3696d38ae4e"
            "b1ac5ee88d49466585a65db109000c2c5c9cadb315aba06504abdd6ae79b168e"
            "5b5d00a35a1d933ad4bcfefa35c86631d57cf8c72d1535e12cb4daed5a6287c6")

# Modify depends for the arch type
if [ "$CARCH" = "x86_64" ]
then
    depends+=("lib32-openal" "lib32-gcc-libs" "lib32-glibc" "lib32-libx11" "lib32-libxau" "lib32-libxcb" "lib32-libxdmcp" "lib32-libxext" "lib32-libgl")
else
    depends+=("openal" "gcc-libs" "glibc" "libx11" "libxau" "libxcb" "libxdmcp" "libxext" "libgl")
fi

# Disable compression of the package
PKGEXT='.pkg.tar'

package() {
    # Binaries
    install -Dm755 "$srcdir/This War Of Mine/game/This War of Mine" "$pkgdir/opt/$pkgname/This War of Mine"
    ln -s "/usr/lib32/libopenal.so" "$pkgdir/opt/$pkgname/libOpenAL.so"

    # Launcher
    install -m755 -t "$pkgdir/opt/$pkgname/" "$srcdir/launch-thiswarofmine.sh"

    # Data
    find "$srcdir/This War Of Mine/game/" -maxdepth 1 -type f "(" -name "*.dat" -or -name "*.idx" ")" -print0 | \
        xargs -0 install -m644 -t "$pkgdir/opt/$pkgname/"

    # Docs
    install -m755 -d "$pkgdir/opt/$pkgname/docs"
    install -m644 -t "$pkgdir/opt/$pkgname/docs" \
        "$srcdir/This War Of Mine/game/Changelog.txt" \
        "$srcdir/This War Of Mine/docs/End User License Agreement.txt"

    # Icon
    install -m644 -t "$pkgdir/opt/$pkgname/" "$srcdir/This War Of Mine/support/gog-this-war-of-mine.png"

    #
    # System integration
    #

    # /bin
    install -m755 -d "$pkgdir/usr/bin/"
    ln -s "/opt/$pkgname/launch-thiswarofmine.sh" "$pkgdir/usr/bin/$pkgname"

    # License
    install -m755 -d "$pkgdir/usr/share/licenses/$pkgname/"
    ln -s "/opt/$pkgname/docs/End User License Agreement.txt" "$pkgdir/usr/share/licenses/$pkgname/EULA"

    # Icon
    install -m755 -d "$pkgdir/usr/share/pixmaps/"
    ln -s "/opt/$pkgname/gog-this-war-of-mine.png" "$pkgdir/usr/share/pixmaps/${pkgname}.png"

    # .desktop File
    install -m755 -d "$pkgdir/usr/share/applications/"
    install -m644 -t "$pkgdir/usr/share/applications/" "$srcdir/${pkgname}.desktop"

    # Doc
    install -m755 -d "$pkgdir/usr/share/doc/"
    ln -s "/opt/$pkgname/docs" "$pkgdir/usr/share/doc/$pkgname"
}
