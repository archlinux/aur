# Maintainer: Tharre <tharre3@gmail.com>
# Contributor: Alex Szczuczko <alex at szc dot ca>

pkgname=papersplease
_pkgname=papers-please
pkgver=1.1.65
pkgrel=5
pkgdesc="Assume the role of an immigration inspector for the communist state of Arstotzka"
arch=('i686' 'x86_64')
url="http://papersplea.se"
license=('custom:commercial')
depends=('sh' 'hicolor-icon-theme')
depends_x86_64=('lib32-gcc-libs' 'lib32-libgl')
depends_i386=('gcc-libs' 'libgl')
options=(!strip)
source=("$pkgname.desktop"
        "launch-$pkgname.sh"
        "${pkgname}.png"
        "${_pkgname}_${pkgver}_i386.tar.gz::hib://${_pkgname}_${pkgver}_i386.tar.gz")
sha256sums=('478b736281d4d397bcff3972a548dc85bddae49342d561adefa25186310cd5ec'
            'e199745f2158fd04fd70ce463aa57452be3a5d8c9c390970e2cadbe7d2122dd4'
            'e8aaf890dbfa6363f0197892ca2abd5ac4a45918787a8524cf8c99d785000823'
            '50562ad2b01cb7558147cd05de4dc37c02deb2e66fc5d3bff77994785f9551d7')

# Disable compression of the package
PKGEXT='.pkg.tar'

# You can download the Humble Indie Bundle file manually, or you can configure
# DLAGENTS in makepkg.conf to auto-download.
DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Download manually to \"$(pwd)\" or setup hib:// DLAGENT in /etc/makepkg.conf."; exit 1')

package() {
    cd "$srcdir/papers-please/"

    #
    # Create /opt/$pkgname directory
    #

    # Binaries
    install -m755 -d "$pkgdir/opt/$pkgname/"
    install -m755 -t "$pkgdir/opt/$pkgname/" "PapersPlease" "lime.ndll" "regexp.dso" "std.dso" "zlib.dso"

    # Launcher
    install -m755 -t "$pkgdir/opt/$pkgname/" "$srcdir/launch-$pkgname.sh"

    # Text/config files
    install -m644 -t "$pkgdir/opt/$pkgname/" "boot.xml" "LICENSE" "manifest" "README"

    # i18n
    install -m755 -d "$pkgdir/opt/$pkgname/loc/"
    find "loc/" -type f -name '*.zip' -print0 | \
        xargs -0 install -m644 -t "$pkgdir/opt/$pkgname/loc/"

    # Assets
    install -m755 -d "$pkgdir/opt/$pkgname/assets/"
    find "assets/" -maxdepth 1 -type f -print0 | \
        xargs -0 install -m644 -t "$pkgdir/opt/$pkgname/assets/"

    # Music
    install -m755 -d "$pkgdir/opt/$pkgname/assets/music/"
    find "assets/music/" -maxdepth 1 -type f -print0 | \
        xargs -0 install -m644 -t "$pkgdir/opt/$pkgname/assets/music/"

    # Sound
    install -m755 -d "$pkgdir/opt/$pkgname/assets/sound/"
    find "assets/sound/" -type f -name "*.wav" -print0 | \
        xargs -0 install -m644 -t "$pkgdir/opt/$pkgname/assets/sound/"


    #
    # System integration
    #

    # /bin
    install -m755 -d "$pkgdir/usr/bin/"
    ln -s "/opt/$pkgname/launch-$pkgname.sh" "$pkgdir/usr/bin/$pkgname"

    # License
    install -m755 -d "$pkgdir/usr/share/licenses/$pkgname/"
    ln -s "/opt/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Icon
    #install -Dm644 $pkgname.png "$pkgdir/usr/share/icons/128x128/apps/$pkgname.png"
    install -m755 -d "${pkgdir}/usr/share/icons/hicolor/128x128/apps"
    install -m644  "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps"

    # .desktop File
    install -m755 -d "$pkgdir/usr/share/applications/"
    install -m644 -t "$pkgdir/usr/share/applications/" "$srcdir/$pkgname.desktop"
}
