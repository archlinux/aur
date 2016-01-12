# Maintainer: Alex Szczuczko <alex@szc.ca>

pkgname=wasteland2 #-gog ???
pkgver=2.2.0.4
pkgrel=2
pkgdesc="The Director's Cut of the sequel to an adventure in post-nuclear America"
arch=("x86_64")
url="https://wasteland.inxile-entertainment.com/store"
license=("custom:commercial")
depends=('glibc' 'glu' 'libx11' 'libxau' 'libxcb' 'libxcursor' 'libxdmcp' 'libxext' 'libxfixes' 'libxrandr' 'libxrender' 'libgl')
source=("${pkgname}.desktop"
        "gog_wasteland_2_director_s_cut_${pkgver}.sh::file://gog_wasteland_2_director_s_cut${pkgver}.sh")
# bsdtar doesn't seem to like this .sh
noextract=("gog_wasteland_2_director_s_cut_${pkgver}.sh")
sha256sums=("1400b3e11c34cbfc57e3b5cba9501a3319ddb57f066d9d09bb7799a59fb0efc0"
            "5746e6e66349de3505b329bd6949c1434ae43ec7b0d98790144903fa9b79e34a")

# Disable compression of the package
PKGEXT='.pkg.tar'

prepare() {
    unzip -qd "$srcdir" "$srcdir/gog_wasteland_2_director_s_cut_${pkgver}.sh" || true
    mv "$srcdir/data/noarch" "$srcdir/Wasteland 2"
}

package() {
    # Binaries
    install -Dm755 "$srcdir/Wasteland 2/game/WL2" "$pkgdir/opt/$pkgname/game/WL2"

    # Data
    # Hardlink files to save the disk space and time spent copying them (they are very large)
    cp -Ral -t "$pkgdir/opt/$pkgname/game/" "$srcdir/Wasteland 2/game/WL2_Data"
    find "$pkgdir/opt/$pkgname/game/WL2_Data" -type d -print0 | xargs -0 chmod 755
    find "$pkgdir/opt/$pkgname/game/WL2_Data" -type f -print0 | xargs -0 chmod 644

    # Docs
    install -m755 -d "$pkgdir/opt/$pkgname/docs/"
    find "$srcdir/Wasteland 2/docs/" -maxdepth 1 -type f -print0 | \
        xargs -0 install -m644 -t "$pkgdir/opt/$pkgname/docs/"

    # Icon
    install -m755 -d "$pkgdir/opt/$pkgname/"
    install -m644 -t "$pkgdir/opt/$pkgname/" "$srcdir/Wasteland 2/support/icon.png"

    #
    # System integration
    #

    # /bin
    install -m755 -d "$pkgdir/usr/bin/"
    ln -s "/opt/$pkgname/game/WL2" "$pkgdir/usr/bin/$pkgname"

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
