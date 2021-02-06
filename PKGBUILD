# Maintainer: archibald869 <archibald869 at web dot de>

pkgname=freefilesync-bin
_pkgname=freefilesync
pkgver=11.6
pkgrel=2
pkgdesc="Folder comparison and synchronization"
arch=("i686" "x86_64")
url="https://freefilesync.org"
license=("GPL3")
provides=("freefilesync")
conflicts=("freefilesync")
depends=(
    gtk2
    libxxf86vm
)
depends_i686=(
    lib32-atk
    lib32-fontconfig
    lib32-gdk-pixbuf2
    lib32-libsm
    lib32-libx11
    lib32-pango
)
makedepends=(expect)
source=(
    dlagent
    "${pkgname}-${pkgver}.tar.gz::${url}/download/FreeFileSync_${pkgver}_Linux.tar.gz"
    FreeFileSync.desktop
    RealTimeSync.desktop
    freefilesync-mime.xml
    install.exp
)
sha256sums=(
    "3b8121fdf7d91d19680b6ff91f6f10ba79193379e1fdad5227d805b4ea65312a"
    "85a86c2c8466497f868d131a64949ef8902155f735de74e2d0701825631c1378"
    "cf4fc81793572cc3e757e8ac26ce20807ce9c731eef0e96c046038075e2e3ecf"
    "810403667792b732768e7be442f43244c4297df6c4b5decb6d07e04ef13f545a"
    "30d938d1f385ea5c660fc4080d36391267a6e9c01939bd1eb535c5857af256f8"
    "22314c6b42a322abba9f8ebde255e011219748b3b6a2543962f07da76f778cf1"
)
options=(!strip)
install=".install"
DLAGENTS=("https::$PWD/dlagent $url %u %o")

package() {
    install -d "$pkgdir/opt/$_pkgname"

    # invalidate sudo cache to prevent installer from making changes to the system
    sudo -k 2>/dev/null

    # run installer
    ./install.exp "$srcdir/FreeFileSync_${pkgver}_Install.run" "$pkgdir/opt/$_pkgname"
    chown -R root:root "$pkgdir/opt/$_pkgname"

    # documentation
    install -d "$pkgdir/usr/share/doc/$_pkgname"
    ln -sf "/opt/$_pkgname/User Manual.pdf" "$pkgdir/usr/share/doc/$_pkgname/User_Manual.pdf"

    # license
    install -d "$pkgdir/usr/share/licenses/$_pkgname"
    ln -sf "/opt/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"

    # MIME types
    install -Dm644 freefilesync-mime.xml "$pkgdir/usr/share/mime/packages/freefilesync-mime.xml"

    # desktop launcher for FreeFileSync
    install -Dm644 "$pkgdir/opt/$_pkgname/Resources/FreeFileSync.png" "$pkgdir/usr/share/pixmaps/FreeFileSync.png"
    install -Dm644 FreeFileSync.desktop "$pkgdir/usr/share/applications/FreeFileSync.desktop"

    # desktop launcher for RealTimeSync
    install -Dm644 "$pkgdir/opt/$_pkgname/Resources/RealTimeSync.png" "$pkgdir/usr/share/pixmaps/RealTimeSync.png"
    install -Dm644 RealTimeSync.desktop "$pkgdir/usr/share/applications/RealTimeSync.desktop"
}
