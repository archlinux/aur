# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=dmde
pkgver=4.4.0.828
pkgrel=1
pkgdesc="DM Disk Editor and Data Recovery Software"
arch=('x86_64')
url="https://dmde.com/"
license=('custom')
depends=('gtk2' 'glib2' 'pango' 'cairo' 'gdk-pixbuf2' 'libx11')
makedepends=('unzip')
provides=('dmde-linux')
conflicts=('dmde-linux' 'dmde-cli')
options=('!strip' '!debug')
source=("dmde-${pkgver}.zip::https://dmde.com/download/dmde-${pkgver//./-}-lin64-gui.zip"
        "dmde.desktop")
sha256sums=('dee19e2774f38052b65a46568f8f7c3c34dc638b4c6abe12913238b07e2a3fe0'
            '0542f9d24d7f81b71d61d9d6b45d3adc42383f646b0cc9c9c5468c2a7c88cb9f')
noextract=("dmde-${pkgver}.zip")

pkgver() {
    curl -s https://dmde.com/ru/download.html | 
    grep -o 'dmde-[0-9-]\+-lin64-gui.zip' | 
    head -1 | 
    sed -E 's/dmde-([0-9-]+)-lin64-gui.zip/\1/; s/-/./g'
}

package() {
    install -d "$pkgdir/opt/dmde"
    unzip -q "$srcdir/dmde-${pkgver}.zip" -d "$pkgdir/opt/dmde"

    # Install wrapper
    install -dm755 "$pkgdir/usr/bin"
    echo '#!/bin/sh' > "$pkgdir/usr/bin/dmde"
    echo 'exec /opt/dmde/dmde "$@"' >> "$pkgdir/usr/bin/dmde"
    chmod 755 "$pkgdir/usr/bin/dmde"

    # Install License
    install -Dm644 "$pkgdir/opt/dmde/eula.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    
    # Fix permissions
    chmod 755 "$pkgdir/opt/dmde/dmde"
    chmod 755 "$pkgdir/opt/dmde/dmde-su"

    # Install desktop file
    install -Dm644 "$srcdir/dmde.desktop" "$pkgdir/usr/share/applications/dmde.desktop"

    # Install icon
    install -Dm644 "$pkgdir/opt/dmde/man_en/642.png" "$pkgdir/usr/share/pixmaps/dmde.png"
}


