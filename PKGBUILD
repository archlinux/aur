# Maintainer: Alex Szczuczko <alex@szc.ca>

pkgname=handoffate-gog
pkgver=2.7.0.9
pkgrel=1
pkgdesc="A hybrid roguelike/action-RPG/deck builder"
arch=("i686" "x86_64")
url="http://www.gog.com/game/hand_of_fate"
license=("custom:commercial")
options=()
depends=("gcc-libs" "gcc-libs-multilib" "glibc" "glu" "libx11" "libxau" "libxcb" "libxcursor" "libxdmcp" "libxext" "libxfixes" "libxrandr" "libxrender" "libgl")
source=("${pkgname}.desktop"
        "launch.sh"
        "gog_hand_of_fate_${pkgver}.sh::file://gog_hand_of_fate_${pkgver}.sh")
sha256sums=("065176e1ddc31fdb96af3f7910522573fdace45ff931763b05b1e3ec7797efe9"
            "6262d1bbe1d7e99fa019905cff634b660466476f7431dcddd37b499790e14485"
            "ec446a2fcc7755179fc8f0ae25ede2cf3ae50bcbb163d7f47aed9ca15334b24f")

# Disable compression of the package
PKGEXT=".pkg.tar"

prepare() {
    ln -s "data/noarch/" "$srcdir/Hand of Fate"
}

package() {
    # Binaries
    if [ "$CARCH" = "x86_64" ]
    then
        install -Dm755 "$srcdir/Hand of Fate/game/Hand of Fate.x86_64" "$pkgdir/opt/$pkgname/game/Hand of Fate"
    else
        install -Dm755 "$srcdir/Hand of Fate/game/Hand of Fate.x86" "$pkgdir/opt/$pkgname/game/Hand of Fate"
    fi
    install -m755 "$srcdir/launch.sh" "$pkgdir/opt/$pkgname/game/launch.sh"

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
    install -m644 -t "$pkgdir/opt/$pkgname/" "$srcdir/Hand of Fate/support/icon.png"

    #
    # System integration
    #

    # /bin
    install -m755 -d "$pkgdir/usr/bin/"
    ln -s "/opt/$pkgname/game/launch.sh" "$pkgdir/usr/bin/$pkgname"

    # License
    install -m755 -d "$pkgdir/usr/share/licenses/$pkgname/"
    ln -s "/opt/$pkgname/docs/End User License Agreement.txt" "$pkgdir/usr/share/licenses/$pkgname/EULA"

    # Icon
    install -m755 -d "$pkgdir/usr/share/pixmaps/"
    ln -s "/opt/$pkgname/icon.png" "$pkgdir/usr/share/pixmaps/${pkgname}.png"

    # .desktop File
    install -m755 -d "$pkgdir/usr/share/applications/"
    install -m644 -t "$pkgdir/usr/share/applications/" "$srcdir/${pkgname}.desktop"

    # Doc
    install -m755 -d "$pkgdir/usr/share/doc/"
    ln -s "/opt/$pkgname/docs" "$pkgdir/usr/share/doc/$pkgname"
}
