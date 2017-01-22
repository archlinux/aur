# Maintainer: Alex Szczuczko <alex@szc.ca>

pkgname=pillarsofeternity-gog
pkgver=2.15.0.19
pkgrel=1
pkgdesc="A modern RPG in the style of classics like Baldur's Gate"
arch=("x86_64")
url="http://www.gog.com/game/pillars_of_eternity_hero_edition"
license=("custom:commercial")
options=("!emptydirs")
depends=("gcc-libs" "gcc-libs-multilib" "glibc" "glu" "libglvnd" "libx11" "libxau" "libxcb" "libxcursor" "libxdmcp" "libxext" "libxfixes" "libxrandr" "libxrender" "libgl")
# For ScreenSelector
depends+=("gtk2")
source=("${pkgname}.desktop"
        "gog_pillars_of_eternity_${pkgver}.sh::file://gog_pillars_of_eternity_${pkgver}.sh")
# bsdtar doesn't seem to like this .sh
noextract=("gog_pillars_of_eternity_${pkgver}.sh")
sha256sums=("6751ac84acaf2603183ecaa8c5f64c164f0b33aac08426135a898461ce12a655"
            "2c25cf1d650ce651360e4c3d39fb4a5a96fa5da3915e26ec2f867ce028b47e8f")

# Disable compression of the package
PKGEXT=".pkg.tar"

prepare() {
    unzip -qd "$srcdir" "$srcdir/gog_pillars_of_eternity_${pkgver}.sh" || true
    ln -s "data/noarch/" "$srcdir/pe"
}

package() {
    # Binaries
    install -Dm755 "$srcdir/pe/game/PillarsOfEternity" "$pkgdir/opt/$pkgname/game/PillarsOfEternity"

    # Data
    # Hardlink files to save the disk space and time spent copying them (they are large)
    cp -Ral -t "$pkgdir/opt/$pkgname/game/" "$srcdir/pe/game/PillarsOfEternity_Data"
    find "$pkgdir/opt/$pkgname/game/PillarsOfEternity_Data" -type d -print0 | xargs -0 chmod 755
    find "$pkgdir/opt/$pkgname/game/PillarsOfEternity_Data" -type f -print0 | xargs -0 chmod 644

    # Docs
    install -m755 -d "$pkgdir/opt/$pkgname/docs"
    install -m644 -t "$pkgdir/opt/$pkgname/docs" "$srcdir/pe/docs/End User License Agreement.txt"
    install -m644 -t "$pkgdir/opt/$pkgname/docs" "$srcdir/pe/docs/pe-game-manual.pdf"

    # Icon
    install -m644 -t "$pkgdir/opt/$pkgname/" "$srcdir/pe/game/PillarsOfEternity.png"

    #
    # System integration
    #

    # /bin
    install -m755 -d "$pkgdir/usr/bin/"
    ln -s "/opt/$pkgname/game/PillarsOfEternity" "$pkgdir/usr/bin/$pkgname"

    # License
    install -m755 -d "$pkgdir/usr/share/licenses/$pkgname/"
    ln -s "/opt/$pkgname/docs/End User License Agreement.txt" "$pkgdir/usr/share/licenses/$pkgname/EULA"

    # Icon
    install -m755 -d "$pkgdir/usr/share/pixmaps/"
    ln -s "/opt/$pkgname/PillarsOfEternity.png" "$pkgdir/usr/share/pixmaps/${pkgname}.png"

    # .desktop File
    install -m755 -d "$pkgdir/usr/share/applications/"
    install -m644 -t "$pkgdir/usr/share/applications/" "$srcdir/${pkgname}.desktop"

    # Doc
    install -m755 -d "$pkgdir/usr/share/doc/"
    ln -s "/opt/$pkgname/docs" "$pkgdir/usr/share/doc/$pkgname"
}
