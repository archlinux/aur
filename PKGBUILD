# Maintainer: Peter Tseng <pht24 weird-squiggly-symbol cornell dot edu>

pkgname=lockjaw
pkgver=046
pkgrel=5
pkgdesc="Free and highly customizable implementation of Tetris"
arch=('i686' 'x86_64')
url="http://www.pineight.com/lj"
license=('GPL')
depends=('allegro' 'dumb')
install=
source=(http://www.pineight.com/lj/lj$pkgver-src.zip \
lj.dat \
sound.dat \
ljbg.jpg \
ljblocks-sega.bmp \
ljblocks.bmp \
ljconn-sega.bmp \
ljconn.bmp \
bgm.s3m \
bgm-rhythm.s3m \
lockjaw.desktop \
lockjaw.sh \
lockjaw.xpm \
)

md5sums=('8f852954a29562c52edd9a0f75fdc21f'
         'e6f92c47ab53dff5440e83bbda6b7337'
         '09490c4d91f0fa1444cd1aa27d12d60a'
         'b07099d91d0cb17e5cc22f69c8689faf'
         '39d277462a416a47dfc28e7d600b1f02'
         '185cae549fc3b3fd705a27ce23504472'
         '49713494e978c2abbafb314872972650'
         'be8094c194c720dae4c1c3a65feccfc0'
         '0bcd8015218484322ced73b15f312cde'
         '46ce006b7234fb9743a3f249e9640379'
         '93cf3bab87e0c7578fe4387c357785d3'
         '126b05aab43e6147b4d78f83527590c4'
         '974c7311b10cec018989b725f0972bad')

build() {
    cd $srcdir
    # BSDtar sets too many execute bits. Stop this from happening.
    find -type f -exec chmod -x {} \;
    # Allegro gives us jpgalleg now... but the name in the makefile is wrong!
    sed -i "s/jpgal/jpgalleg/" makefile
    make linux
}

package() {
    cd $srcdir
    # Unfortunately, makefile doesn't have make install, so...
    mkdir -m 755 -p $pkgdir/opt/lockjaw

    # Copy all this stuff over.
    install -D -m644 *.dat *.bmp *.jpg bgm* README.html $pkgdir/opt/lockjaw
    install -D -m755 lj $pkgdir/opt/lockjaw
    mkdir $pkgdir/opt/lockjaw/docs
    install -m644 docs/* $pkgdir/opt/lockjaw/docs
    touch $pkgdir/opt/lockjaw/installed.ini

    # Install desktop, launcher sh script.
    install -D -m755 $pkgname.sh $pkgdir/usr/bin/$pkgname
    install -D -m644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
    install -D -m644 $pkgname.xpm $pkgdir/usr/share/pixmaps/$pkgname.xpm
}
