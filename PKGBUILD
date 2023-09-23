# Maintainer: archibald869 <archibald869 at web dot de>

pkgname=freefilesync-bin
_pkgname=freefilesync
pkgver=13.0
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
    lib32-at-spi2-core
    lib32-gdk-pixbuf2
    lib32-libsm
    lib32-pango
)
source=(
    dlagent
    "${pkgname}-${pkgver}.tar.gz::${url}/download/FreeFileSync_${pkgver}_Linux.tar.gz"
)
sha256sums=(
    "21ad62ebf8659bb49a27d1cb1ff29fb7073f206a0ebd4c44340a9afa2b7da218"
    "0d0ad0892edaa4867827bccd10ba99c35dbcc469e0d9162e5b9298bc42767917"
)
options=(!strip)
install=".install"
DLAGENTS=("https::$PWD/dlagent $url %u %o")

package() {
    install -d "$pkgdir/opt/$_pkgname"

    # extract installer archive from installer binary
    offset=$(grep -abo -m 1 -F "<FFS_TAR_START>" "$srcdir/FreeFileSync_${pkgver}_Install.run" | cut -d : -f 1)
    offset=$((offset + 16))
    tail -c +$offset "$srcdir/FreeFileSync_${pkgver}_Install.run" > "$srcdir/FreeFileSync_${pkgver}_Install.tar"

    # extract inner archive, freefilesync-mime.xml and .desktop files from installer archive
    tar -xf "$srcdir/FreeFileSync_${pkgver}_Install.tar" -C "$srcdir" --wildcards \
        FreeFileSync.tar.gz \
        freefilesync-mime.xml \
        '*.desktop'

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
    install -Dm644 -t "$pkgdir/usr/share/mime/packages/" "$srcdir/freefilesync-mime.xml"

    # icons
    install -Dm644 -t "$pkgdir/usr/share/pixmaps/" \
        "$pkgdir/opt/$_pkgname/Resources/FreeFileSync.png" \
        "$pkgdir/opt/$_pkgname/Resources/RealTimeSync.png"

    # desktop launchers
    for tmpl in "$srcdir"/*.template.desktop; do
        f="${tmpl/.template/}"
        # eliminate FFS_INSTALL_PATH and fix quoting of Exec command
        new='Exec=/bin/bash -c '"'"'paths=(%F); cd "$(dirname "${paths[0]}")"; "/opt/freefilesync/\1" "${paths[@]}"'"'"
        sed -E -e 's#^Exec=.+FFS_INSTALL_PATH/([^\\"]+)\\".+$'"#$new#" \
            -e 's#^(Exec=")FFS_INSTALL_PATH/([^"]+")#\1/opt/freefilesync/\2#' \
            -e 's#^(Icon="?)FFS_INSTALL_PATH/Resources/#\1#' \
            "$tmpl" > "$f"
        install -Dm644 -t "$pkgdir/usr/share/applications/" "$f"
    done
}
