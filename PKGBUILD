# Maintainer: Alex Szczuczko <alex@szc.ca>

pkgname=handoffate-gog
pkgver=1.0.0.1
pkgrel=1
pkgdesc="A hybrid roguelike/action-RPG/deck builder"
arch=("i686" "x86_64")
url="http://www.gog.com/game/hand_of_fate"
license=("custom:commercial")
options=()
depends=()
source=("${pkgname}.desktop"
        "gog_hand_of_fate_${pkgver}.tar.gz::file://gog_hand_of_fate_${pkgver}.tar.gz")
sha256sums=("065176e1ddc31fdb96af3f7910522573fdace45ff931763b05b1e3ec7797efe9"
            "9e1265898618f3d55ad022b5dd932b8bdd0752eb042a3b387fe1a2ab6996f494")

# Modify depends for the arch type
if [ "$CARCH" = "x86_64" ]
then
    depends+=("lib32-gcc-libs" "lib32-glibc" "lib32-glu" "lib32-libx11" "lib32-libxau" "lib32-libxcb" "lib32-libxcursor" "lib32-libxdmcp" "lib32-libxext" "lib32-libxfixes" "lib32-libxrandr" "lib32-libxrender" "lib32-libgl")
else
    depends+=("gcc-libs" "gcc-libs-multilib" "glibc" "glu" "libx11" "libxau" "libxcb" "libxcursor" "libxdmcp" "libxext" "libxfixes" "libxrandr" "libxrender" "libgl")
fi

# Disable compression of the package
PKGEXT=".pkg.tar"

package() {
    # Binaries
    if [ "$CARCH" = "x86_64" ]
    then
        install -Dm755 "$srcdir/Hand of Fate/game/Hand of Fate.x86_64" "$pkgdir/opt/$pkgname/game/Hand of Fate"
    else
        install -Dm755 "$srcdir/Hand of Fate/game/Hand of Fate.x86" "$pkgdir/opt/$pkgname/game/Hand of Fate"
    fi

    # Data
    # Hardlink files to save the disk space and time spent copying them (they are large)
    cp -Ral -t "$pkgdir/opt/$pkgname/game/" "$srcdir/Hand of Fate/game/Hand of Fate_Data"
    find "$pkgdir/opt/$pkgname/game/Hand of Fate_Data" -type d -print0 | xargs -0 chmod 755
    find "$pkgdir/opt/$pkgname/game/Hand of Fate_Data" -type f -print0 | xargs -0 chmod 644

    # Docs
    install -m755 -d "$pkgdir/opt/$pkgname/docs"
    install -m644 -t "$pkgdir/opt/$pkgname/docs" \
        "$srcdir/Hand of Fate/docs/End User License Agreement.txt"

    # Icon
    install -m644 -t "$pkgdir/opt/$pkgname/" "$srcdir/Hand of Fate/support/gog-hand-of-fate.png"

    #
    # System integration
    #

    # /bin
    install -m755 -d "$pkgdir/usr/bin/"
    ln -s "/opt/$pkgname/game/Hand of Fate" "$pkgdir/usr/bin/$pkgname"

    # License
    install -m755 -d "$pkgdir/usr/share/licenses/$pkgname/"
    ln -s "/opt/$pkgname/docs/End User License Agreement.txt" "$pkgdir/usr/share/licenses/$pkgname/EULA"

    # Icon
    install -m755 -d "$pkgdir/usr/share/pixmaps/"
    ln -s "/opt/$pkgname/gog-hand-of-fate.png" "$pkgdir/usr/share/pixmaps/${pkgname}.png"

    # .desktop File
    install -m755 -d "$pkgdir/usr/share/applications/"
    install -m644 -t "$pkgdir/usr/share/applications/" "$srcdir/${pkgname}.desktop"

    # Doc
    install -m755 -d "$pkgdir/usr/share/doc/"
    ln -s "/opt/$pkgname/docs" "$pkgdir/usr/share/doc/$pkgname"
}
