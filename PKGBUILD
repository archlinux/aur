# Contributor: erm67
# Contributor: Stefan Husmann <Stefan-Husmann@t-online.de>
pkgname=xpaint
pkgver=2.9.10.2
pkgrel=4
pkgdesc="A color image editing tool which features most standard \
paint program options."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/sf-xpaint/"
license=('GPL')
depends=('libxaw3dxft' 'libpgf' 'libpng' 'libtiff' 'libxft' 'libxpm' 'openjpeg')
optdepends=('gv: external viewer for PostScript output' 'imagemagick: external viewer for pixel graphics')
source=(http://downloads.sourceforge.net/sourceforge/sf-$pkgname/$pkgname-$pkgver.tar.bz2 git+https://gist.github.com/10018613.git X11app.patch)
md5sums=('68059359a756fea5914bcc541899bc5b' 'SKIP' '10b3d1053a8a9f8d1707fd45b7154b68')
options=('!makeflags')

prepare() {
  cd $srcdir/$pkgname-$pkgver
  [ -L xaw_incdir ] && rm xaw_incdir
  ln -s /usr/include/X11/Xaw3dxft xaw_incdir 
  patch -p1 < $srcdir/X11app.patch
}

build() {
  cd $srcdir/$pkgname-$pkgver
  aclocal 
  XAPPLOADIR=$SHAREDIR/X11 automake --add-missing
  CC=gcc ./configure --prefix=/usr
  make 
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
  install -Dm644 XPaintIcon.xpm $pkgdir/usr/share/pixmaps/XPaintIcon.xpm
  install -Dm644 $srcdir/10018613/$pkgname.desktop \
    $pkgdir/usr/share/applications/$pkgname.desktop
  rm $pkgdir/usr/share/xpaint/XPaintIcon.xpm
}
