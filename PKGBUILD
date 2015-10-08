# Maintainer: Alex Szczuczko <alex@szc.ca>

pkgname=shadowrunhongkong-gog
pkgver=2.3.0.5
pkgrel=1
pkgdesc="Harebrained Schemes' third Shadowrun cRPG"
arch=("i686" "x86_64")
url="http://www.gog.com/game/shadowrun_hong_kong"
license=("custom:commercial")
depends_x86_64=("lib32-gcc-libs" "lib32-glibc" "lib32-glu" "lib32-libx11" "lib32-libxau" "lib32-libxcb" "lib32-libxcursor" "lib32-libxdmcp" "lib32-libxext" "lib32-libxfixes" "lib32-libxrender" "lib32-libgl" "lib32-gtk2" "lib32-libpulse")
depends_i686=("gcc-libs" "glibc" "glu" "libx11" "libxau" "libxcb" "libxcursor" "libxdmcp" "libxext" "libxfixes" "libxrender" "libgl" "gtk2" "libpulse")
# For ShadowrunEditor
depends_x86_64+=("lib32-bzip2" "lib32-expat" "lib32-fontconfig" "lib32-freetype2" "lib32-gcc-libs" "lib32-glib2" "lib32-glibc" "lib32-harfbuzz" "lib32-libffi" "lib32-libice" "lib32-libpng" "lib32-libsm" "lib32-libx11" "lib32-libxau" "lib32-libxcb" "lib32-libxdmcp" "lib32-libxext" "lib32-libxrender" "lib32-openssl" "lib32-pcre" "lib32-qt4" "lib32-util-linux" "lib32-zlib")
depends_i686+=("bzip2" "expat" "fontconfig" "freetype2" "gcc-libs" "glib2" "glibc" "harfbuzz" "libffi" "libice" "libpng" "libsm" "libx11" "libxau" "libxcb" "libxdmcp" "libxext" "libxrender" "openssl" "pcre" "qt4" "util-linux" "zlib")
source=("${pkgname}.desktop"
        "gog_shadowrun_hong_kong_${pkgver}.sh::file://gog_shadowrun_hong_kong_${pkgver}.sh")
sha256sums=("d03de9036e08b1fc74b74e01cc4ec6a716649b730140a361e8a19d3b5b433f18"
            "427901f3effa517c3e7bf0fcec26f2ea192bbe2947d897ef73d741cdcf152e58")

# Disable compression of the package
PKGEXT='.pkg.tar'

package() {
    # Binaries
    install -Dm755 "$srcdir/data/noarch/game/SRHK" "$pkgdir/opt/$pkgname/game/SRHK"
    install -m755 "$srcdir/data/noarch/game/ShadowrunEditor" "$pkgdir/opt/$pkgname/game/ShadowrunEditor"

    # Data
    # Hardlink files to save the disk space and time spent copying them (they are large)
    cp -Ral -t "$pkgdir/opt/$pkgname/game/" "$srcdir/data/noarch/game/SRHK_Data"
    find "$pkgdir/opt/$pkgname/game/" -type d -print0 | xargs -0 chmod 755
    find "$pkgdir/opt/$pkgname/game/SRHK_Data" -type f -print0 | xargs -0 chmod 644

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
    ln -s "/opt/$pkgname/game/SRHK" "$pkgdir/usr/bin/$pkgname"

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
