# Maintainer: a-development <a-development+archpkg@posteo.de>
pkgname=keyblox
pkgver=1.07
pkgrel=1
pkgdesc="A challenging puzzle game inspired by Tetris: The Grand Master series, designed by DDRKirby(ISQ)."
arch=('x86_64')
url="https://sites.google.com/site/ddrkirby/coding-projects/keyblox"
license=('Apache 2.0')
depends=('glibc')
source=("https://ddrkirby.com/games/key-blox/KeyBlox_v1_07_linux.tar.gz")
sha256sums=('ca118627aea6d95d8935599c3ad78a0a25d1618e08cb903c1dd5b773b42e532e')

package() {
    cd "$srcdir/KeyBlox"

    # Create /opt/keyblox directory and install all files
    install -d "$pkgdir/opt/keyblox"
    cp -r . "$pkgdir/opt/keyblox/"

    # Create an empty KeyBlox.ini if it doesn't exist
    if [ ! -f "$pkgdir/opt/keyblox/KeyBlox.ini" ]; then
        touch "$pkgdir/opt/keyblox/KeyBlox.ini"
    fi

    # Set write permissions for KeyBlox.ini
    chmod 666 "$pkgdir/opt/keyblox/KeyBlox.ini"

    # Ensure /opt/keyblox is writable
    chmod 755 "$pkgdir/opt/keyblox"

    # Create a launcher script in /usr/bin
    install -Dm755 /dev/null "$pkgdir/usr/bin/keyblox"
    echo '#!/bin/bash' > "$pkgdir/usr/bin/keyblox"
    echo '/opt/keyblox/KeyBlox "$@"' >> "$pkgdir/usr/bin/keyblox"
    chmod +x "$pkgdir/usr/bin/keyblox"

    # Create a desktop entry for the game
    install -Dm644 /dev/null "$pkgdir/usr/share/applications/keyblox.desktop"
    cat <<EOF > "$pkgdir/usr/share/applications/keyblox.desktop"
[Desktop Entry]
Name=KeyBlox
Exec=/usr/bin/keyblox
Icon=/opt/keyblox/img/icon.png
Type=Application
Categories=Game;
EOF
}
