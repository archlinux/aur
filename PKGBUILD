# Maintainer: Miguel Aguilar <zodiac_es at yahoo dot es>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Arkham <arkham at archlinux dot us>
# Contributor: Kristoffer Fossgård <kfs1 at online dot no>
# Contributor: Danilo Bargen <aur at dbrgn dot ch>

pkgname=fretsonfire
pkgver=1.3.110
pkgrel=12
pkgdesc="A game of musical skill and fast fingers. Play guitar with the keyboard as accurately as possible."
url="http://fretsonfire.sourceforge.net/"
arch=('any')
license=('GPL')
depends=('python2-pygame' 'python2-opengl' 'python2-pillow' 'python2-numpy')
optdepends=('glew: Used for render-to-texture support' 
            'pyogg: Used for streaming OGG files from the disk'
            'vorbis-tools: Used to import Guitar Hero files')
[ "$CARCH" = "i686" ] && optdepends[3]='psyco: Used for speed optimization'
source=(http://downloads.sourceforge.net/$pkgname/FretsOnFire-$pkgver.tar.gz
        $pkgname.desktop
        $pkgname.sh
        $pkgname.png)
md5sums=('daa7e23ebc8ed5bc78aa5e9f4ca3471e'
         'f7101049f9f0ad882c52014b31284c40'
         'b02a87daf5e7eaa887d9ef375a6c13ea'
         '66668cad0211bf4e6ab1bd5efa8f65bf')

build() {
    cd $srcdir/Frets\ on\ Fire-$pkgver

    # Patching Texture.py
    sed -i 's/import Image/try:\n  from PIL import Image\nexcept ImportError:\n  import Image/' src/Texture.py
    sed -i 's/import PngImagePlugin/try:\n  from PIL import PngImagePlugin\nexcept ImportError:\n  import PngImagePlugin/' src/Texture.py
}

package() {
    # Installing the files
    cd $srcdir/Frets\ on\ Fire-$pkgver
    install -d $pkgdir/usr/share/$pkgname/{bin,data}
	sed -i 's|/usr/bin/python|/usr/bin/python2|g' -i src/FretsOnFire.py
    cp -r src/* $pkgdir/usr/share/$pkgname/bin/
    cp -r data/* $pkgdir/usr/share/$pkgname/data/

    # Removing junk and setting permissions
    cd $pkgdir/usr/share/$pkgname/data
    rm -rf win32/ launcher* Makefile *.svg songs/tutorial/*.svg \
        mods/Chilly/*.svg mods/LightGraphics/*.svg 
    find $pkgdir/usr/share/$pkgname -type f -exec chmod 664 {} + 
    find $pkgdir/usr/share/$pkgname -type d -exec chmod 775 {} + 

    # Installing .desktop, icon and bin
    install -Dm 644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
    install -Dm 644 $srcdir/$pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
    install -Dm 755 $srcdir/$pkgname.sh $pkgdir/usr/bin/$pkgname
}
