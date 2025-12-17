# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=dmde
pkgver=4.4.0.828
pkgrel=5
pkgdesc="DM Disk Editor and Data Recovery Software"
arch=('x86_64')
url="https://dmde.com/"
license=('custom')
depends=('gtk2' 'glib2' 'pango' 'cairo' 'gdk-pixbuf2' 'libx11' 'polkit')
makedepends=('unzip')
provides=('dmde-linux')
conflicts=('dmde-linux' 'dmde-cli')
options=('!strip' '!debug')
source=("dmde-${pkgver}.zip::https://dmde.com/download/dmde-${pkgver//./-}-lin64-gui.zip"
        "dmde.desktop"
        "dmde.png")
sha256sums=('dee19e2774f38052b65a46568f8f7c3c34dc638b4c6abe12913238b07e2a3fe0'
            'c631d99b9da19d5fb15e294e8054ee6233b853a1526fcb7ee99c7d2b894ef2be'
            'f84d392bd8a60bbe2e8820f8d0f184d20ee6f8e9bd8be430f772b84c03beda12')
noextract=("dmde-${pkgver}.zip")

latestver() {
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
    echo 'if [ "$(id -u)" -ne 0 ]; then' >> "$pkgdir/usr/bin/dmde"
    echo '    if command -v pkexec >/dev/null 2>&1; then' >> "$pkgdir/usr/bin/dmde"
    echo '        exec pkexec env DISPLAY=$DISPLAY XAUTHORITY=$XAUTHORITY "$0" "$@"' >> "$pkgdir/usr/bin/dmde"
    echo '    elif command -v sudo >/dev/null 2>&1; then' >> "$pkgdir/usr/bin/dmde"
    echo '        exec sudo "$0" "$@"' >> "$pkgdir/usr/bin/dmde"
    echo '    fi' >> "$pkgdir/usr/bin/dmde"
    echo 'fi' >> "$pkgdir/usr/bin/dmde"
    echo 'cd /opt/dmde && exec ./dmde "$@"' >> "$pkgdir/usr/bin/dmde"
    chmod 755 "$pkgdir/usr/bin/dmde"

    # Install License
    install -Dm644 "$pkgdir/opt/dmde/eula.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    
    # Fix permissions
    chmod 755 "$pkgdir/opt/dmde/dmde"
    chmod 755 "$pkgdir/opt/dmde/dmde-su"

    # Install desktop file
    install -Dm644 "$srcdir/dmde.desktop" "$pkgdir/usr/share/applications/dmde.desktop"

    # Install icon
    install -Dm644 "$srcdir/dmde.png" "$pkgdir/usr/share/pixmaps/dmde.png"
}


