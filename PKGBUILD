# Maintainer: Alex Szczuczko <alex@szc.ca>

pkgname=thiswarofmine-gog
pkgver=2.5.0.7
pkgrel=1
pkgdesc="Experience war not as a soldier, but as a group of civilians in a besieged city."
arch=("i686" "x86_64")
url="http://www.gog.com/game/this_war_of_mine"
license=("custom:commercial")
options=(!strip)
depends_x86_64=("lib32-openal" "lib32-gcc-libs" "lib32-glibc" "lib32-libx11" "lib32-libxau" "lib32-libxcb" "lib32-libxdmcp" "lib32-libxext" "lib32-libgl")
depends_i686=("openal" "gcc-libs" "glibc" "libx11" "libxau" "libxcb" "libxdmcp" "libxext" "libgl")
source=("${pkgname}.desktop"
        "launch-thiswarofmine.sh"
        "gog_this_war_of_mine_${pkgver}.sh::file://gog_this_war_of_mine_${pkgver}.sh")
sha256sums=("ce9720a6f72402c354bfc12dace96609b847c96c496c2f706080a3696d38ae4e"
            "823c0c5c01240b29752b03a978a49a7e710f5ed4f7e1da2f31d649c47ea6f236"
            "68205de4f077f8fc33ab9928b8cd19875392968f6bc89a17924e28e83c6a0ad4")

# Disable compression of the package
PKGEXT='.pkg.tar'

package() {
    # Data
    install -d "$pkgdir/opt/$pkgname/"
    # Hardlink files to save the disk space and time spent copying them (they are large)
    cp -Ral -t "$pkgdir/opt/$pkgname/" "$srcdir/data/noarch/game/."
    find "$pkgdir/opt/$pkgname/" -type d -print0 | xargs -0 chmod 755
    find "$pkgdir/opt/$pkgname/" -type f -print0 | xargs -0 chmod 644

    # Binaries
    chmod 775 "$pkgdir/opt/$pkgname/KosovoLinux"
    ln -fs "/usr/lib32/libopenal.so" "$pkgdir/opt/$pkgname/libOpenAL.so"

    # Launcher
    install -m755 -t "$pkgdir/opt/$pkgname/" "$srcdir/launch-thiswarofmine.sh"

    # Docs
    install -m755 -d "$pkgdir/opt/$pkgname/docs"
    install -m644 -t "$pkgdir/opt/$pkgname/docs" \
        "$srcdir/data/noarch/docs/End User License Agreement.txt"

    # Icon
    install -m644 -t "$pkgdir/opt/$pkgname/" "$srcdir/data/noarch/support/icon.png"

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
    ln -s "/opt/$pkgname/icon.png" "$pkgdir/usr/share/pixmaps/${pkgname}.png"

    # .desktop File
    install -m755 -d "$pkgdir/usr/share/applications/"
    install -m644 -t "$pkgdir/usr/share/applications/" "$srcdir/${pkgname}.desktop"

    # Doc
    install -m755 -d "$pkgdir/usr/share/doc/"
    ln -s "/opt/$pkgname/docs" "$pkgdir/usr/share/doc/$pkgname"
}
