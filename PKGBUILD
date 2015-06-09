# Maintainer: q9 <qqqqqqqqq9 at web dot de>
pkgname=scidb-svn
pkgver=1.0.beta.r1070
pkgrel=1
epoch=2
pkgdesc="Scidb is a Chess Information Data Base SVN-Checkout"
arch=('x86_64' 'i686')
url="http://scidb.sourceforge.net/"
license=('GPL2')
depends=('tk' 'zziplib' 'shared-mime-info'  'minizip' 'libxcursor' 'libsm' 'hicolor-icon-theme' 'desktop-file-utils')
conflicts=('scidb')
options=('!buildflags' '!makeflags' '!debug' )
install=$pkgname.install
source=('scidb-svn::svn://svn.code.sf.net/p/scidb/code/trunk')
md5sums=('SKIP')
pkgver() {
  cd "$srcdir/$pkgname"
      local ver="$(svnversion)"
        printf "%s" "1.0.beta.r${ver//[[:alpha:]]}"
}

prepare() {
  mkdir -p  $srcdir/$pkgname-build/
  cp -r $srcdir/$pkgname/*  $srcdir/$pkgname-build/
}

build() {
	cd "$srcdir/$pkgname-build"
  ./configure --prefix="/usr" --exec-prefix="/usr" --destdir=$pkgdir --mandir=/usr/share/man --enginesdir=/usr/bin --enable-debug-si4=no --enable-freedesktop=no  
  make clean
	make
}

package() {
	cd "$srcdir/$pkgname-build"
  make install
  sed -i -e "s@/usr/local/engines@/usr/share/scidb-beta/engines@g;s@$pkgdir@@g" $pkgdir/usr/bin/scidb-beta
  sed -i -e "s@$pkgdir@@g" $pkgdir/usr/bin/update-scidb-photo-files
}
