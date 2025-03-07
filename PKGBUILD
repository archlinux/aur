# Maintainer: a-development <a-development+archpkg@posteo.de>
pkgname=keyblox
pkgver=1.07
pkgrel=1
pkgdesc="A challenging puzzle game inspired by Tetris: The Grand Master series, designed by DDRKirby(ISQ)."
arch=('x86_64')
url="https://ddrkirby.com/games/key-blox/"
license=('Apache')
depends=('glibc')
source=("https://ddrkirby.com/games/key-blox/KeyBlox_v${pkgver//./_}_linux.tar.gz"
        "https://www.apache.org/licenses/LICENSE-2.0.txt")  # Apache License source
sha256sums=('ca118627aea6d95d8935599c3ad78a0a25d1618e08cb903c1dd5b773b42e532e'
            'cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30')

package() {
    set -e  # Exit immediately if a command exits with a non-zero status

    cd "$srcdir/KeyBlox"

    # Create /opt/keyblox directory and install all files
    install -d "$pkgdir/opt/keyblox"
    cp -r . "$pkgdir/opt/keyblox/"

    # Install Apache License
    install -Dm644 "$srcdir/LICENSE-2.0.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Create a launcher script in /usr/bin
    install -Dm755 /dev/null "$pkgdir/usr/bin/keyblox"
    cat <<EOF > "$pkgdir/usr/bin/keyblox"
#!/bin/bash
exec /opt/keyblox/KeyBlox "\$@"
EOF
    chmod +x "$pkgdir/usr/bin/keyblox"

    # Create a desktop entry for the game
    install -Dm644 /dev/null "$pkgdir/usr/share/applications/keyblox.desktop"
    cat <<EOF > "$pkgdir/usr/share/applications/keyblox.desktop"
[Desktop Entry]
Name=KeyBlox
GenericName=Puzzle Game
Comment=A challenging puzzle game inspired by Tetris: The Grand Master series.
Exec=/usr/bin/keyblox
Icon=/opt/keyblox/img/icon.png
Type=Application
Terminal=false
Categories=Game;PuzzleGame;
EOF
}
