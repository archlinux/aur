# Maintainer: Timur Bagautdinov <mr.bagautdinov14 at gmail dot com>

pkgname="stardew-valley"
pkgver=1.6.15
pkgrel=2
pkgdesc="You’ve inherited your grandfather’s old farm plot in Stardew Valley.
Armed with hand-me-down tools and a few coins, you set out to begin your new
life."
url="https://stardewvalley.net"
license=("custom")
arch=('x86_64')
options=("!strip" "!debug")
depends=("glibc" "gcc-libs" "openal" "sdl2-compat")
makedepends=("icoextract" "imagemagick")
conflicts=("gog-stardew-valley")
source=(
    "stardew-valley.desktop"
    "https://archive.org/download/stardew-valley-v-1.5.6-fix-3-linux-gog-archive-built-in-libs/stardew_valley_1_6_15_24357_8705766150_78675.sh"
)
sha256sums=("53e79d4fff3ddb79ed060a4289d3f6ab2c3bdd9ec04edec502c503618bc20a72"
            "9aae7496d119289f1617d6a9c3d749f37cd32cd13e34d320015abc2c1b5570ef")

prepare() {
    # Icon
    icoextract "$srcdir/data/noarch/game/Stardew Valley.dll" "$srcdir/data/noarch/game/Stardew Valley.ico"
    magick "$srcdir/data/noarch/game/Stardew Valley.ico" "$srcdir/data/noarch/game/Stardew Valley.png"
    magick "$srcdir/data/noarch/game/Stardew Valley-0.png" -scale 1024x1024 "$srcdir/data/noarch/game/stardew-valley.png"

    # Removing built-in librariers that doesn't required
    for file in "libopenal.so.1" "libopenal.1.dylib" "libSDL2-2.0.so.0" "libSDL2-2.0.0.dylib" "libGalaxy64.so" "libGalaxyCSharpGlue.so" "Galaxy64.dll" "GalaxyCSharpGlue.dll"; do
        rm "$srcdir/data/noarch/game/$file"
    done
}

package() {
    install -d "$pkgdir/opt/$pkgname"
    install -d "$pkgdir/usr/bin/"
    install -d "$pkgdir/usr/share/applications/"
    install -d "$pkgdir/usr/share/licenses/$pkgname/"
    install -d "$pkgdir/usr/share/pixmaps/"

    # Icon
    install -m 644 "$srcdir/data/noarch/game/stardew-valley.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
    for file in "stardew-valley.png" "Stardew Valley.ico" "Stardew Valley-0.png" "Stardew Valley-1.png"; do
        rm "$srcdir/data/noarch/game/$file"
    done

    # Game
    cp -r "$srcdir/data/noarch/game/"* "$pkgdir/opt/$pkgname/"

    # Link to executable
    ln -s "/opt/$pkgname/Stardew Valley" "$pkgdir/usr/bin/stardew-valley"

    # XDG file
    install -m 644 "$srcdir/stardew-valley.desktop" "$pkgdir/usr/share/applications/stardew-valley.desktop"

    # License
    install -m 644 "$srcdir/data/noarch/docs/End User License Agreement.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
