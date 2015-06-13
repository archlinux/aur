# Maintainer: SanskritFritz (gmail)
# Maintainer: Laurent Carlier <lordheavym@gmail.com>
# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Arkham <arkham at archlinux dot us>
# Contributor: rabyte <rabyte*gmail>
# Contributor: Andres Blanc <andresblanc@gmail.com>

pkgname=egoboo
pkgver=2.8.1
pkgrel=5
arch=('i686' 'x86_64')
license=('GPL')
pkgdesc="An action RPG/dungeon crawling adventure with OpenGL 3D graphics."
url="http://egoboo.sourceforge.net/"
depends=('sdl_image' 'sdl_mixer' 'sdl_ttf' 'physfs' 'enet' 'mesa')
#makedepends=('sdl_image' 'sdl_mixer' 'sdl_ttf' 'physfs' 'enet' 'mesa')
conflicts=(egoboo-data)
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz"
        "keyboard_directions.patch"
        "$pkgname.png"
        "$pkgname.desktop")

build() {
    cd "$srcdir/egoboo-$pkgver"

    # Patch default depth to 24 and sound
    sed -i -e 's/\[COLOR_DEPTH\] : "32"/\[COLOR_DEPTH\] : "24"/g' \
        -e 's/\[Z_DEPTH\] : "32"/\[Z_DEPTH\] : "24"/g' \
        -e 's/\[OUTPUT_BUFFER_SIZE\] : "2548/\[OUTPUT_BUFFER_SIZE\] : "2048/g' \
        setup.txt

    cd "$srcdir/egoboo-$pkgver/src"

    # fix data paths
    sed -i -e 's#egoboo-2.x#egoboo#g' \
        -e 's#share/games#share#g' \
        -e 's#etc#share#g' \
        -e 's#games#bin#g' \
        game/platform/file_linux.c

    # fix linking
    sed -i -e 's#-lenet#-lenet -lm#g' game/Makefile

    # fix keyboard bug
    patch -p0 --binary < "$srcdir/keyboard_directions.patch"

    make all
}

package() {

    cd "$srcdir/egoboo-$pkgver"

    install -Dm755 src/game/egoboo-2.x $pkgdir/usr/bin/egoboo
    install -d $pkgdir/usr/share/doc
    cp -rf doc/ $pkgdir/usr/share/doc/$pkgname/

    # Copy data and fix permissions
    install -d ${pkgdir}/usr/share/egoboo
    cp -rf controls.txt setup.txt basicdat/ modules/ ${pkgdir}/usr/share/egoboo/
    find ${pkgdir}/usr/share/egoboo -type f -exec chmod 644 {} +

    # Install icon and desktop files
    install -Dm 644 $srcdir/$pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
    install -Dm 644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
}

md5sums=('e6f3130695d297dcd9fe74e50bd59b68'
         'd3eea226065d9a244b59cd960c5c8878'
         '7019f17b607fd45acf0d48ade746326a'
         'b81e0c8f3e0b9d8640d0cfc9b6d320a8')
