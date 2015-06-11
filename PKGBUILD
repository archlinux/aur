# Maintainer: Mathieu OTHACEHE <m.othacehe@gmail.com>
# Contributor: schlaefer <schlaefer[at]gamez-planet.org> 

pkgname=fretsonfire-svn
pkgver=178
pkgrel=1
pkgdesc="A game of musical skill and fast fingers. Play guitar with the keyboard as accurately as possible, svn version"
url="http://fretsonfire.sourceforge.net/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('python2-pygame' 'python2-opengl' 'python2-pillow' 'python2-numpy')
optdepends=('glew: Used for render-to-texture support' 
    'pyogg: Used for streaming OGG files from the disk'
    'vorbis-tools: Used to import Guitar Hero files')
[ "$CARCH" = "i686" ] && optdepends[3]='psyco: Used for speed optimization'
makedepends=('subversion')
conflicts=('fretsonfire')

svntrunk=https://fretsonfire.svn.sourceforge.net/svnroot/fretsonfire/trunk
svnmod=fretsonfire

source=($svnmod.desktop
        $svnmod.sh
        $svnmod.png)

md5sums=('f7101049f9f0ad882c52014b31284c40'
	 'efdf3d9f7bcc37f7a8aa27d47bcc239a'
         '66668cad0211bf4e6ab1bd5efa8f65bf')

build() {

    #Grab the sources with svn
    cd $srcdir
    if [ -d $svnmod/.svn ]; then
	(cd $svnmod && svn up -r $pkgver) || return 1
    else
	svn co $svntrunk --config-dir ./ -r $pkgver $svnmod || return 1
    fi
    msg "SVN checkout done"

    cd $srcdir/$svnmod/

    # Patching Texture.py
    sed -i 's/import Image/try:\n  from PIL import Image\nexcept ImportError:\n  import Image/' src/Texture.py
    sed -i 's/import PngImagePlugin/try:\n  from PIL import PngImagePlugin\nexcept ImportError:\n  import PngImagePlugin/' src/Texture.py
}

package() {

    cd $srcdir/$svnmod/

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
    install -Dm 644 $srcdir/$svnmod.desktop $pkgdir/usr/share/applications/$svnmod.desktop
    install -Dm 644 $srcdir/$svnmod.png $pkgdir/usr/share/pixmaps/$svnmod.png
    install -Dm 755 $srcdir/$svnmod.sh $pkgdir/usr/bin/$svnmod    
}
