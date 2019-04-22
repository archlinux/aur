# Maintainer: Moviuro <moviuro+aur at gmail dot com>
# Inspired by work by Alex Szczuczko <alex@szc.ca> on shadowrunhongkong-gog

pkgname=shadowrundragonfall-gog
# This is the gog-11 version
pkgver=2.6.0.11
pkgrel=2
pkgdesc="Harebrained Schemes' second Shadowrun cRPG"
arch=("i686" "x86_64")
url="https://www.gog.com/game/shadowrun_dragonfall_directors_cut"
license=("custom:commercial")
depends_x86_64=("lib32-gcc-libs" "lib32-glibc" "lib32-glu" "lib32-libx11" "lib32-libxau" "lib32-libxcb" "lib32-libxcursor" "lib32-libxdmcp" "lib32-libxext" "lib32-libxfixes" "lib32-libxrender" "lib32-libgl" "lib32-gtk2" "lib32-libpulse")
depends_i686=("gcc-libs" "glibc" "glu" "libx11" "libxau" "libxcb" "libxcursor" "libxdmcp" "libxext" "libxfixes" "libxrender" "libgl" "gtk2" "libpulse")
# More dependencies for ShadowrunEditor, but didn't check; please contact me
#depends_x86_64+=("lib32-bzip2" "lib32-expat" "lib32-fontconfig" "lib32-freetype2" "lib32-gcc-libs" "lib32-glib2" "lib32-glibc" "lib32-harfbuzz" "lib32-libffi" "lib32-libice" "lib32-libpng" "lib32-libsm" "lib32-libx11" "lib32-libxau" "lib32-libxcb" "lib32-libxdmcp" "lib32-libxext" "lib32-libxrender" "lib32-openssl" "lib32-pcre" "lib32-qt4" "lib32-util-linux" "lib32-zlib")
#depends_i686+=("bzip2" "expat" "fontconfig" "freetype2" "gcc-libs" "glib2" "glibc" "harfbuzz" "libffi" "libice" "libpng" "libsm" "libx11" "libxau" "libxcb" "libxdmcp" "libxext" "libxrender" "openssl" "pcre" "qt4" "util-linux" "zlib")
# requires aur/lgogdownloader or the game file directly next to the PKGBUILD
#DLAGENTS+=('gogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')
source=("${pkgname}.desktop"
        "gog_shadowrun_dragonfall_director_s_cut_${pkgver}.sh::gogdownloader://shadowrun_dragonfall_directors_cut/en3installer2")
sha256sums=("942f8ef0ba65091c2018a75f0e656b787f163aa6d1884626d521a1439c1cff30"
            "a597b85b76b8832d998483e9334d901d7a4a235e448f5770a555fb1fc6ca440a")

# Disable compression of the package
PKGEXT='.pkg.tar'

package() {
    # Binaries
    install -Dm755 "$srcdir/data/noarch/game/Dragonfall" "$pkgdir/opt/$pkgname/game/Dragonfall"
    install -m755 "$srcdir/data/noarch/game/ShadowrunEditor" "$pkgdir/opt/$pkgname/game/ShadowrunEditor"

    # Data
    # Hardlink files to save the disk space and time spent copying them (they are large)
    cp -Ral -t "$pkgdir/opt/$pkgname/game/" "$srcdir/data/noarch/game/Dragonfall_Data"
    find "$pkgdir/opt/$pkgname/game/" -type d -print0 | xargs -0 chmod 755
    find "$pkgdir/opt/$pkgname/game/Dragonfall_Data" -type f -print0 | xargs -0 chmod 644

    # Docs
    install -m755 -d "$pkgdir/opt/$pkgname/docs/"
    find "$srcdir/data/noarch/docs/" -maxdepth 1 -type f -print0 | \
        xargs -0 install -m644 -t "$pkgdir/opt/$pkgname/docs/"

    # Icon
    install -m755 -d "$pkgdir/opt/$pkgname/"
    install -m644 -t "$pkgdir/opt/$pkgname/" "$srcdir/data/noarch/support/icon.png"

    #
    # System integration
    #

    # /bin
    install -m755 -d "$pkgdir/usr/bin/"
    ln -s "/opt/$pkgname/game/Dragonfall" "$pkgdir/usr/bin/$pkgname"

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
