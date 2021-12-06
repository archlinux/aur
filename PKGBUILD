# Maintainer: archibald869 <archibald869 at web dot de>

pkgname=freefilesync-bin
_pkgname=freefilesync
pkgver=11.15
pkgrel=1
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
source=(
    dlagent
    "${pkgname}-${pkgver}.tar.gz::${url}/download/FreeFileSync_${pkgver}_Linux.tar.gz"
    FreeFileSync.desktop
    RealTimeSync.desktop
    freefilesync-mime.xml
)
sha256sums=(
    "3b8121fdf7d91d19680b6ff91f6f10ba79193379e1fdad5227d805b4ea65312a"
    "1b22ef0c4683c3f1955ad3c9dc8e532daa51f8a8f9d6e7623cc62c66230a98d7"
    "cf4fc81793572cc3e757e8ac26ce20807ce9c731eef0e96c046038075e2e3ecf"
    "810403667792b732768e7be442f43244c4297df6c4b5decb6d07e04ef13f545a"
    "30d938d1f385ea5c660fc4080d36391267a6e9c01939bd1eb535c5857af256f8"
)
options=(!strip)
install=".install"
DLAGENTS=("https::$PWD/dlagent $url %u %o")

package() {
    install -d "$pkgdir/opt/$_pkgname"

    # extract installer archive from installer binary
    tail -c +38412 "$srcdir/FreeFileSync_${pkgver}_Install.run" > "$srcdir/FreeFileSync_${pkgver}_Install.tar"

    # extract inner archive from installer archive
    tar -xf "$srcdir/FreeFileSync_${pkgver}_Install.tar" FreeFileSync.tar.gz -C "$srcdir"

    # extract inner archive
    tar -xzf "$srcdir/FreeFileSync.tar.gz" -C "$pkgdir/opt/$_pkgname"
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
