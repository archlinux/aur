# Maintainer: Moviuro <moviuro+aur at gmail dot com>

pkgname=dungeons-2-gog
pkgver=2.0.0.1
pkgrel=2
pkgdesc="The Dungeon Lord is back – and this time he’s serious!"
arch=("x86_64")
url="http://www.gog.com/game/dungeons_2"
license=("custom:commercial")
depends=("libx11" "libxcursor" "libxrandr" "libglvnd" "libxext" "libxcb"
         "libxrender" "libxfixes" "libxau" "libxdmcp")
# requires aur/lgogdownloader or the game file directly next to the PKGBUILD
#DLAGENTS+=('gogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')
source=("${pkgname}.desktop"
        "${pkgname}.in"
        "gog_dungeons_2_${pkgver}.sh::gogdownloader://dungeons_2/en3installer1")
sha256sums=("e28ce7cacca9d7585b557f8f946696d93f2640924e74770f82d2841e039310ea"
            "ce8cd95969a904b55ec3626fe0b01d89510a26fece6043eefa4331127d9169f8"
            "e9ab64e2f428201e22b1ee445e559898746b9249335d1c4765b50a40597559aa")

# Disable compression of the package
PKGEXT='.pkg.tar'

package() {
    # Data
    # Hardlink files to save the disk space and time spent copying them (they are large)
    mkdir -p "$pkgdir/opt/$pkgname/game/"
    cp -Ral -t "$pkgdir/opt/$pkgname/game/" "$srcdir/data/noarch/game/"*
    find "$pkgdir/opt/$pkgname/game/" -type d -print0 | xargs -0 chmod 755
    find "$pkgdir/opt/$pkgname/game/" -type f -print0 | xargs -0 chmod 644
    chmod 755 "$pkgdir/opt/$pkgname/game/mono/bin/mono"
    chmod 755 "$pkgdir/opt/$pkgname/game/Dungeons2.x86_64"

    # Remove a pointless broken script
    rm "$pkgdir/opt/$pkgname/game/Dungeons2"

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
    sed "s!@PKGDEST@!/opt/$pkgname/game/!" "$pkgname.in" > "$pkgdir/usr/bin/$pkgname"
    chmod 755 "$pkgdir/usr/bin/$pkgname"

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
